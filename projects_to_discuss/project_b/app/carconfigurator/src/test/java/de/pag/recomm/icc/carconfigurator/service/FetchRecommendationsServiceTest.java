package de.pag.recomm.icc.carconfigurator.service;

import static de.pag.recomm.icc.carconfigurator.TestHelper.loadTestFile;
import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.doReturn;
import static org.mockito.Mockito.when;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.MappingIterator;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.csv.CsvMapper;
import com.fasterxml.jackson.dataformat.csv.CsvSchema;
import de.pag.recomm.icc.carconfigurator.TestHelper;
import de.pag.recomm.icc.carconfigurator.exception.ModelNotLoadableException;
import de.pag.recomm.icc.carconfigurator.filter.CountryPackageOptionFilterFactory;
import de.pag.recomm.icc.carconfigurator.filter.DownSellingOptionFilterFactory;
import de.pag.recomm.icc.carconfigurator.filter.PrFamilyFilterFactory;
import de.pag.recomm.icc.carconfigurator.filter.PrFamilyInformationRaw;
import de.pag.recomm.icc.carconfigurator.filter.SkuPerCountryFilterFactory;
import de.pag.recomm.icc.carconfigurator.filter.SkuPerCountryRaw;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.boot.test.mock.mockito.SpyBean;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.tensorflow.SavedModelBundle;
import org.tensorflow.SessionFunction;
import org.tensorflow.Tensor;
import org.tensorflow.ndarray.FloatNdArray;
import org.tensorflow.ndarray.NdArrays;
import org.tensorflow.ndarray.Shape;
import org.tensorflow.types.TFloat32;
import reactor.core.publisher.Flux;
import reactor.test.StepVerifier;

@RunWith(SpringJUnit4ClassRunner.class)
public class FetchRecommendationsServiceTest {

  private static final String MODEL = "987654";
  private static final String MODEL_CODE_ONLY_GRAPH = "975313";
  private static final String MARKET = "PD";

  private FetchRecommendationsService fetchRecommendationsServiceInPort;

  @Mock
  private SavedModelBundle model;

  @Mock
  private SessionFunction function;

  @MockBean(name = "loadModelFunction")
  private IModelProvider loadModelFunction;

  @MockBean(name = "loadFeatureMappingFunction")
  private IFeatureProvider loadFeatureMappingFunction;

  @MockBean(name = "loadFilterFunction")
  IFilterProvider loadFilterFunction;

  @SpyBean(name = "downSellingOptionFilter")
  private DownSellingOptionFilterFactory downSellingOptionFilterFactory;

  @SpyBean(name = "countryPackageFilter")
  private CountryPackageOptionFilterFactory countryPackageFilter;

  @SpyBean(name = "skuPerCountryFilter")
  private SkuPerCountryFilterFactory skuPerCountryFilter;

  @SpyBean(name = "prFamilyFilter")
  private PrFamilyFilterFactory prFamilyFilter;

  @Before
  public void setUp() throws ModelNotLoadableException, IOException {
    MockitoAnnotations.initMocks(this);

    Map<String, Integer> features = new LinkedHashMap<>();
    features.put("ATEST1", 0);
    features.put("ATEST2", 1);
    features.put("BTEST1", 2);
    features.put("BTEST2", 3);
    features.put("CTEST1", 4);
    features.put("CTEST2", 5);
    features.put("DTEST1", 6);
    features.put("DTEST2", 7);

    Map<Integer, String> featuresInverse = new LinkedHashMap<>();
    featuresInverse.put(0, "ATEST1");
    featuresInverse.put(1, "ATEST2");
    featuresInverse.put(2, "BTEST1");
    featuresInverse.put(3, "BTEST2");
    featuresInverse.put(4, "CTEST1");
    featuresInverse.put(5, "CTEST2");
    featuresInverse.put(6, "DTEST1");
    featuresInverse.put(7, "DTEST2");

    Mockito.when(loadModelFunction.getValue(MODEL)).thenReturn(model);
    Mockito.when(loadModelFunction.getValue(MODEL_CODE_ONLY_GRAPH)).thenReturn(model);

    Mockito.when(loadFeatureMappingFunction.getValue(MODEL)).thenReturn(features);
    Mockito.when(loadFeatureMappingFunction.getKey(MODEL)).thenReturn(featuresInverse);
    Mockito.when(loadFeatureMappingFunction.getValue(MODEL_CODE_ONLY_GRAPH)).thenReturn(null);
    Mockito.when(loadFeatureMappingFunction.getKey(MODEL_CODE_ONLY_GRAPH)).thenReturn(null);

    FloatNdArray result = NdArrays.ofFloats(Shape.of(8, 1));
    result.setFloat(0.3f, 0, 0);
    result.setFloat(0.7f, 1, 0);
    result.setFloat(0.4f, 2, 0);
    result.setFloat(1.0f, 3, 0);
    result.setFloat(0.9f, 4, 0);
    result.setFloat(0.8f, 5, 0);
    result.setFloat(0.6f, 6, 0);
    result.setFloat(0.5f, 7, 0);

    Mockito.doReturn(function).when(model).function(anyString());
    Mockito.doReturn(Map.of("prediction", TFloat32.tensorOf(result))).when(function).call((Map<String, Tensor>) any());

    Set<String> defaultConfig = new HashSet<>();

    ObjectMapper mapper = new ObjectMapper();
    TypeReference<List<PrFamilyInformationRaw>> typeReferenceOptionPackage = new TypeReference<>() {
    };
    InputStream options = loadTestFile("pr_family_iso_code_information.json");
    when(loadFilterFunction.getPrFamilyInformation()).thenReturn(mapper.readValue(options, typeReferenceOptionPackage));
    downSellingOptionFilterFactory = new DownSellingOptionFilterFactory(this.loadFilterFunction);
    countryPackageFilter = new CountryPackageOptionFilterFactory(this.loadFilterFunction);
    prFamilyFilter = new PrFamilyFilterFactory(this.loadFilterFunction);
    doReturn(getSku()).when(loadFilterFunction).getSkuPerCountry();
    skuPerCountryFilter = new SkuPerCountryFilterFactory(this.loadFilterFunction);

    fetchRecommendationsServiceInPort = new FetchRecommendationsService(loadModelFunction, loadFeatureMappingFunction,
        downSellingOptionFilterFactory, countryPackageFilter, skuPerCountryFilter, prFamilyFilter);
  }

  private Map<String, Map<String, Set<String>>> getSku() {
    CsvMapper csvMapper = new CsvMapper();

    CsvSchema csvSchema = csvMapper
        .typedSchemaFor(SkuPerCountryRaw.class)
        .withHeader()
        .withColumnSeparator(',');

    String filePath = "sku_per_country.csv";
    try (InputStream is = TestHelper.loadTestFile(filePath)) {
      MappingIterator<SkuPerCountryRaw> skuCountryIter = csvMapper
          .readerWithTypedSchemaFor(SkuPerCountryRaw.class)
          .with(csvSchema)
          .readValues(is);
      Map<String, Map<String, Set<String>>> skuCountryList = new HashMap<>();
      while (skuCountryIter.hasNext()) {
        SkuPerCountryRaw item = skuCountryIter.next();

        if (skuCountryList.containsKey(item.getCountry())) {
          if (skuCountryList.get(item.getCountry()).containsKey(item.getModelCode())) {
            skuCountryList.get(item.getCountry()).get(item.getModelCode()).add(item.getOptionCode());
          } else {
            Set<String> newSet = new HashSet<>();
            newSet.add(item.getOptionCode());
            skuCountryList.get(item.getCountry()).put(item.getModelCode(), newSet);
          }
        } else {
          Set<String> newSet = new HashSet<>();
          newSet.add(item.getOptionCode());
          Map<String, Set<String>> newMap = new HashMap<>();
          newMap.put(item.getModelCode(), newSet);
          skuCountryList.put(item.getCountry(), newMap);
        }
      }
      return skuCountryList;
    } catch (Exception e) {
      throw new ResourceNotFoundException(e.getMessage());
    }
  }

  @Test
  public void getRecommendations() {
    List<String> input = new ArrayList<>();
    input.add("ATEST1");

    int timestamp = 1;
    int size = 3;

    Flux<Recommendation> result = fetchRecommendationsServiceInPort.getRecommendations(
        MODEL, input, size, "de"
    );

    StepVerifier.create(result)
        .assertNext(r -> assertEquals("BTEST2", r.getOption()))
        .assertNext(r -> assertEquals("CTEST1", r.getOption()))
        .assertNext(r -> assertEquals("CTEST2", r.getOption()))
        .verifyComplete();

    StepVerifier.create(result)
        .assertNext(r -> assertEquals(0.99, r.getProbability(), 0))
        .assertNext(r -> assertEquals(0.89, r.getProbability(), 0.01))
        .assertNext(r -> assertEquals(0.79, r.getProbability(), 0.01))
        .verifyComplete();
  }

  @Test
  public void getRecommendationsUnknownModelCode() {
    List<String> input = new ArrayList<>();

    int timestamp = 1;
    int size = 3;

    Flux<Recommendation> result = fetchRecommendationsServiceInPort.getRecommendations(
        MODEL_CODE_ONLY_GRAPH, input, size, "de"
    );

    StepVerifier.create(result)
        .expectError(ResourceNotFoundException.class)
        .verify();
  }

  @Test
  public void getRecommendationsUnknownModelCodeForFeatureFile() {
    List<String> input = new ArrayList<>();

    int timestamp = 1;
    int size = 3;

    Flux<Recommendation> result = fetchRecommendationsServiceInPort.getRecommendations(
        MODEL_CODE_ONLY_GRAPH, input, size, "de"
    );

    StepVerifier.create(result)
        .expectError(ResourceNotFoundException.class)
        .verify();
  }

  @Test
  public void testProductCategory() throws IOException {

    final String[] names = {"MF44", "M47I", "M1LZ", "M0NA", "M47H"};

    Map<String, Integer> features = new LinkedHashMap<>();
    Map<Integer, String> featuresInverse = new LinkedHashMap<>();

    int i = 0;
    for (String name : names) {
      features.put(name, i);
      featuresInverse.put(i, name);
      i++;
    }

    FloatNdArray result = NdArrays.ofFloats(Shape.of(5, 1));
    result.setFloat(0.780424952507019f, 0, 0);
    result.setFloat(0.6986356973648071f, 1, 0);
    result.setFloat(0.5895460247993469f, 2, 0);
    result.setFloat(0.5236108064651489f, 3, 0);
    result.setFloat(0.41175907850265503f, 4, 0);

    Mockito.doReturn(function).when(model).function(anyString());
    Mockito.doReturn(Map.of("prediction", TFloat32.tensorOf(result))).when(function).call((Map<String, Tensor>) any());

    Mockito.when(loadFeatureMappingFunction.getValue(MODEL)).thenReturn(features);
    Mockito.when(loadFeatureMappingFunction.getKey(MODEL)).thenReturn(featuresInverse);

    List<String> input = new ArrayList<>();
    input.add("IAA");

    Flux<Recommendation> response = fetchRecommendationsServiceInPort.getRecommendations(
        MODEL, input, 8, "de"
    );

    StepVerifier.create(response)
        .assertNext(r -> assertEquals("MF44", r.getOption()))
        .assertNext(r -> assertEquals("M1LZ", r.getOption()))
        .assertNext(r -> assertEquals("M0NA", r.getOption()))
        .verifyComplete();

  }

  @Test
  public void testRemovalOfFeatureRecommendationInDifferentColour() {

    final String[] names = {"CAMT", "CAMU", "CAMV", "CAMW"};

    Map<String, Integer> features = new LinkedHashMap<>();
    Map<Integer, String> featuresInverse = new LinkedHashMap<>();

    int i = 0;
    for (String name : names) {
      features.put(name, i);
      featuresInverse.put(i, name);
      i++;
    }

    FloatNdArray result = NdArrays.ofFloats(Shape.of(4, 1));
    result.setFloat(0.8f, 0, 0);
    result.setFloat(0.7f, 1, 0);
    result.setFloat(0.6f, 2, 0);
    result.setFloat(0.0f, 3, 0);

    Mockito.doReturn(function).when(model).function(anyString());
    Mockito.doReturn(Map.of("prediction", TFloat32.tensorOf(result))).when(function).call((Map<String, Tensor>) any());

    Mockito.when(loadFeatureMappingFunction.getValue(MODEL)).thenReturn(features);
    Mockito.when(loadFeatureMappingFunction.getKey(MODEL)).thenReturn(featuresInverse);

    List<String> input = new ArrayList<>();
    input.add("CAMT");

    Flux<Recommendation> response = fetchRecommendationsServiceInPort.getRecommendations(
        MODEL, input, 8, "de"
    );

    StepVerifier.create(response).verifyComplete();
  }

  @Test
  public void testIfDifferentColourFeaturesAreKeptInRecommendation() {

    final String[] names = {"CAMT", "CAMU", "M0NA"};

    Map<String, Integer> features = new LinkedHashMap<>();
    Map<Integer, String> featuresInverse = new LinkedHashMap<>();

    int i = 0;
    for (String name : names) {
      features.put(name, i);
      featuresInverse.put(i, name);
      i++;
    }

    FloatNdArray result = NdArrays.ofFloats(Shape.of(3, 1));
    result.setFloat(0.8f, 0, 0);
    result.setFloat(0.7f, 1, 0);
    result.setFloat(0.0f, 2, 0);

    Mockito.doReturn(function).when(model).function(anyString());
    Mockito.doReturn(Map.of("prediction", TFloat32.tensorOf(result))).when(function).call((Map<String, Tensor>) any());

    Mockito.when(loadFeatureMappingFunction.getValue(MODEL)).thenReturn(features);
    Mockito.when(loadFeatureMappingFunction.getKey(MODEL)).thenReturn(featuresInverse);

    List<String> input = new ArrayList<>();
    input.add("M0NA");

    Flux<Recommendation> response = fetchRecommendationsServiceInPort.getRecommendations(
        MODEL, input, 8, "de"
    );

    StepVerifier.create(response)
        .assertNext(r -> assertEquals("CAMT", r.getOption()))
        .assertNext(r -> assertEquals("CAMU", r.getOption()))
        .verifyComplete();
  }
}
