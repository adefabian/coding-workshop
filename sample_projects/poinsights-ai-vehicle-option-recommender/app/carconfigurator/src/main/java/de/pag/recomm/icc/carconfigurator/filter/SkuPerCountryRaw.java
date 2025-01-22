package de.pag.recomm.icc.carconfigurator.filter;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import java.util.Map;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
 * @author  ingmarjakob
 * @soundtrack {Heartless} - [The Weeknd]
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
@JsonPropertyOrder({"optionCode", "modelcode", "country"})
public class SkuPerCountryRaw implements OptionsFilter {

    private String optionCode;
    @JsonProperty("modelcode")
    private String modelCode;
    private String country;
}
