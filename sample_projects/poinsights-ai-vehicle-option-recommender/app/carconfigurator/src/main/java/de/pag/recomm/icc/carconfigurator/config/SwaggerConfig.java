package de.pag.recomm.icc.carconfigurator.config;

import io.swagger.v3.oas.models.ExternalDocumentation;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.info.BuildProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


/**
 * Access Swagger by URL:PORT/swagger-ui.html
 */
@Configuration
@RequiredArgsConstructor
public class SwaggerConfig {

  @Autowired
  final BuildProperties buildProperties;

  @Bean
  public OpenAPI api() {
    return new OpenAPI()
        .info(new Info().title("ICC Recommender API")
            .description("ICC Recommender API")
            .version(buildProperties.getVersion()))
        .externalDocs(new ExternalDocumentation()
            .description("ICC Recommender Confluence Documentation")
            .url("https://confluence.porsche.codes/pages/viewpage.action?pageId=164301272"));
  }

}
