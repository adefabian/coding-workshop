package de.pag.recomm.icc.carconfigurator.backend;

import de.pag.recomm.icc.carconfigurator.service.IFeatureProvider;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.IntStream;
import lombok.extern.slf4j.Slf4j;
import reactor.core.publisher.BaseSubscriber;

@Slf4j
public class FeatureLoader extends BaseSubscriber<Summary> implements IFeatureProvider {

  Map<String, Map<String, Integer>> features = new ConcurrentHashMap<>();
  Map<String, Map<Integer, String>> featuresInverse = new ConcurrentHashMap<>();

  @Override
  public Map<Integer, String> getKey(String modelcode) {
    return featuresInverse.get(createKey(modelcode));
  }

  @Override
  public Map<String, Integer> getValue(String modelcode) {
    return features.get(createKey(modelcode));
  }

  @Override
  public void hookOnNext(Summary summary) {
    if (summary.getItemCodes() == null) {
      return;
    }
    Map<String, Integer> f = Collections.synchronizedMap(new LinkedHashMap<>());
    Map<Integer, String> fi = Collections.synchronizedMap(new LinkedHashMap<>());
    IntStream
        .range(0, summary.getItemCodes().size())
        .forEach(value -> {
          String code = summary.getItemCodes().get(value);
          f.put(code, value);
          fi.put(value, code);
        });
    String key = createKey(summary.getModelcode());
    features.put(key, f);
    featuresInverse.put(key, fi);
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
  }
}
