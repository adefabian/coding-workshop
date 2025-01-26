package de.pag.recomm.icc.carconfigurator.web;

import de.pag.recomm.icc.carconfigurator.service.Data;
import de.pag.recomm.icc.carconfigurator.service.FetchRecommendationsService;
import de.pag.recomm.icc.carconfigurator.service.Meta;
import de.pag.recomm.icc.carconfigurator.service.Recommendation;
import de.pag.recomm.icc.carconfigurator.service.Response;
import de.pag.recomm.icc.carconfigurator.web.request.RequestMain;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import lombok.AccessLevel;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.MDC;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

/**
 * Endpoint for getting recommendations for a specific model
 */
@RestController
@RequestMapping(value = {"/api/v1", "/v1"})
@FieldDefaults(level = AccessLevel.PRIVATE)
@Slf4j
public class RestGetRecommendationsController {

  @Value("${model_version}")
  private String version;

  private final static Set<String> countryWhitelist = new HashSet<>();

  static {
    countryWhitelist.add("de"); // Germany
    countryWhitelist.add("ch"); // Switzerland
    countryWhitelist.add("cn"); // China
    countryWhitelist.add("tw"); // Taiwan
    countryWhitelist.add("gb"); // Great Britain
    countryWhitelist.add("us"); // USA
    countryWhitelist.add("ca"); // Canada
    countryWhitelist.add("it"); // Italy
    countryWhitelist.add("es"); // Spain
    countryWhitelist.add("pt"); // Portugal
    countryWhitelist.add("fr"); // France
    countryWhitelist.add("ru"); // Russia
    countryWhitelist.add("jp"); // Japan
    countryWhitelist.add("au"); // Australia
    countryWhitelist.add("kr"); // South Korea
    countryWhitelist.add("br"); // Brazil
    countryWhitelist.add("pl"); // Poland
    countryWhitelist.add("be"); // Belgium
    countryWhitelist.add("nl"); // Netherlands
    countryWhitelist.add("mx"); // Mexico
    countryWhitelist.add("se"); // Sweden
    countryWhitelist.add("in"); // India
    countryWhitelist.add("tr"); // Turkey
    countryWhitelist.add("no"); // Norway
    countryWhitelist.add("hk"); // Hong Kong
    countryWhitelist.add("sg"); // Singapore
    countryWhitelist.add("my"); // Malaysia
    countryWhitelist.add("th"); // Thailand
    countryWhitelist.add("za"); // South Africa
    countryWhitelist.add("ae"); // United Arab Emirates
    countryWhitelist.add("ae-du"); // United Arab Emirates
    countryWhitelist.add("ae-az"); // United Arab Emirates

  }

  private final static Map<String, String> porscheMarketToIso = new ConcurrentHashMap<>();

  static {
    porscheMarketToIso.put("pd", "de");
    porscheMarketToIso.put("pch", "ch");
    porscheMarketToIso.put("pgcn", "cn");
    porscheMarketToIso.put("ptw", "tw");
    porscheMarketToIso.put("pcgb", "gb");
    porscheMarketToIso.put("pcna", "us");
    porscheMarketToIso.put("market", "market");
  }

  private final FetchRecommendationsService service;

  public RestGetRecommendationsController(FetchRecommendationsService service) {
    this.service = service;
  }

  // Old GET endpoint, still here for compatibility reasons
  @GetMapping("/{market}/icc-recommender")
  public Flux<Recommendation> getRecommendationsGET(@PathVariable String market, GetRecommendationsRequest request) {
    String isoCountry = porscheMarketToIso.get(market.toLowerCase());
    if (!countryWhitelist.contains(isoCountry)) {
      throw new IllegalArgumentException("Unknown iso country market code!");
    }

    MDC.put("userId", request.sessionid);
    MDC.put("country", isoCountry);
    MDC.put("modelCode", request.modelcode);
    MDC.put("selectedFeatures", request.options.toString());

    log.info("Recommendation GET request received");
    Flux<Recommendation> recommendations = service
        .getRecommendations(request.modelcode, request.options, request.size, isoCountry)
        .log()
        .contextWrite(context -> context.put("userId", request.sessionid)
            .put("country", isoCountry)
            .put("modelCode", request.modelcode)
            .put("selectedFeatures", request.options.toString()));

    MDC.clear();
    return recommendations;
  }

  // New POST endpoint, follows API blueprint schema
  @PostMapping(path = "/options", consumes = "application/json")
  public Mono<Response> getRecommendationsPOST(@RequestBody RequestMain request) {
    String isoCountry = request.getFilter().getCountry().toLowerCase();
    if (!countryWhitelist.contains(isoCountry)) {
      return Mono.error(new IllegalArgumentException("Unknown iso country market code!"));
    }
    String modelCode = request.getData().getModel_code();
    List<String> optionCodes = request.getData().getOption_codes();
    int size = request.getFilter().getCount_r();
    String uuid = request.getMeta().getUuid();
    String timestamp = request.getMeta().getTimestamp();

    MDC.put("country", isoCountry);
    MDC.put("modelCode", modelCode);
    MDC.put("selectedFeatures", optionCodes.toString());

    log.info("Recommendation POST request received");
    Flux<Recommendation> recommendations = service
        .getRecommendations(modelCode, optionCodes, size, isoCountry)
        .log()
        .contextWrite(context -> context.put("userId", uuid)
            .put("country", isoCountry)
            .put("modelCode", modelCode)
            .put("selectedFeatures", optionCodes.toString()));
    MDC.clear();

    return recommendations
        .collectList()
        .map(r -> new Response(new Meta(uuid, timestamp, version), new Data(r)));
  }
}
