package de.pag.recomm.icc.carconfigurator.backend;

import java.io.InputStream;

public interface FetchResource {

  InputStream load(String resource);

  void downloadFolder(String folderKey, String destinationDirectory);
}
