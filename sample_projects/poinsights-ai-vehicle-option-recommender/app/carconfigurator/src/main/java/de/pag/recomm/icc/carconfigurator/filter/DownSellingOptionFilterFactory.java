
package de.pag.recomm.icc.carconfigurator.filter;

import de.pag.recomm.icc.carconfigurator.service.IFilterProvider;
import de.pag.recomm.icc.carconfigurator.service.Recommendation;
import lombok.Getter;
import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.function.Predicate;

/**
 * @author fabianade (fabian.ade@mhp.com) on 28.10.20.
 */
@Component
@Scope("singleton")
@Slf4j
public class DownSellingOptionFilterFactory {

    @NonNull
    final IFilterProvider loadFilterFunction;

    @Getter
    private PrFamilyInformation prFamilyInformation;

    public DownSellingOptionFilterFactory(IFilterProvider loadFilterFunction) {
        this.loadFilterFunction = loadFilterFunction;
        List<PrFamilyInformationRaw> downSellingOptionsRaw = this.loadFilterFunction.getPrFamilyInformation();
        this.prFamilyInformation = new PrFamilyInformation(downSellingOptionsRaw);
    }

    public DownSellingOptionFilter create(String market, String modelCode, List<String> selectedOptions) {
        return new DownSellingOptionFilter(market, modelCode, selectedOptions, prFamilyInformation);
    }

    public static class DownSellingOptionFilter implements Predicate<Recommendation> {

        private final String isoCode;
        private final String modelCode;
        private final List<String> selectedOptions;
        private PrFamilyInformation prFamilyInformation;


        public DownSellingOptionFilter(String isoCode, String modelCode, List<String> selectedOptions, PrFamilyInformation prFamilyInformation) {
            this.isoCode = isoCode.toLowerCase();
            this.modelCode = modelCode.toUpperCase();
            this.selectedOptions = selectedOptions;
            this.prFamilyInformation = prFamilyInformation;
        }

        /**
         * Removes all options, which would result in a down sell, from the recommendations.
         *
         * @param recommendation recommendation for a vehicle option
         * @return filtered list of recommendations
         */
        @Override
        public boolean test(Recommendation recommendation) {

            if (!checkIfAllNecessaryDownSellingInformationIsPresent() || !checkIfCountryHasDownSellingOptions(isoCode) ||
                    !checkIfVehicleHasDownSellingOptions(isoCode, modelCode)) {
                return true;
            }

            List<Map<String, Integer>> vehicleOptionsRanking = this.prFamilyInformation.getVehicleOptionsRankingByVehicleByCountry(isoCode, modelCode);

            for (String selectedOption : selectedOptions) {
                if (checkIfSelectedOptionHasDownSellInfo(selectedOption, vehicleOptionsRanking)) {
                    List<String> downSellOptions = getOptionsWhichAreDownSellOption(selectedOption, vehicleOptionsRanking);
                    if (isRecommendationCheaper(downSellOptions, recommendation)) {
                        return false;
                    }
                }
            }
            return true;
        }

        private boolean isRecommendationCheaper(List<String> downSellOptions, Recommendation recommendation) {

            String recommendedOption = recommendation.getOption();
            recommendedOption = removePrefix(recommendedOption);

            boolean downSaleOptionsIncludeRecommendation = downSellOptions.contains(recommendedOption);
            return downSaleOptionsIncludeRecommendation;
        }

        private List<String> getOptionsWhichAreDownSellOption(String selectedOption, List<Map<String, Integer>> optionsRanking) {

            List<String> downSellOptions = new ArrayList<>();
            selectedOption = removePrefix(selectedOption);

            for (Map<String, Integer> optionRanking : optionsRanking) {
                if (optionRanking != null && optionRanking.containsKey(selectedOption)) {
                    Integer selectedOptionRank = optionRanking.get(selectedOption);
                    for (Entry<String, Integer> option : optionRanking.entrySet()) {
                        if (option.getValue() < selectedOptionRank) {
                            downSellOptions.add(option.getKey());
                        }
                    }
                    break;
                }
            }

            log.trace("Down selling options: {}", downSellOptions);
            return downSellOptions;
        }

        private boolean checkIfSelectedOptionHasDownSellInfo(String selectedOption, List<Map<String, Integer>> optionsRanking) {

            selectedOption = removePrefix(selectedOption);
            boolean hasDownSellInfo = false;

            for (Map<String, Integer> optionCategoryRanking : optionsRanking) {
                boolean optionCategoryRankingContainsSelectedOption = optionCategoryRanking != null && optionCategoryRanking.containsKey(selectedOption);
                if (optionCategoryRankingContainsSelectedOption) {
                    hasDownSellInfo = true;
                    break;
                }
            }

            log.trace("Selected Option has down selling info: {}", hasDownSellInfo);
            return hasDownSellInfo;
        }

        private String removePrefix(String selectedOption) {
            return selectedOption.length() > 3 ? selectedOption.substring(selectedOption.length() - 3) : selectedOption;
        }

        private boolean checkIfCountryHasDownSellingOptions(String isoCode) {

            boolean countryHasDownSellingOptions = this.prFamilyInformation.getPrFamilyInformation().containsKey(isoCode);

            log.trace("Market has down selling options: {}", countryHasDownSellingOptions);
            return countryHasDownSellingOptions;
        }

        private boolean checkIfVehicleHasDownSellingOptions(String isoCode, String vehicleCode) {

            Map<String, List<Map<String, Integer>>> vehicleDownSellingOptions = this.prFamilyInformation.getPrFamilyInformationForCountry(isoCode);

            boolean hasDownSellingOptions = vehicleDownSellingOptions.containsKey(vehicleCode);

            log.trace("Vehicle has down selling options: {}", hasDownSellingOptions);
            return hasDownSellingOptions;
        }

        private boolean checkIfAllNecessaryDownSellingInformationIsPresent() {
            return this.prFamilyInformation != null && this.prFamilyInformation.getPrFamilyInformation() != null;
        }
    }
}
