package de.pag.recomm.icc.carconfigurator.service;

import static de.pag.recomm.icc.carconfigurator.TestHelper.loadTestFile;
import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.matches;
import static org.mockito.Mockito.when;

import de.pag.recomm.icc.carconfigurator.backend.FetchResource;
import de.pag.recomm.icc.carconfigurator.backend.FilterLoader;
import de.pag.recomm.icc.carconfigurator.filter.CountryOptionPackage;
import de.pag.recomm.icc.carconfigurator.filter.PrFamilyInformationRaw;
import de.pag.recomm.icc.carconfigurator.filter.SkuPerCountryRaw;

import java.util.List;
import java.util.Map;
import java.util.Set;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;

public class FilterLoaderTest {

  @Mock
  private FetchResource fetchResourceOutPort;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
  }

  @Test
  public void getDownSellingOptionsTest() throws ResourceNotFoundException {
    when(fetchResourceOutPort.load(matches("filter/pr_family_iso_code_information.json")))
        .thenReturn(loadTestFile("pr_family_iso_code_information.json"));

    FilterLoader underTest = new FilterLoader("filter/", fetchResourceOutPort);
    List<PrFamilyInformationRaw> downSellingOptionsRaw = underTest.getPrFamilyInformation();
    assertEquals(13, downSellingOptionsRaw.size());
  }

  @Test
  public void getCountryPackageOptionsTest() throws ResourceNotFoundException {
    when(fetchResourceOutPort.load(matches("filter/country_package.json"))).thenReturn(loadTestFile("country_package.json"));

    FilterLoader underTest = new FilterLoader("filter/", fetchResourceOutPort);
    List<CountryOptionPackage> downSellingOptionsRaw = underTest.getCountryPackageOptions();
    assertEquals(220, downSellingOptionsRaw.size());
  }

  @Test
  public void getSkuPerCountryTest() throws ResourceNotFoundException {
    when(fetchResourceOutPort.load(matches("filter/sku_per_country.csv"))).thenReturn(loadTestFile("sku_per_country.csv"));

    FilterLoader underTest = new FilterLoader("filter/", fetchResourceOutPort);
    Map<String, Map<String, Set<String>>> skuPerCountryRaw = underTest.getSkuPerCountry();
    assertEquals(7, skuPerCountryRaw.size());
    assertEquals(1, skuPerCountryRaw.get("PD").size());
    assertEquals(1, skuPerCountryRaw.get("CA").size());
    assertEquals(1, skuPerCountryRaw.get("SI").size());
    assertEquals(1, skuPerCountryRaw.get("CZ").size());
    assertEquals(1, skuPerCountryRaw.get("PL").size());
    assertEquals(1, skuPerCountryRaw.get("LT").size());
    assertEquals(1, skuPerCountryRaw.get("DE").size());
    assertEquals(13, skuPerCountryRaw.get("PD").get("987654").size());
    assertEquals(62, skuPerCountryRaw.get("CA").get("9YBAE1").size());
    assertEquals(21, skuPerCountryRaw.get("SI").get("Y1ADB1").size());
    assertEquals(2, skuPerCountryRaw.get("CZ").get("Y1ADB1").size());
    assertEquals(66, skuPerCountryRaw.get("PL").get("Y1ADB1").size());
    assertEquals(20, skuPerCountryRaw.get("LT").get("Y1ADB1").size());
    assertEquals(13, skuPerCountryRaw.get("DE").get("987654").size());
  }
}
