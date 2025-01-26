package de.pag.recomm.icc.carconfigurator.backend;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import reactor.core.publisher.Flux;

import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.Instant;
import java.util.Date;

/**
 * Helper class for loading a model file from the local file system
 */
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Slf4j
public class LocalListResources implements ListResources {

    final String basePath;

    @Override
    public Flux<ResourceMetadata> listResources(String location) {

        try {
            return Flux.fromStream(
                    Files
                            .walk(Paths.get(basePath).toAbsolutePath())
                            .filter(Files::isRegularFile)
                            .map(Path::toFile)
                            .map(file -> new ResourceMetadata(
                                            file.getName(),
                                            Date.from(Instant.ofEpochMilli(file.lastModified()))
                                    )
                            )
            );
        } catch (IOException e) {
            log.error("Could not list resources due to: ", e);
        }

        return Flux.empty();
    }
}
