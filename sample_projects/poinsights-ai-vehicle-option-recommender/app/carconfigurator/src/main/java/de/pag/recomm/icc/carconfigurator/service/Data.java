package de.pag.recomm.icc.carconfigurator.service;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Value;
import lombok.experimental.FieldDefaults;
import java.util.List;
import java.io.Serializable;

/**
 * Data model for a Data
 */
@Value
@FieldDefaults(level = AccessLevel.PRIVATE)
@AllArgsConstructor
public class Data implements Serializable {
    List<Recommendation> recommendations;
}
