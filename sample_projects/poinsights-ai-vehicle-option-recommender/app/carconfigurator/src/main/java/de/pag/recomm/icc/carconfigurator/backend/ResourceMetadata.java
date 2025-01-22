package de.pag.recomm.icc.carconfigurator.backend;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Value;
import lombok.experimental.FieldDefaults;

import java.util.Date;

@Value
@FieldDefaults(level = AccessLevel.PRIVATE)
@AllArgsConstructor
public class ResourceMetadata {
    String name;
    Date lastModified;
}
