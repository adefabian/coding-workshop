package de.pag.recomm.icc.carconfigurator.filter;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import lombok.Data;

/**
 * Includes all the pr family information needed to filter the recommendations. Nested structure each country (isoCode) has n vehicles each vehicle
 * has option and pr family information
 *
 * @author coding-workshop
 */
@Data
public class PrFamilyInformation {

  private Map<String, Map<String, List<Map<String, Integer>>>> prFamilyInformation;
  private Map<String, Map<String, Map<String, Set<String>>>> optionCodePrFamilyMapping;

  public PrFamilyInformation(List<PrFamilyInformationRaw> prFamilyInformationRawList) {

    this.prFamilyInformation = new ConcurrentHashMap<>();
    this.optionCodePrFamilyMapping = new ConcurrentHashMap<>();

    for (PrFamilyInformationRaw prFamilyInformationRaw : prFamilyInformationRawList) {

      List<Map<String, Integer>> vehicleDownSellingOptions = new ArrayList<>();

      for (Map.Entry<String, Map<String, Integer>> entry : prFamilyInformationRaw.getOptions_family_map().entrySet()) {
        vehicleDownSellingOptions.add(entry.getValue());
        createOptionCodePrFamilyMapping(prFamilyInformationRaw.getIsoCode(), prFamilyInformationRaw.getOrderType(), entry);
      }
      String country = prFamilyInformationRaw.getIsoCode();
      String vehicleCode = prFamilyInformationRaw.getOrderType();
      addPrFamilyInformation(country, vehicleCode, vehicleDownSellingOptions);
    }
  }

  /**
   * Returns a list of dictionaries containing all option codes and the associated price for the option.
   *
   * @param isoCode country identifier (example de)
   * @param modelCode vehicle option code
   */
  public List<Map<String, Integer>> getVehicleOptionsRankingByVehicleByCountry(String isoCode, String modelCode) {
    return this.prFamilyInformation.get(isoCode).get(modelCode);
  }

  /**
   * Returns all down selling information for the provided country.
   *
   * @param isoCode country identifier (example de)
   * @return dictionary containing the mappings of option code and price, for each vehicle in the specified country.
   */
  public Map<String, List<Map<String, Integer>>> getPrFamilyInformationForCountry(String isoCode) {
    return this.prFamilyInformation.get(isoCode);
  }

  /**
   * Returns dictionary containing option code pr family mapping
   *
   * @param isoCode country identifier (example de)
   * @param modelCode vehicle option code
   */
  public Map<String, Set<String>> getPrOptionCodeMapping(String isoCode, String modelCode) {
    if (this.optionCodePrFamilyMapping.containsKey(isoCode) && this.optionCodePrFamilyMapping.get(isoCode).containsKey(modelCode)) {
      return this.optionCodePrFamilyMapping.get(isoCode).get(modelCode);
    }
    return new ConcurrentHashMap<>();
  }

  protected void addPrFamilyInformation(String isoCode, String modelCode, List<Map<String, Integer>> downSellingOptions) {

    Map<String, List<Map<String, Integer>>> vehicleDownSellingOptionsMap = new ConcurrentHashMap<>();

    if (this.prFamilyInformation.containsKey(isoCode)) {
      vehicleDownSellingOptionsMap = this.prFamilyInformation.get(isoCode);
    }
    vehicleDownSellingOptionsMap.put(modelCode, downSellingOptions);
    this.prFamilyInformation.put(isoCode, vehicleDownSellingOptionsMap);
  }

  protected void createOptionCodePrFamilyMapping(String isoCode, String modelCode, Map.Entry<String, Map<String, Integer>> entry) {

    Map<String, Map<String, Set<String>>> vehicleOptionCodePrMapping = new ConcurrentHashMap<>();
    Map<String, Set<String>> optionCodePrMapping = new ConcurrentHashMap<>();

    if (this.optionCodePrFamilyMapping.containsKey(isoCode)) {
      vehicleOptionCodePrMapping = this.optionCodePrFamilyMapping.get(isoCode);
      if (vehicleOptionCodePrMapping.containsKey(modelCode)) {
        optionCodePrMapping = vehicleOptionCodePrMapping.get(modelCode);
      }
    }

    for (String optionCode : entry.getValue().keySet()) {
      Set<String> prFamilies = new HashSet<>();

      if (optionCodePrMapping.containsKey(optionCode)) {
        prFamilies = optionCodePrMapping.get(optionCode);
      }
      prFamilies.add(entry.getKey());
      optionCodePrMapping.put(optionCode, prFamilies);
    }

    vehicleOptionCodePrMapping.put(modelCode, optionCodePrMapping);
    this.optionCodePrFamilyMapping.put(isoCode, vehicleOptionCodePrMapping);
  }
}


