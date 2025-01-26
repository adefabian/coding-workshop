package de.pag.recomm.icc.carconfigurator.config;

import com.amazonaws.auth.DefaultAWSCredentialsProviderChain;
import com.amazonaws.regions.RegionUtils;
import com.amazonaws.services.cloudwatch.AmazonCloudWatchAsyncClient;
import com.amazonaws.services.s3.AmazonS3;
import de.pag.recomm.icc.carconfigurator.backend.FeatureLoader;
import de.pag.recomm.icc.carconfigurator.backend.FetchResource;
import de.pag.recomm.icc.carconfigurator.backend.FilterLoader;
import de.pag.recomm.icc.carconfigurator.backend.ListResources;
import de.pag.recomm.icc.carconfigurator.backend.LocalFetchResource;
import de.pag.recomm.icc.carconfigurator.backend.LocalListResources;
import de.pag.recomm.icc.carconfigurator.backend.ModelLoader;
import de.pag.recomm.icc.carconfigurator.backend.S3FetchResource;
import de.pag.recomm.icc.carconfigurator.backend.S3ListResources;
import de.pag.recomm.icc.carconfigurator.backend.Summary;
import de.pag.recomm.icc.carconfigurator.backend.SummaryLoader;
import io.awspring.cloud.core.config.AmazonWebserviceClientFactoryBean;
import java.util.List;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import reactor.core.CoreSubscriber;

@Configuration
@Slf4j
public class BeanConfig {

  @Bean
  public AmazonWebserviceClientFactoryBean<AmazonCloudWatchAsyncClient> amazonCloudWatchAsync(@Value("#{environment.AWS_REGION}") String region) {
    return new AmazonWebserviceClientFactoryBean<>(AmazonCloudWatchAsyncClient.class,
        new DefaultAWSCredentialsProviderChain(), () -> RegionUtils.getRegion(region == null ? "eu-central-1" : region));
  }

  @Value("${resource.loader.model.bucket}")
  String bucket;

  @Value("${model_version}")
  String modelVersion;

  @Value("${model.load.file.prefix}")
  String modelPrefix;

  @Value("${model.load.filter.prefix}")
  String filterPrefix;

  @Profile("!localtest")
  @Bean
  public ListResources s3ListResources(@Qualifier("mys3") AmazonS3 amazonS3) {
    return new S3ListResources(amazonS3, bucket);
  }

  @Profile("!localtest")
  @Bean
  public FetchResource s3FetchResources(@Qualifier("mys3") AmazonS3 amazonS3) {
    return new S3FetchResource(amazonS3, bucket);
  }

  @Value("${local.files.basepath:}")
  String localFileBasePath;

  @Profile("localtest")
  @Bean
  public ListResources localListResources() {
    return new LocalListResources(localFileBasePath);
  }

  @Profile("localtest")
  @Bean
  public FetchResource localFetchResources() {
    return new LocalFetchResource(localFileBasePath);
  }


  @Bean
  public ModelLoader loadModelFunction(FetchResource fetchResource) {
    return new ModelLoader("models/" + modelVersion + "/" + modelPrefix, fetchResource);
  }

  @Bean
  public FilterLoader loadFilterFunction(FetchResource fetchResource) {
    return new FilterLoader(filterPrefix, fetchResource);
  }

  @Bean
  public FeatureLoader loadFeatureMappingFunction() {
    return new FeatureLoader();
  }

  @Value("${resource.loader.initial_probability}")
  double initialProbability;

  @Bean
  public double initialProbability() {
    return initialProbability;
  }

  @Value("${summary.load.file.suffix}")
  String summarySuffix;

  @Bean
  public SummaryLoader summaryLoader(ListResources s3ListModelsQuery, FetchResource s3FetchModelQuery,
      List<CoreSubscriber<Summary>> summaryConsumers) {
    log.info("Load summary form {}", this.bucket + "/models/" + modelVersion);
    SummaryLoader summaryLoader = new SummaryLoader(s3FetchModelQuery, s3ListModelsQuery, "models/" + modelVersion,
        summarySuffix, summaryConsumers);
    summaryLoader.loadResources();
    return summaryLoader;
  }
}
