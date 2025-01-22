package de.pag.recomm.icc.carconfigurator.filter;

import de.pag.recomm.icc.carconfigurator.service.IFilterProvider;
import de.pag.recomm.icc.carconfigurator.service.Recommendation;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Predicate;
import lombok.Getter;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * @author fabianade (fabian.ade@mhp.com) on 14.01.22.
 */
@Component
@Scope("singleton")
@Slf4j
public class PrFamilyFilterFactory {

  @NonNull
  final IFilterProvider loadFilterFunction;

  @Getter
  private PrFamilyInformation prFamilyInformation;


  public PrFamilyFilterFactory(IFilterProvider loadFilterFunction) {
    this.loadFilterFunction = loadFilterFunction;
    List<PrFamilyInformationRaw> downSellingOptionsRaw = this.loadFilterFunction.getPrFamilyInformation();
    this.prFamilyInformation = new PrFamilyInformation(downSellingOptionsRaw);
  };

  public PrFamilyFilter create(String isoCode, String modelCode) {
    return new PrFamilyFilter(isoCode, modelCode, prFamilyInformation);
  }

  public static class PrFamilyFilter implements Predicate<Recommendation> {

    private final String isoCode;
    private final String modelCode;
    private PrFamilyInformation prFamilyInformation;
    private final Map<String, Set<String>> optionCodePrFamilyMapping;

    final private Set<String> alreadyProcessedCategory = new HashSet<>();

    public PrFamilyFilter(String isoCode, String modelCode, PrFamilyInformation prFamilyInformation) {
      this.isoCode = isoCode.toLowerCase();
      this.modelCode = modelCode.toUpperCase();
      this.prFamilyInformation = prFamilyInformation;
      this.optionCodePrFamilyMapping = this.prFamilyInformation.getPrOptionCodeMapping(this.isoCode, this.modelCode);
    }

    /**
     * Only one recommendation per pr-family is allowed.
     * Removes recommendations, which would violate this condition.
     * @param recommendation recommendation for a vehicle option
     * @return
     */
    @Override
    public boolean test(Recommendation recommendation) {

      boolean optionIsOfNewPrFamily = true;
      String optionCode = this.removePrefix(recommendation.getOption());

      if (!this.optionCodePrFamilyMapping.isEmpty() && this.optionCodePrFamilyMapping.containsKey(optionCode)) {
        Set<String> prFamilies = this.optionCodePrFamilyMapping.get(optionCode);
        if (prFamilies.stream().anyMatch(prFamilyInfo -> this.alreadyProcessedCategory.contains(prFamilyInfo))) {
          optionIsOfNewPrFamily = false;
        }
        this.alreadyProcessedCategory.addAll(prFamilies);
      }
      return optionIsOfNewPrFamily;
    }

    private String removePrefix(String optionCode) {
      return optionCode.length() > 3 ? optionCode.substring(optionCode.length() - 3) : optionCode;
    }
  }
}