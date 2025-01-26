package de.pag.recomm.icc.carconfigurator.config;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AWSConfig {

  @Bean
  @Qualifier("mys3")
  public AmazonS3 amazonS3Client(
      @Value("${cloud.aws.region.static}") String region) {

    return AmazonS3ClientBuilder
        .standard()
        .withPathStyleAccessEnabled(true)
        .withRegion(region)
        .build();
  }
}
