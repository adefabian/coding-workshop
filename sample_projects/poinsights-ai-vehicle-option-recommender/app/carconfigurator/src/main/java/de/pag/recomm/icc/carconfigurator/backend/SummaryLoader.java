package de.pag.recomm.icc.carconfigurator.backend;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Consumer;
import lombok.AccessLevel;
import lombok.NonNull;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import reactor.core.CoreSubscriber;
import reactor.core.publisher.Flux;
import reactor.core.publisher.FluxSink;

@FieldDefaults(level = AccessLevel.PRIVATE)
@Slf4j
public class SummaryLoader {

  @NonNull
  final String suffix;

  @NonNull
  final String prefix;

  @NonNull
  final FetchResource fetchResourceOutPort;

  @NonNull
  final ListResources listResourcesOutPort;

  final ObjectMapper mapper = new ObjectMapper();

  final Map<String, Date> processedSummary = new ConcurrentHashMap<>();

  Emmitter summaryEmmitter;
  final Flux<Summary> summary$;

  public SummaryLoader(FetchResource fetchResourceOutPort,
      ListResources listResourcesOutPort,
      String prefix, String suffix,
      List<CoreSubscriber<Summary>> consumer
  ) {
    this.fetchResourceOutPort = fetchResourceOutPort;
    this.listResourcesOutPort = listResourcesOutPort;

    this.prefix = prefix;
    this.suffix = suffix;
    summary$ = Flux.create(getFluxSinkConsumer()).publish().refCount(consumer.size());
    consumer.forEach(summary$::subscribe);
  }

  private Consumer<FluxSink<Summary>> getFluxSinkConsumer() {
    return objectFluxSink -> summaryEmmitter = new Emmitter(objectFluxSink);
  }

  public void loadResources() {
    listResourcesOutPort
        .listResources(prefix)
        .filter(resourceMetadata -> resourceMetadata.getName().endsWith(suffix))
        .subscribe(resourceMetadata -> {
          try (InputStream is = fetchResourceOutPort.load(resourceMetadata.getName())) {
            Summary summary = mapper.readValue(is, Summary.class);
            if (isOld(summary, resourceMetadata)) {
              log.warn("Dropped runId {} because it's older than an already processed summary", summary.getRunId());
              return;
            }
            summaryEmmitter.emmit(summary);
          } catch (IOException e) {
            log.error("Error reading summary - skipping {}", resourceMetadata.getName(), e);
          }
        }, null, () -> {
          processedSummary.clear();
          summaryEmmitter.complete();
        });
  }

  private boolean isOld(Summary summary, ResourceMetadata resourceMetadata) {
    String key = summary.getModelcode() + summary.getMarket();
    Date processedDate = processedSummary.get(key);
    if (processedDate == null || processedDate.before(resourceMetadata.getLastModified())) {
      processedSummary.put(key, resourceMetadata.getLastModified());
      return false;
    } else {
      return true;
    }
  }

  public void stop() {
    summaryEmmitter.complete();
  }

  static class Emmitter {

    FluxSink<Summary> sink;

    public Emmitter(FluxSink<Summary> sink) {
      this.sink = sink;
    }

    public void emmit(Summary summary) {
      this.sink.next(summary);
    }

    public void complete() {
      this.sink.complete();
    }
  }
}
