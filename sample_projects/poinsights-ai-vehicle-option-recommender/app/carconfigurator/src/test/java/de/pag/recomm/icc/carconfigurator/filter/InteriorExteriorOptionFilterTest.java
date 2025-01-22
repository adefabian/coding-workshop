package de.pag.recomm.icc.carconfigurator.filter;

import static org.junit.Assert.assertEquals;

import de.pag.recomm.icc.carconfigurator.service.Recommendation;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.MockitoAnnotations;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import reactor.core.publisher.Flux;
import reactor.test.StepVerifier;

@RunWith(SpringJUnit4ClassRunner.class)
public class InteriorExteriorOptionFilterTest {

  private static final String MODEL_CODE = "987654";
  private static final String UUID = "123456";
  private static final String MARKET = "market";

  private InteriorExteriorOptionFilter recommendationsFilterFunction;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    Set<String> defaultConfig = new HashSet<>();
    recommendationsFilterFunction = new InteriorExteriorOptionFilter();
  }

  @Test
  public void filterWithNoDefaultConfig() {
    recommendationsFilterFunction = new InteriorExteriorOptionFilter();
    List<Recommendation> input = new ArrayList<>();
    input.add(new Recommendation("ATEST1", 1.0));
    input.add(new Recommendation("BTEST2", 0.9));
    input.add(new Recommendation("CTEST3", 0.8));
    input.add(new Recommendation("DTEST4", 0.7));
    input.add(new Recommendation("ETEST5", 0.6));
    input.add(new Recommendation("FTEST6", 0.5));
    input.add(new Recommendation("GTEST7", 0.4));
    input.add(new Recommendation("HTEST8", 0.3));
    input.add(new Recommendation("ITEST9", 0.2));

    List<Recommendation> result = input.stream().filter(recommendationsFilterFunction).limit(5L).collect(Collectors.toList());

    assertEquals(5, result.size());
  }

  @Test
  public void filterFeaturesSize5() {
    List<Recommendation> input = new ArrayList<>();
    input.add(new Recommendation("ATEST1", 1.0));
    input.add(new Recommendation("BTEST2", 0.9));
    input.add(new Recommendation("CTEST3", 0.8));
    input.add(new Recommendation("DTEST4", 0.7));
    input.add(new Recommendation("ETEST5", 0.6));
    input.add(new Recommendation("FTEST6", 0.5));
    input.add(new Recommendation("GTEST7", 0.4));
    input.add(new Recommendation("HTEST8", 0.3));
    input.add(new Recommendation("ITEST9", 0.2));

    List<Recommendation> result = input.stream().filter(recommendationsFilterFunction).limit(5L).collect(Collectors.toList());

    assert (result.size() == 5);
  }

  @Test
  public void filterFeaturesSize3() {
    List<Recommendation> input = new ArrayList<>();
    input.add(new Recommendation("ATEST1", 1.0));
    input.add(new Recommendation("BTEST2", 0.9));
    input.add(new Recommendation("CTEST3", 0.8));
    input.add(new Recommendation("DTEST4", 0.7));
    input.add(new Recommendation("ETEST5", 0.6));
    input.add(new Recommendation("FTEST6", 0.5));
    input.add(new Recommendation("GTEST7", 0.4));
    input.add(new Recommendation("HTEST8", 0.3));
    input.add(new Recommendation("ITEST9", 0.2));

    List<Recommendation> result = input.stream().filter(recommendationsFilterFunction).limit(3L).collect(Collectors.toList());

    assert (result.size() == 3);
  }

  @Test
  public void filterFeaturesCategoryNoFAndI() {
    List<Recommendation> input = new ArrayList<>();
    input.add(new Recommendation("MTEST1", 1.0));
    input.add(new Recommendation("FTEST2", 0.9));
    input.add(new Recommendation("ITEST3", 0.8));
    input.add(new Recommendation("FEST4", 0.7));
    input.add(new Recommendation("ITEST5", 0.6));
    input.add(new Recommendation("MTEST6", 0.5));
    input.add(new Recommendation("PTEST7", 0.4));
    input.add(new Recommendation("TEST8", 0.3));
    input.add(new Recommendation("TEST9", 0.2));

    StepVerifier.create(Flux.fromArray(input.toArray()).map(r -> (Recommendation) r).filter(r -> recommendationsFilterFunction.test(r)))
        .assertNext(r -> r.getOption().equals("MTEST1"))
        .assertNext(r -> r.getOption().equals("MTEST6"))
        .assertNext(r -> r.getOption().equals("PTEST7"))
        .assertNext(r -> r.getOption().equals("TEST8"))
        .assertNext(r -> r.getOption().equals("TEST9"))
        .verifyComplete();
  }

  @Test
  public void filterFeaturesSelectedOptions() {
    List<String> selectedFeatures = new ArrayList<>();
    selectedFeatures.add("BTEST2");
    selectedFeatures.add("DTEST4");

    List<Recommendation> input = new ArrayList<>();
    input.add(new Recommendation("ATEST1", 1.0));
    input.add(new Recommendation("BTEST2", 0.9));
    input.add(new Recommendation("CTEST3", 0.8));
    input.add(new Recommendation("DTEST4", 0.7));
    input.add(new Recommendation("ETEST5", 0.6));
    input.add(new Recommendation("FTEST6", 0.5));
    input.add(new Recommendation("GTEST7", 0.4));
    input.add(new Recommendation("HTEST8", 0.3));
    input.add(new Recommendation("ITEST9", 0.2));

    List<Recommendation> result = input.stream().filter(recommendationsFilterFunction).limit(3L).collect(Collectors.toList());

        /*StepVerifier.create(result)
                .assertNext(r -> r.getOption().equals("ATEST1"))
                .assertNext(r -> r.getOption().equals("CTEST3"))
                .assertNext(r -> r.getOption().equals("ETEST5"))
                .verifyComplete();*/
  }

  @Test
  public void filterFeaturesDeselectedOptions() {
    List<String> selectedFeatures = new ArrayList<>();
    selectedFeatures.add("BTEST2");
    selectedFeatures.add("DTEST4");

    Set<String> selectionHistory = new HashSet<>();
    selectionHistory.add("BTEST2");
    selectionHistory.add("ATEST1");

    List<Recommendation> input = new ArrayList<>();
    input.add(new Recommendation("ATEST1", 1.0));
    input.add(new Recommendation("BTEST2", 0.9));
    input.add(new Recommendation("CTEST3", 0.8));
    input.add(new Recommendation("DTEST4", 0.7));
    input.add(new Recommendation("ETEST5", 0.6));
    input.add(new Recommendation("ETEST6", 0.5));
    input.add(new Recommendation("GTEST7", 0.4));
    input.add(new Recommendation("HTEST8", 0.3));
    input.add(new Recommendation("ITEST9", 0.2));

    List<Recommendation> result = input.stream().filter(recommendationsFilterFunction).limit(3L).collect(Collectors.toList());

        /*StepVerifier.create(result)
                .assertNext(r -> r.getOption().equals("CTEST3"))
                .assertNext(r -> r.getOption().equals("ETEST5"))
                .assertNext(r -> r.getOption().equals("ETEST6"))
                .verifyComplete();*/
  }
}
