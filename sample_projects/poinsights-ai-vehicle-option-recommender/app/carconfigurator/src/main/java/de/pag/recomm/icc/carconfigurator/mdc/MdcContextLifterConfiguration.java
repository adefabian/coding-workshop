package de.pag.recomm.icc.carconfigurator.mdc;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import org.springframework.context.annotation.Configuration;
import reactor.core.publisher.Hooks;
import reactor.core.publisher.Operators;

/**
 * Source: https://www.novatec-gmbh.de/en/blog/how-can-the-mdc-context-be-used-in-the-reactive-spring-applications/
 */
@Configuration
public class MdcContextLifterConfiguration {

  private String MDC_CONTEXT_REACTOR_KEY = MdcContextLifterConfiguration.class.getName();

  @PostConstruct
  private void contextOperatorHook() {
    Hooks.onEachOperator(MDC_CONTEXT_REACTOR_KEY,
        Operators.lift((scannable, coreSubscriber) -> new MdcContextLifter<>(coreSubscriber))
    );
  }

  @PreDestroy
  private void cleanupHook() {
    Hooks.resetOnEachOperator(MDC_CONTEXT_REACTOR_KEY);
  }
}
