package de.pag.recomm.icc.carconfigurator.service;

import de.pag.recomm.icc.carconfigurator.filter.CountryOptionPackage;
import de.pag.recomm.icc.carconfigurator.filter.PrFamilyInformationRaw;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;

/*
 * @author  ingmarjakob
 */
public interface IFilterProvider {

  List<PrFamilyInformationRaw> getPrFamilyInformation() throws ResourceNotFoundException;

  List<CountryOptionPackage> getCountryPackageOptions() throws ResourceNotFoundException;

  Map<String, Map<String, Set<String>>> getSkuPerCountry() throws ResourceNotFoundException;

  void refresh() throws ResourceNotFoundException;
}
