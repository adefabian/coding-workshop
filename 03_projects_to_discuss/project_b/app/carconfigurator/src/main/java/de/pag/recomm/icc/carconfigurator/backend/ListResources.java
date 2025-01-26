package de.pag.recomm.icc.carconfigurator.backend;

import reactor.core.publisher.Flux;

public interface ListResources {
    Flux<ResourceMetadata> listResources(String prefix);
}
