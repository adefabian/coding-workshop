package de.pag.recomm.icc.carconfigurator.filter;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import lombok.Data;


/**
 * @author fabianade (fabian.ade@mhp.com) on 20.10.20.
 */
@Data
public class CountryOptionPackage implements OptionsFilter {

  private String countryPackageCode;
  private List<String> optionCodesIncludedInCountryPackage;

  public CountryOptionPackage() {
  }

  public CountryOptionPackage(String countryPackageCode, List<String> optionCodesIncludedInCountryPackage) {
    this.countryPackageCode = countryPackageCode;
    this.optionCodesIncludedInCountryPackage = optionCodesIncludedInCountryPackage;
  }

  public static Map<String, List<String>> getCountryPackageDictionary(List<CountryOptionPackage> countryOptionPackages) {

    Map<String, List<String>> countryPackageDict = new ConcurrentHashMap<>();
    for (CountryOptionPackage countryOptionPackage : countryOptionPackages) {
      countryPackageDict.put(countryOptionPackage.getCountryPackageCode(), countryOptionPackage.getOptionCodesIncludedInCountryPackage());
    }
    return countryPackageDict;
  }
}
