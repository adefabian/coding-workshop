package de.pag.recomm.icc.carconfigurator.backend;

import java.io.File;
import java.io.InputStream;
import java.nio.file.FileSystems;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;

/**
 * Helper class for loading a model file from the local file system
 */
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Slf4j
public class LocalFetchResource implements FetchResource {

  final String basePath;

  @Override
  public InputStream load(String resource) {

    try {
      return FileUtils.openInputStream(new File(FileSystems.getDefault().getPath(basePath, resource).toUri()));
    } catch (Exception e) {
      throw new ResourceNotFoundException();
    }
  }

  @Override
  public void downloadFolder(String folderKey, String destinationDirectory) {
    try {
      FileUtils.copyDirectory(new File(FileSystems.getDefault().getPath(basePath, folderKey).toUri().toString()),
          new File(destinationDirectory));
    } catch (Exception e) {
      throw new ResourceNotFoundException();
    }
  }
}
