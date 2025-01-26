package de.pag.recomm.icc.carconfigurator.service;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Value;
import lombok.experimental.FieldDefaults;

import java.io.Serializable;

/**
 * Data model for a response
 */
@Value
@FieldDefaults(level = AccessLevel.PRIVATE)
@AllArgsConstructor
public class Response implements Serializable {
    Meta meta;
    Data data;
}
