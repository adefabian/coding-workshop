package de.pag.recomm.icc.carconfigurator;

import net.skobow.auth.apikey.autoconfigure.EnableApiKeyAuthentication;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@EnableApiKeyAuthentication
public class CarConfiguratorApplication {

  public static void main(String[] args) {
    SpringApplication.run(CarConfiguratorApplication.class, args);
  }

}
