package de.pag.recomm.icc.carconfigurator.filter;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Map;

/**
 * @author coding-workshop
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
public class PrFamilyInformationRaw implements OptionsFilter {

    @JsonProperty("iso_code")
    private String isoCode;
    private Double my4;
    private String orderType;
    private Map<String, Map<String, Integer>> options_family_map;
}
