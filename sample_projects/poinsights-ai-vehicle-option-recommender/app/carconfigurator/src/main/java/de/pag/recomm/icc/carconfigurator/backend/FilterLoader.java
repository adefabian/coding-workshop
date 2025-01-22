package de.pag.recomm.icc.carconfigurator.backend;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.MappingIterator;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.csv.CsvMapper;
import com.fasterxml.jackson.dataformat.csv.CsvSchema;
import de.pag.recomm.icc.carconfigurator.filter.CountryOptionPackage;
import de.pag.recomm.icc.carconfigurator.filter.OptionsFilter;
import de.pag.recomm.icc.carconfigurator.filter.PrFamilyInformationRaw;
import de.pag.recomm.icc.carconfigurator.filter.SkuPerCountryRaw;
import de.pag.recomm.icc.carconfigurator.service.IFilterProvider;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.scheduling.annotation.Scheduled;

@FieldDefaults(
    level = AccessLevel.PRIVATE,
    makeFinal = true
)
@Slf4j
public class FilterLoader implements IFilterProvider {

  private static final String COUNTRY_PACKAGE = "country_package.json";
  private static final String PR_FAMILY_INFORMATION = "pr_family_iso_code_information.json";
  private static final String SKU_PER_COUNTRY = "sku_per_country.csv";
  List<PrFamilyInformationRaw> prFamilyInformationCacheMap = new ArrayList<>();
  List<CountryOptionPackage> countryPackageCacheMap = new ArrayList<>();
  Map<String, Map<String, Set<String>>> skuPerCountryPackageCacheMap = new ConcurrentHashMap<>();

  private FetchResource s3FetchResource;
  private String filterPrefix;

  public FilterLoader(String filterPrefix, FetchResource s3FetchResource) {
    this.s3FetchResource = s3FetchResource;
    this.filterPrefix = filterPrefix;
  }

  private <T extends OptionsFilter> List<T> getFile(String filename, TypeReference<List<T>> typeReference) {
    log.debug(String.format("File %s not in cache, try to load it. ", filename));
    String filePath = this.filterPrefix + filename;
    try (InputStream is = this.s3FetchResource.load(filePath)) {
      ObjectMapper mapper = new ObjectMapper();
      return mapper.readValue(is, typeReference);
    } catch (Exception e) {
      log.error(e.getMessage());
      throw new ResourceNotFoundException(e.getMessage());
    }
  }

  @Override
  public List<PrFamilyInformationRaw> getPrFamilyInformation() throws ResourceNotFoundException {
    TypeReference<List<PrFamilyInformationRaw>> downSellingTypeRef = new TypeReference<>() {
    };
    if (prFamilyInformationCacheMap.size() == 0) {
      prFamilyInformationCacheMap.addAll(getFile(PR_FAMILY_INFORMATION, downSellingTypeRef));
    }
    return prFamilyInformationCacheMap;
  }

  @Override
  public List<CountryOptionPackage> getCountryPackageOptions() throws ResourceNotFoundException {
    TypeReference<List<CountryOptionPackage>> countryPackageTypeRef = new TypeReference<>() {
    };
    if (prFamilyInformationCacheMap.isEmpty()) {
      countryPackageCacheMap.addAll(getFile(COUNTRY_PACKAGE, countryPackageTypeRef));
    }
    return countryPackageCacheMap;
  }


  @Override
  public Map<String, Map<String, Set<String>>> getSkuPerCountry() throws ResourceNotFoundException {
    CsvMapper csvMapper = new CsvMapper();

    CsvSchema csvSchema = csvMapper
        .typedSchemaFor(SkuPerCountryRaw.class)
        .withHeader()
        .withColumnSeparator(',');

    String filePath = this.filterPrefix + SKU_PER_COUNTRY;
    try (InputStream is = this.s3FetchResource.load(filePath)) {
      MappingIterator<SkuPerCountryRaw> skuCountryIter = csvMapper
          .readerWithTypedSchemaFor(SkuPerCountryRaw.class)
          .with(csvSchema)
          .readValues(is);

      while (skuCountryIter.hasNext()) {
        SkuPerCountryRaw item = skuCountryIter.next();

        if (skuPerCountryPackageCacheMap.containsKey(item.getCountry())) {
          if (skuPerCountryPackageCacheMap.get(item.getCountry()).containsKey(item.getModelCode())) {
            skuPerCountryPackageCacheMap.get(item.getCountry()).get(item.getModelCode()).add(item.getOptionCode());
          } else {
            Set<String> newSet = new HashSet<>();
            newSet.add(item.getOptionCode());
            skuPerCountryPackageCacheMap.get(item.getCountry()).put(item.getModelCode(), newSet);
          }
        } else {
          Set<String> newSet = new HashSet<>();
          newSet.add(item.getOptionCode());
          Map<String, Set<String>> newMap = new ConcurrentHashMap<>();
          newMap.put(item.getModelCode(), newSet);
          skuPerCountryPackageCacheMap.put(item.getCountry(), newMap);
        }

      }
      return skuPerCountryPackageCacheMap;
    } catch (Exception e) {
      log.error(e.getMessage());
      throw new ResourceNotFoundException(e.getMessage());
    }
  }

  @Override
  @Scheduled(cron = "30 04 * * *")
  public void refresh() throws ResourceNotFoundException {
    prFamilyInformationCacheMap.clear();
    getPrFamilyInformation();
    getCountryPackageOptions();
    getSkuPerCountry();
  }
}
