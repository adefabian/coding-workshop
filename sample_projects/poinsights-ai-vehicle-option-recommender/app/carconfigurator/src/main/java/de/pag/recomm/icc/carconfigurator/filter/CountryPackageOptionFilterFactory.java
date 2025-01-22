package de.pag.recomm.icc.carconfigurator.filter;

import de.pag.recomm.icc.carconfigurator.service.IFilterProvider;
import de.pag.recomm.icc.carconfigurator.service.Recommendation;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.function.Predicate;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;


/**
 * In some countries porsche offers a country package which contains a set of options per default and is free of charge. This filter removes
 * recommended options, which are part of the country package if it is selected.
 *
 * @author fabianade (fabian.ade@mhp.com) on 20.10.20
 */
@Component
@Scope("singleton")
@Slf4j
public class CountryPackageOptionFilterFactory {

  @NonNull
  final IFilterProvider loadFilterFunction;

  private Map<String, List<String>> countryOptionPackageDict;

  public CountryPackageOptionFilterFactory(@NonNull IFilterProvider loadFilterFunction) {
    this.loadFilterFunction = loadFilterFunction;
    List<CountryOptionPackage> optionPackages = this.loadFilterFunction.getCountryPackageOptions();
    this.countryOptionPackageDict = CountryOptionPackage.getCountryPackageDictionary(optionPackages);
  }

  public CountryPackageOptionFilter create(List<String> selectedOptions) {
    return new CountryPackageOptionFilter(selectedOptions, countryOptionPackageDict);

  }

  public static class CountryPackageOptionFilter implements Predicate<Recommendation> {

    private List<String> selectedOptions;
    private Map<String, List<String>> countryOptionPackage;

    public CountryPackageOptionFilter(List<String> selectedOptions, Map<String, List<String>> countryOptionPackage) {

      this.selectedOptions = selectedOptions;
      this.countryOptionPackage = countryOptionPackage;
    }

    /**
     * Removes all recommendations, which are already part of the country package.
     *
     * @param recommendations list of recommended options
     */
    @Override
    public boolean test(Recommendation recommendations) {

      if (this.countryOptionPackage.isEmpty() || !this.checkIfExistingOptionsContainsCountryPackage()) {
        return true;
      }

      return this.recommendationIncludedInCountryPackage(recommendations);
    }

    private boolean checkIfExistingOptionsContainsCountryPackage() {
      for (String option : selectedOptions) {

        String cleanedOptionKey = fixKey(option);

        if (this.countryOptionPackage.containsKey(cleanedOptionKey)) {
          return true;
        }
      }
      return false;
    }

    private String fixKey(String key) {
      return key.length() > 3 ? key.substring(key.length() - 3) : key;
    }

    private boolean recommendationIncludedInCountryPackage(Recommendation recommendation) {

      List<String> optionsAlreadyIncluded = this.getOptionsIncludedInCountryPackage(selectedOptions);
      return !isAlreadyIncludedInPackage(recommendation, optionsAlreadyIncluded);
    }

    private boolean isAlreadyIncludedInPackage(Recommendation recommendation, List<String> includedOptions) {

      return includedOptions.contains(fixKey(recommendation.getOption()));
    }

    private List<String> getOptionsIncludedInCountryPackage(List<String> selectedOptions) {

      List<String> countryPackageIncludedOptions = new ArrayList<>();

      for (String option : selectedOptions) {

        String cleanedOptionKey = fixKey(option);

        if (this.countryOptionPackage.containsKey(cleanedOptionKey)) {
          countryPackageIncludedOptions = this.countryOptionPackage.get(cleanedOptionKey);
          break;
        }
      }

      return countryPackageIncludedOptions;
    }


  }


}
