package de.pag.recomm.icc.carconfigurator.service;

import de.pag.recomm.icc.carconfigurator.exception.ModelNotLoadableException;
import de.pag.recomm.icc.carconfigurator.filter.CountryPackageOptionFilterFactory;
import de.pag.recomm.icc.carconfigurator.filter.DownSellingOptionFilterFactory;
import de.pag.recomm.icc.carconfigurator.filter.InteriorExteriorOptionFilter;
import de.pag.recomm.icc.carconfigurator.filter.PrFamilyFilterFactory;
import de.pag.recomm.icc.carconfigurator.filter.SkuPerCountryFilterFactory;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.function.Predicate;
import lombok.AccessLevel;
import lombok.NonNull;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.stereotype.Service;
import org.tensorflow.SavedModelBundle;
import org.tensorflow.Tensor;
import org.tensorflow.ndarray.FloatNdArray;
import org.tensorflow.ndarray.NdArray;
import org.tensorflow.ndarray.NdArrays;
import org.tensorflow.ndarray.Shape;
import org.tensorflow.types.TFloat32;
import reactor.core.publisher.Flux;

/**
 * Business logic for getting recommendations for a specific model
 */
@Service
@FieldDefaults(level = AccessLevel.PRIVATE)
@Slf4j
public class FetchRecommendationsService {

  @NonNull
  final IModelProvider loadModelFunction;    //loads the recommendation models from files

  @NonNull
  final IFeatureProvider loadFeatureMappingFunction;

  @NonNull
  final DownSellingOptionFilterFactory downSellingOptionFilter;

  @NonNull
  final CountryPackageOptionFilterFactory countryPackageFilter;

  @NonNull
  final PrFamilyFilterFactory prFamilyFilter;

  @NonNull
  final SkuPerCountryFilterFactory skuPerCountryFilter;

  @NonNull
  final InteriorExteriorOptionFilter interiorExteriorOptionFilter;

  public FetchRecommendationsService(
      @NonNull IModelProvider loadModelFunction,
      @NonNull IFeatureProvider loadFeatureMappingFunction,
      @NonNull @Qualifier("downSellingOptionFilterFactory")
          DownSellingOptionFilterFactory downSellingOptionFilter,
      @NonNull @Qualifier("countryPackageOptionFilterFactory")
          CountryPackageOptionFilterFactory countryPackageFilter,
      @NonNull @Qualifier("skuPerCountryFilterFactory")
          SkuPerCountryFilterFactory skuPerCountryFilter,
      @NonNull @Qualifier("prFamilyFilterFactory")
          PrFamilyFilterFactory prFamilyFilter
  ) {
    this.loadModelFunction = loadModelFunction;
    this.loadFeatureMappingFunction = loadFeatureMappingFunction;
    this.countryPackageFilter = countryPackageFilter;
    this.downSellingOptionFilter = downSellingOptionFilter;
    this.prFamilyFilter = prFamilyFilter;
    this.skuPerCountryFilter = skuPerCountryFilter;
    this.interiorExteriorOptionFilter = new InteriorExteriorOptionFilter();
  }

  public Flux<Recommendation> getRecommendations(String modelcode, List<String> options, int size, String isoCountry) {
    //check if any options are received
    if (null == options || options.isEmpty()) {
      return Flux.error(new ResourceNotFoundException("No options received."));
    }

    //load the appropriate model
    SavedModelBundle model;
    try {
      model = loadModelFunction.getValue(modelcode);
      if (model == null) {
        //if model is unknown, return an exception
        return Flux.error(new ResourceNotFoundException("Model has not been found."));
      }
    } catch (ModelNotLoadableException e) {
      return Flux.error(new ResourceNotFoundException("Model could not be loaded.", e));
    }

    //load the appropriate feature mappings (for both directions: feature name <-> index)
    Map<String, Integer> features = loadFeatureMappingFunction.getValue(modelcode);
    if (features == null) {
      //if file is unknown, return an exception
      return Flux.error(new ResourceNotFoundException("Feature map for model has not been found."));
    }
    Map<Integer, String> featuresInverse = loadFeatureMappingFunction.getKey(modelcode);
    if (featuresInverse == null) {
      //if file is unknown, return an exception
      return Flux.error(new ResourceNotFoundException("Inverse feature map for model has not been found."));
    }

    FetchRecommendationsService.log.info("Processing request with model: " + modelcode);

    //check if inputted features exist, remove non-existing features
    List<String> existingOptions = new ArrayList<>();
    for (String option : options) {
      if (features.containsKey(option)) {
        existingOptions.add(option);
      }
    }
    FetchRecommendationsService.log.info("Existing input options: " + existingOptions);

    //populate user vector
    int inputSize = features.size();
    NdArray userInput = populateUserInputVector(
        existingOptions, inputSize, existingOptions.size(), features);
    Tensor userInputTensor = TFloat32.tensorOf(userInput);
    FetchRecommendationsService.log.debug("User input shape: " + userInput.shape().toString());

    //populate item vector
    NdArray itemInput = populateItemInputVector(inputSize);
    Tensor itemInputTensor = TFloat32.tensorOf(itemInput);
    FetchRecommendationsService.log.debug("Item input shape: " + itemInput.shape().toString());

    //get recommendations from model
    Map<String, Tensor> resultMap = model.function("serving_default")
        .call(Map.of("input_1", userInputTensor, "input_2", itemInputTensor));
    if (null == resultMap.get("prediction")) {  //check if there is a result
      return Flux.empty();
    }
    TFloat32 resultTensor = (TFloat32) resultMap.get("prediction");
    List<Float> result = new ArrayList<>();
    for (FloatNdArray floatNdArray : resultTensor.scalars()) {
      result.add(floatNdArray.getFloat());
    }

    userInputTensor.close();
    itemInputTensor.close();
    resultTensor.close();

    //store results as list of recommendations
    return Flux.range(0, result.size())
        //filter null features (necessary because Panamera model has only 170 features)
        .filter(i -> featuresInverse.get(i) != null)
        //filter selected features (delete them from the result)
        .filter(i -> !existingOptions.contains(featuresInverse.get(i)))
        //filters items, which were previously added in different colour
        .filter(i -> !featureWasPreviouslySelectedInDifferentColour(existingOptions,
            featuresInverse.get(i)))
        .map(i -> {
          double probability = result.get(i);
          return new Recommendation(featuresInverse.get(i), probability);
        })
        .sort(Comparator.comparingDouble(Recommendation::getProbability).reversed())
        // filters colour recommendations
        .filter(recommendation -> this.interiorExteriorOptionFilter.test(recommendation))
        // filters recommended options, which are part of country package
        .filter(this.filterRecommendationsIncludedInCountryPackage(options))
        // filters recommendations, which are cheaper than previously selected options
        .filter(this.filterRecommendedDownSellingOptions(isoCountry, modelcode, options))
        // filters recommendations, so that only one recommendation per pr family is present
        .filter(this.filterRecommendationsPrFamily(isoCountry, modelcode))
        // Removes all recommendations, which not available in the country
        .filter(this.filterSkuPerCountry(isoCountry, modelcode))
        .map(this.scaleDownRecommendationProbability())
        .take(size > 0 ? size : Long.MAX_VALUE);
  }

  private static NdArray populateUserInputVector(
      List<String> selectedFeatures, int userVectorSize, int userFeaturesSize,
      Map<String, Integer> featureMap
  ) {
    NdArray userInputMatrix = NdArrays.ofFloats(Shape.of(userVectorSize, userVectorSize));

    int latestOptionsSize = selectedFeatures.size();
    int[] featureIndices = new int[userFeaturesSize];

    StringBuilder featureIndicesForLogging = new StringBuilder();
    for (int i = 0; i < userFeaturesSize; i++) {
      int featureIndex = featureMap.get(selectedFeatures.get(latestOptionsSize - 1 - i));
      featureIndices[i] = featureIndex;

      featureIndicesForLogging.append(featureIndex);
      if ((i + 1) < userFeaturesSize) {
        featureIndicesForLogging.append(", ");
      }
    }
    FetchRecommendationsService.log.info("Feature indices to set user input: " + featureIndicesForLogging);

    for (int i = 0; i < userVectorSize; i++) {
      for (int j = 0; j < userFeaturesSize; j++) {
        userInputMatrix.setObject(1.0f, i, featureIndices[j]);
      }
    }

    return userInputMatrix;
  }

  private static NdArray populateItemInputVector(int itemVectorSize) {
    NdArray itemInputMatrix = NdArrays.ofFloats(Shape.of(itemVectorSize, itemVectorSize));

    for (int i = 0; i < itemVectorSize; i++) {
      itemInputMatrix.setObject(1.0f, i, i);
    }

    return itemInputMatrix;
  }

  /**
   * Removes recommendations, which are already part of the selected country package.
   *
   * @param selectedOptions previously selected options
   * @return filtered recommendations
   */
  private Predicate<Recommendation> filterRecommendationsIncludedInCountryPackage(List<String> selectedOptions) {

    return countryPackageFilter.create(selectedOptions);
  }

  /**
   * Removes all recommendations, which are cheaper options, to previously selected options.
   *
   * @param market porsche sales market
   * @param modelCode vehicle model code
   * @param selectedOptions previously selected options
   * @return downselling options filter
   */
  private Predicate<Recommendation> filterRecommendedDownSellingOptions(String market, String modelCode, List<String> selectedOptions) {

    return downSellingOptionFilter.create(market, modelCode, selectedOptions);
  }

  /**
   * Removes all recommendations, which not available in the country.
   *
   * @param market porsche sales market
   * @param modelCode vehicle model code
   * @return sku per country filter
   */
  private Predicate<Recommendation> filterSkuPerCountry(String market, String modelCode) {

    return skuPerCountryFilter.create(market, modelCode);
  }

  private Predicate<Recommendation> filterRecommendationsPrFamily(String market, String modelCode) {
    return this.prFamilyFilter.create(market, modelCode);
  }

  /**
   * Scales down recommendation probability to max 0.99.
   *
   * @return function which scales down recommendations.
   */
  private Function<Recommendation, Recommendation> scaleDownRecommendationProbability() {
    return recommendation -> new Recommendation(recommendation.getOption(),
        recommendation.getProbability() * 0.99);
  }

  /**
   * Checks if the feature was previously added in a different colour.
   *
   * @param existingOptions list of previously added features
   * @param featureName name of a feature, which could be added to recommendations.
   * @return true if part was previously added in different colour.
   */
  private boolean featureWasPreviouslySelectedInDifferentColour(List<String> existingOptions, String featureName) {
    List<String> identicalFeaturesDifferentColorModelName = Arrays.asList("CAMT", "CAMU", "CAMV", "CAMW");

    if (identicalFeaturesDifferentColorModelName.contains(featureName)) {
      return existingOptions.stream().anyMatch(identicalFeaturesDifferentColorModelName::contains);
    }
    return false;
  }
}
