package de.pag.recomm.icc.carconfigurator.mdc;

import java.util.Map;
import java.util.stream.Collectors;
import org.reactivestreams.Subscription;
import org.slf4j.MDC;
import reactor.core.CoreSubscriber;
import reactor.util.context.Context;

/**
 * Helper that copies the state of Reactor [Context] to MDC on the #onNext + #onError function.
 * Source: https://www.novatec-gmbh.de/en/blog/how-can-the-mdc-context-be-used-in-the-reactive-spring-applications/
 */
class MdcContextLifter<T> implements CoreSubscriber<T> {

  CoreSubscriber<T> coreSubscriber;

  public MdcContextLifter(CoreSubscriber<T> coreSubscriber) {
    this.coreSubscriber = coreSubscriber;
  }

  @Override
  public void onSubscribe(Subscription subscription) {
    coreSubscriber.onSubscribe(subscription);
  }

  @Override
  public void onNext(T obj) {
    copyToMdc(coreSubscriber.currentContext());
    coreSubscriber.onNext(obj);
  }

  @Override
  public void onError(Throwable t) {
    copyToMdc(coreSubscriber.currentContext());
    coreSubscriber.onError(t);
  }

  @Override
  public void onComplete() {
    coreSubscriber.onComplete();
  }

  @Override
  public Context currentContext() {
    return coreSubscriber.currentContext();
  }

  /**
   * Extension function for the Reactor [Context]. Copies the current context to the MDC, if context is empty clears the MDC.
   * State of the MDC after calling this method should be same as Reactor [Context] state.
   * One thread-local access only.
   */
  private void copyToMdc(Context context) {

    if (!context.isEmpty()) {
      Map<String, String> map = context.stream()
          .collect(Collectors.toMap(e -> e.getKey().toString(), e -> e.getValue().toString()));

      MDC.setContextMap(map);
    } else {
      MDC.clear();
    }
  }

}
