package de.pag.recomm.icc.carconfigurator.service;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Value;
import lombok.experimental.FieldDefaults;

import java.io.Serializable;

/**
 * Data model for a Meta
 */
@Value
@FieldDefaults(level = AccessLevel.PRIVATE)
@AllArgsConstructor
public class Meta implements Serializable {
    String uuid;
    String timestamp;
    String model_version;
}
