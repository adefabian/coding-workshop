package de.pag.recomm.icc.carconfigurator.filter;

import static de.pag.recomm.icc.carconfigurator.TestHelper.loadTestFile;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.fasterxml.jackson.databind.MappingIterator;
import com.fasterxml.jackson.dataformat.csv.CsvMapper;
import com.fasterxml.jackson.dataformat.csv.CsvSchema;
import de.pag.recomm.icc.carconfigurator.service.IFilterProvider;
import de.pag.recomm.icc.carconfigurator.service.Recommendation;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;

/*
 * @author coding-workshop
 * @soundtrack soundtrack {Gasolina} - [Daddy Yankee]
 */

public class SkuPerCountryFilterFactoryTest {

  @Mock
  private IFilterProvider loadFilterFunction = mock(IFilterProvider.class);
  private SkuPerCountryFilterFactory filter;

  private List<Recommendation> runFilter(String market, String modelcode, List<Recommendation> recommendations) {
    return recommendations.stream().filter(filter.create(market, modelcode)).collect(Collectors.toList());
  }

  @Before
  public void setUp() throws IOException {
    CsvMapper csvMapper = new CsvMapper();
    CsvSchema csvSchema = csvMapper
        .typedSchemaFor(SkuPerCountryRaw.class)
        .withHeader()
        .withColumnSeparator(',');
    InputStream options = loadTestFile("sku_per_country.csv");
    MappingIterator<SkuPerCountryRaw> skuCountryIter = csvMapper
        .readerWithTypedSchemaFor(SkuPerCountryRaw.class)
        .with(csvSchema)
        .readValues(options);

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
    when(loadFilterFunction.getSkuPerCountry()).thenReturn(skuCountryList);
    this.filter = new SkuPerCountryFilterFactory(loadFilterFunction);
  }

  @Test
  public void testOptionInCountry() {

    List<Recommendation> recommendationList = new ArrayList<>();
    recommendationList.add(new Recommendation("F3H", 0.9));

    List<Recommendation> filtered = runFilter("CA", "9YBAE1", recommendationList);
    assertTrue(filtered.stream().anyMatch(recommendation -> recommendation.getOption().equals("F3H")));
  }

  @Test
  public void testOptionNotInCountry() {

    List<Recommendation> recommendationList = new ArrayList<>();
    recommendationList.add(new Recommendation("F3H", 0.9));

    List<Recommendation> filtered = runFilter("JP", "9YBAE1", recommendationList);
    assertTrue(filtered.isEmpty());
  }


}
