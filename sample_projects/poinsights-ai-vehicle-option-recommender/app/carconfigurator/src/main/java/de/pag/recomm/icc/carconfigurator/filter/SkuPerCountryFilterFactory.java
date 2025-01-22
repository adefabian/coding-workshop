package de.pag.recomm.icc.carconfigurator.filter;

import de.pag.recomm.icc.carconfigurator.service.IFilterProvider;
import de.pag.recomm.icc.carconfigurator.service.Recommendation;
import java.util.Map;
import java.util.Set;
import java.util.function.Predicate;
import lombok.Getter;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/*
 * @author  ingmarjakob
 * @soundtrack soundtrack {If You Know You Know} - [Pusha T]
 */
@Component
@Scope("singleton")
@Slf4j
public class SkuPerCountryFilterFactory {

  @NonNull
  final IFilterProvider loadFilterFunction;

  @Getter
  private Map<String, Map<String, Set<String>>> skuPerModelAndCountry;

  public SkuPerCountryFilterFactory(IFilterProvider loadFilterFunction) {
    this.loadFilterFunction = loadFilterFunction;
    skuPerModelAndCountry = this.loadFilterFunction.getSkuPerCountry();
    SkuPerCountryFilterFactory.log.info("SkuPerCountryRaw loaded size: " + skuPerModelAndCountry.size());
  }

  public SkuPerCountryFilter create(String market, String modelCode) {
    return new SkuPerCountryFilter(market, modelCode, this.skuPerModelAndCountry);
  }

  public static class SkuPerCountryFilter implements Predicate<Recommendation> {


    private final String country;
    private final String modelCode;
    private Map<String, Map<String, Set<String>>> skuPerCountryTable;


    public SkuPerCountryFilter(String country, String modelCode, Map<String, Map<String, Set<String>>> skuPerCountryTable) {
      this.country = country.toUpperCase();
      this.modelCode = modelCode.toUpperCase();
      this.skuPerCountryTable = skuPerCountryTable;
    }

    /**
     * Removes all options, which are available in the country.
     *
     * @param recommendations list of recommendations
     * @return filtered list of recommendations
     */
    @Override
    public boolean test(Recommendation recommendations) {
      boolean exists = false;
      try {
        exists = skuPerCountryTable.get(country).get(modelCode).contains(recommendations.getOption());
      } catch (NullPointerException npe) {
        // everything is fine
      }
      SkuPerCountryFilterFactory.log.trace("Option " + recommendations.getOption() + " for model code " + modelCode + " and country " + country
          + " has been found: " + exists);
      return exists;
    }

  }

}

