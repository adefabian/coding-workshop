package de.pag.recomm.icc.carconfigurator.filter;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import de.pag.recomm.icc.carconfigurator.service.IFilterProvider;
import de.pag.recomm.icc.carconfigurator.service.Recommendation;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import static de.pag.recomm.icc.carconfigurator.TestHelper.loadTestFile;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * @author fabianade (fabian.ade@mhp.com) on 28.10.20.
 */

public class DownSellingOptionFilterFactoryTest {
    @Mock
    private IFilterProvider loadFilterFunction = mock(IFilterProvider.class);
    private DownSellingOptionFilterFactory filter;

    private List<Recommendation> runFilter(String isoCode, String modelcode, List<String> selectedOptions, List<Recommendation> recommendations) {
        return recommendations.stream().filter(filter.create(isoCode, modelcode, selectedOptions)).collect(Collectors.toList());
    }

    @Before
    public void setUp() throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<PrFamilyInformationRaw>> typeReferenceOptionPackage = new TypeReference<>() {
        };
        InputStream options = loadTestFile("pr_family_iso_code_information.json");
        when(loadFilterFunction.getPrFamilyInformation()).thenReturn(mapper.readValue(options, typeReferenceOptionPackage));
        this.filter = new DownSellingOptionFilterFactory(loadFilterFunction);
    }

    @Test
    public void testRecommendationsAreNotDownSells() {

        List<String> selectedOptions = List.of("2TB");
        List<Recommendation> recommendationList = new ArrayList<>();
        recommendationList.add(new Recommendation("2TC", 0.9));

        List<Recommendation> filtered = runFilter("de", "992110", selectedOptions, recommendationList);
        assertTrue(filtered.stream().anyMatch(recommendation -> recommendation.getOption().equals("2TC")));
    }

    @Test
    public void testRecommendationIncludesDownSells() {

        List<String> selectedOptions = List.of("2TC");
        List<Recommendation> recommendationList = new ArrayList<>();
        recommendationList.add(new Recommendation("2TB", 0.9));

        List<Recommendation> filtered = runFilter("de", "992110", selectedOptions, recommendationList);
        assertTrue(filtered.isEmpty());
    }

    @Test
    public void testRecommendationIncludesDownSellsIsoCodeUpperCase() {

        List<String> selectedOptions = List.of("2TC");
        List<Recommendation> recommendationList = new ArrayList<>();
        recommendationList.add(new Recommendation("2TB", 0.9));

        List<Recommendation> filtered = runFilter("DE", "992110", selectedOptions, recommendationList);
        assertTrue(filtered.isEmpty());
    }

    @Test
    public void testIsoCodeAndModelCodeAreLowerCase() {
        List<String> selectedOptions = List.of("44I");
        List<Recommendation> recommendationList = new ArrayList<>();

        recommendationList.add(new Recommendation("F44", 0.9));

        List<Recommendation> filteredPd = runFilter("de", "y1afh1", selectedOptions, recommendationList);
        List<Recommendation> filteredPtw = runFilter("tw", "y1afh1", selectedOptions, recommendationList);
        List<Recommendation> filteredPcna = runFilter("de", "y1afh1", selectedOptions, recommendationList);
        List<Recommendation> filteredPgcn = runFilter("us", "y1afh1", selectedOptions, recommendationList);
        List<Recommendation> filteredPch = runFilter("ch", "y1afh1", selectedOptions, recommendationList);
        List<Recommendation> filteredPcgb = runFilter("gb", "y1afh1", selectedOptions, recommendationList);

        assertTrue(filteredPd.isEmpty());
        assertTrue(filteredPtw.isEmpty());
        assertTrue(filteredPcna.isEmpty());
        assertTrue(filteredPgcn.isEmpty());
        assertTrue(filteredPch.isEmpty());
        assertTrue(filteredPcgb.isEmpty());
    }

    @Test
    public void testRecommendationIncludesMultipleDownSells() {

        List<String> selectedOptions = List.of("638");
        List<Recommendation> recommendationList = new ArrayList<>();

        recommendationList.add(new Recommendation("635", 0.9));
        recommendationList.add(new Recommendation("636", 0.5));

        List<Recommendation> filtered = runFilter("de", "982330", selectedOptions, recommendationList);
        assertTrue(filtered.isEmpty());
    }

    @Test
    public void testRecommendationIncludeDownSellOptionsRecommendationsHavePrefix() {

        List<String> selectedOptions = Arrays.asList("XRD", "XVL", "XHW");
        List<Recommendation> recommendationList = new ArrayList<>();

        recommendationList.add(new Recommendation("M397", 0.9));
        recommendationList.add(new Recommendation("DXVS", 0.5));
        recommendationList.add(new Recommendation("E858", 0.5));
        recommendationList.add(new Recommendation("M398", 0.5));

        List<Recommendation> filtered = runFilter("de", "982330", selectedOptions, recommendationList);
        assertTrue(filtered.isEmpty());
    }

    @Test
    public void testRecommendationIncludeDownSellOptionsRecommendationsHavePrefixSelectedOptionsHavePrefix() {

        List<String> selectedOptions = Arrays.asList("MXRD", "EXVL", "DXHW");
        List<Recommendation> recommendationList = new ArrayList<>();

        recommendationList.add(new Recommendation("M397", 0.9));
        recommendationList.add(new Recommendation("DXVS", 0.5));
        recommendationList.add(new Recommendation("E858", 0.5));
        recommendationList.add(new Recommendation("M398", 0.5));

        List<Recommendation> filtered = runFilter("de", "982330", selectedOptions, recommendationList);
        assertTrue(filtered.isEmpty());
    }

    @Test
    public void testNoDownSellInformationForCountry() {

        List<String> selectedOptions = List.of("396");
        List<Recommendation> recommendationList = new ArrayList<>();
        recommendationList.add(new Recommendation("395", 0.9));

        List<Recommendation> filtered = runFilter("NoCountry", "992110", selectedOptions, recommendationList);
        assertTrue(filtered.stream().anyMatch(recommendation -> recommendation.getOption().equals("395")));
    }

    @Test
    public void testNoDownSellInformationForVehicle() {

        List<String> selectedOptions = List.of("396");
        List<Recommendation> recommendationList = new ArrayList<>();
        recommendationList.add(new Recommendation("395", 0.9));

        List<Recommendation> filtered = runFilter("de", "DeLorean DMC 12", selectedOptions, recommendationList);
        assertTrue(filtered.stream().anyMatch(recommendation -> recommendation.getOption().equals("395")));
    }

    @Test
    public void testDownSellOptionsIsNull() {
        when(loadFilterFunction.getPrFamilyInformation()).thenReturn(List.of());
        filter = new DownSellingOptionFilterFactory(loadFilterFunction);

        List<String> selectedOptions = List.of("9VJ");
        List<Recommendation> recommendationList = new ArrayList<>();
        recommendationList.add(new Recommendation("9VL", 0.9));

        List<Recommendation> filtered = runFilter("de", "982320", selectedOptions, recommendationList);
        assertTrue(filtered.stream().anyMatch(recommendation -> recommendation.getOption().equals("9VL")));
    }

    @Test
    public void testCountryDownSellOptionIsNull() {
        PrFamilyInformation downSellingOptionsModified = filter.getPrFamilyInformation();
        downSellingOptionsModified.setPrFamilyInformation(null);

        List<String> selectedOptions = List.of("9VJ");
        List<Recommendation> recommendationList = new ArrayList<>();
        recommendationList.add(new Recommendation("9VL", 0.9));

        List<Recommendation> filtered = runFilter("de", "982320", selectedOptions, recommendationList);
        assertTrue(filtered.stream().anyMatch(recommendation -> recommendation.getOption().equals("9VL")));
    }

    @Test
    public void testCountryDownSellOptionsVehicleOptionsAreEmpty() {

        String market = "de";
        String vehicleCode = "992110";

        //modify down selling information to fit unit test
        PrFamilyInformation downSellingOptions = filter.getPrFamilyInformation();
        downSellingOptions.getPrFamilyInformation().get(market).put(vehicleCode, List.of());

        List<String> selectedOptions = List.of("9VJ");
        List<Recommendation> recommendationList = new ArrayList<>();
        recommendationList.add(new Recommendation("9VL", 0.9));

        List<Recommendation> filtered = runFilter(market, vehicleCode, selectedOptions, recommendationList);
        assertTrue(filtered.stream().anyMatch(recommendation -> recommendation.getOption().equals("9VL")));
    }

    @Test
    public void testOptionCodesHaveSamePriority() {
        List<String> selectedOptions = List.of("FZ1");
        List<Recommendation> recommendationList = new ArrayList<>();

        recommendationList.add(new Recommendation("FZ5", 0.9));
        recommendationList.add(new Recommendation("FZ4", 0.5));

        List<Recommendation> filtered = runFilter("de", "992110", selectedOptions, recommendationList);
        assertEquals(2, filtered.size());
        assertTrue(filtered.stream().anyMatch(recommendation -> recommendation.getOption().equals("FZ5")));
        assertTrue(filtered.stream().anyMatch(recommendation -> recommendation.getOption().equals("FZ4")));
    }
}
