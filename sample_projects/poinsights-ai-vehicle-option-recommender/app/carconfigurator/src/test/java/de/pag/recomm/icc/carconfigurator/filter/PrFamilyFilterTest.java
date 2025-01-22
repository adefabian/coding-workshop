package de.pag.recomm.icc.carconfigurator.filter;

import static de.pag.recomm.icc.carconfigurator.TestHelper.loadTestFile;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import de.pag.recomm.icc.carconfigurator.service.IFilterProvider;
import de.pag.recomm.icc.carconfigurator.service.Recommendation;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;

/**
 * @author fabianade (fabian.ade@mhp.com) on 14.01.22.
 */

public class PrFamilyFilterTest {
  @Mock
  private IFilterProvider loadFilterFunction = mock(IFilterProvider.class);
  private PrFamilyFilterFactory filter;

  private List<Recommendation> runFilter(String market, String modelcode, List<Recommendation> recommendations) {
    return recommendations.stream().filter(filter.create(market, modelcode)).collect(Collectors.toList());
  }

  @Before
  public void setUp() throws IOException {
    ObjectMapper mapper = new ObjectMapper();
    TypeReference<List<PrFamilyInformationRaw>> typeReferenceOptionPackage = new TypeReference<>() {
    };
    InputStream options = loadTestFile("pr_family_iso_code_information.json");
    when(loadFilterFunction.getPrFamilyInformation()).thenReturn(mapper.readValue(options, typeReferenceOptionPackage));
    this.filter = new PrFamilyFilterFactory(loadFilterFunction);
  }

  @Test
  public void testRecommendationsAreInTheSamePrFamily() {

    List<Recommendation> recommendationList = new ArrayList<>();
    recommendationList.add(new Recommendation("2ZF", 0.9));
    recommendationList.add(new Recommendation("2ZC", 0.89));

    List<Recommendation> filtered = runFilter("PD", "992110", recommendationList);
    assertTrue(filtered.stream().anyMatch(recommendation -> recommendation.getOption().equals("2ZF")));
  }

  @Test
  public void testRecommendationsAreNotInTheSamePrFamily() {

    List<Recommendation> recommendationList = new ArrayList<>();
    recommendationList.add(new Recommendation("2ZF", 0.9));
    recommendationList.add(new Recommendation("5XK", 0.89));

    List<Recommendation> filtered = runFilter("PD", "992110", recommendationList);
    assertTrue(filtered.stream().anyMatch(recommendation -> recommendation.getOption().equals("2ZF")));
    assertTrue(filtered.stream().anyMatch(recommendation -> recommendation.getOption().equals("5XK")));
  }

  @Test
  public void testRecommendationsAreNotInAnyPrFamily() {

    List<Recommendation> recommendationList = new ArrayList<>();
    recommendationList.add(new Recommendation("ABC", 0.9));
    recommendationList.add(new Recommendation("DEF", 0.89));

    List<Recommendation> filtered = runFilter("PD", "992110", recommendationList);
    assertTrue(filtered.stream().anyMatch(recommendation -> recommendation.getOption().equals("ABC")));
    assertTrue(filtered.stream().anyMatch(recommendation -> recommendation.getOption().equals("DEF")));
  }

  @Test
  public void testRecommendationsPrFamilyFilter() {

    List<Recommendation> recommendationList = new ArrayList<>();
    recommendationList.add(new Recommendation("2ZF", 0.9));
    recommendationList.add(new Recommendation("2ZC", 0.89));
    recommendationList.add(new Recommendation("5XK", 0.89));
    recommendationList.add(new Recommendation("DEF", 0.89));

    List<Recommendation> filtered = runFilter("PD", "992110", recommendationList);
    assertTrue(filtered.stream().anyMatch(recommendation -> recommendation.getOption().equals("2ZF")));
    assertTrue(filtered.stream().anyMatch(recommendation -> recommendation.getOption().equals("5XK")));
    assertTrue(filtered.stream().anyMatch(recommendation -> recommendation.getOption().equals("DEF")));
  }

  @Test
  public void testRecommendationsNoPrFamilyOptionMappingForVehicle() {

    List<Recommendation> recommendationList = new ArrayList<>();
    recommendationList.add(new Recommendation("2ZF", 0.9));
    recommendationList.add(new Recommendation("2ZC", 0.89));

    List<Recommendation> filtered = runFilter("PD", "123456789", recommendationList);
    assertTrue(filtered.stream().anyMatch(recommendation -> recommendation.getOption().equals("2ZF")));
    assertTrue(filtered.stream().anyMatch(recommendation -> recommendation.getOption().equals("2ZC")));
  }

  @Test
  public void testRecommendationsNoPrFamilyOptionMappingForMarket() {

    List<Recommendation> recommendationList = new ArrayList<>();
    recommendationList.add(new Recommendation("2ZF", 0.9));
    recommendationList.add(new Recommendation("2ZC", 0.89));

    List<Recommendation> filtered = runFilter("XYZ", "123456789", recommendationList);
    assertTrue(filtered.stream().anyMatch(recommendation -> recommendation.getOption().equals("2ZF")));
    assertTrue(filtered.stream().anyMatch(recommendation -> recommendation.getOption().equals("2ZC")));
  }
}
