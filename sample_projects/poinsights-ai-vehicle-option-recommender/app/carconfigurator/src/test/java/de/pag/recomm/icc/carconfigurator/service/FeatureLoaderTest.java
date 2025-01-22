package de.pag.recomm.icc.carconfigurator.service;

import static java.util.Collections.EMPTY_LIST;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.contains;
import static org.hamcrest.Matchers.empty;
import static org.junit.Assert.assertNull;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import de.pag.recomm.icc.carconfigurator.backend.FeatureLoader;
import de.pag.recomm.icc.carconfigurator.backend.Summary;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.junit.Test;

public class FeatureLoaderTest {

  @Test
  public void itemCodesAreExtractedFromSummaryAndMappedToFeatureMaps() {
    Summary summary = mock(Summary.class);
    List<String> codes = new ArrayList<>();
    codes.add("code1");
    codes.add("code2");
    when(summary.getItemCodes()).thenReturn(codes);
    when(summary.getModelcode()).thenReturn("modelcode");
    when(summary.getMarket()).thenReturn("market");

    FeatureLoader underTest = new FeatureLoader();
    underTest.onNext(summary);
    Map<String, Integer> value = underTest.getValue("modelcode");
    Map<Integer, String> key = underTest.getKey("modelcode");

    assertThat(value.keySet(), contains(codes.toArray()));
    assertThat(key.values(), contains(codes.toArray()));
    assertThat(key.keySet(), contains(0, 1));
    assertThat(value.values(), contains(0, 1));
  }

  @Test
  public void emptyItemCodesReturnsEmptyFeatureMaps() {
    Summary summary = mock(Summary.class);
    when(summary.getItemCodes()).thenReturn(EMPTY_LIST);
    when(summary.getModelcode()).thenReturn("modelcode");
    when(summary.getMarket()).thenReturn("market");

    FeatureLoader underTest = new FeatureLoader();
    underTest.onNext(summary);
    Map<String, Integer> value = underTest.getValue("modelcode");
    Map<Integer, String> key = underTest.getKey("modelcode");

    assertThat(value.keySet(), empty());
    assertThat(key.values(), empty());
    assertThat(key.keySet(), empty());
    assertThat(value.values(), empty());
  }

  @Test
  public void nullItemCodesReturnsNullFeatureMaps() {
    Summary summary = mock(Summary.class);
    when(summary.getItemCodes()).thenReturn(null);
    when(summary.getModelcode()).thenReturn("modelcode");
    when(summary.getMarket()).thenReturn("market");

    FeatureLoader underTest = new FeatureLoader();
    underTest.onNext(summary);
    Map<String, Integer> value = underTest.getValue("modelcode");
    Map<Integer, String> key = underTest.getKey("modelcode");

    assertNull(value);
    assertNull(key);
  }
}
