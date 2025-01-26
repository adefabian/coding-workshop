package de.pag.recomm.icc.carconfigurator.config;

import java.util.List;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ApiConfig {

  @Bean
  @Qualifier("apiKeyAuthenticationExcludePatterns")
  public List<String> apiKeyAuthenticationExcludePatterns() {
    return List.of("/error", "/actuator/health");
  }

}
