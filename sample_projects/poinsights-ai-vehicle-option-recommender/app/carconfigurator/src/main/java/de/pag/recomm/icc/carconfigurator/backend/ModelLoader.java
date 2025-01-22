package de.pag.recomm.icc.carconfigurator.backend;

import de.pag.recomm.icc.carconfigurator.exception.ModelNotLoadableException;
import de.pag.recomm.icc.carconfigurator.service.IModelProvider;
import java.io.File;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.springframework.boot.actuate.health.Health;
import org.springframework.boot.actuate.health.HealthIndicator;
import org.tensorflow.SavedModelBundle;
import reactor.core.publisher.BaseSubscriber;

@FieldDefaults(
    level = AccessLevel.PRIVATE,
    makeFinal = true
)
@Slf4j
public class ModelLoader extends BaseSubscriber<Summary> implements IModelProvider, HealthIndicator {

  Map<String, String> objectMap = new ConcurrentHashMap<>();
  Map<String, SavedModelBundle> cacheMap = new ConcurrentHashMap<>();
  String modelPrefix;
  private FetchResource s3FetchResource;

  public ModelLoader(String modelPrefix, FetchResource s3FetchResource) {
    this.modelPrefix = modelPrefix;
    this.s3FetchResource = s3FetchResource;
  }

  @Override
  public SavedModelBundle getValue(String modelcode) throws ModelNotLoadableException {
    log.info("receiving model for: {}, {}", modelcode, createKey(modelcode));
    String resource = objectMap.get(createKey(modelcode));
    if (resource == null) {
      throw new ModelNotLoadableException(
          String.format("Could not load model %s", modelcode));
    }
    SavedModelBundle model = cacheMap.get(resource);
    if (model == null) {
      throw new ModelNotLoadableException(
          String.format("Could not load model %s", modelcode));
    }
    return model;
  }

  private void fillMap() {
    for (String resource : objectMap.values()) {
      log.debug("Model not in cache, try to load it.");
      try {
        s3FetchResource.downloadFolder(resource, "/tmp");
        File modelDirectory = new File("/tmp" + File.separator + resource);
        SavedModelBundle model = SavedModelBundle.load(modelDirectory.getAbsolutePath(), "serve");
        cacheMap.put(resource, model);
        FileUtils.deleteDirectory(modelDirectory);
      } catch (Exception e) {
        log.error("Could not load model_market {}", resource);
      }
    }
  }

  @Override
  public void hookOnNext(Summary summary) {
    String key = createKey(summary.getModelcode());
    String resource = createResourceString(summary);
    log.info("Put in objectMap key: " + key + " resource string: " + resource);
    objectMap.put(
        key,
        resource
    );
    cacheMap.remove(resource);
  }

  private String createResourceString(Summary summary) {
    return modelPrefix + summary.getRunId() + "_" + summary.getTrainId() + File.separator + "model";
  }

  private String createKey(String modelcode) {
    return modelcode.toLowerCase();
  }

  @Override
  public void hookOnError(Throwable t) {
    log.error("Error consuming summaries:", t);
  }

  @Override
  public void hookOnComplete() {
    log.info("Consumed all summaries");
    fillMap();
  }

  @Override
  public Health health() {
    Health.Builder h = objectMap.size() == cacheMap.size() && objectMap.size() > 0 ? Health.up() : Health.down();
    return h.build();
  }
}
