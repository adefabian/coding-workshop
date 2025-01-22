package de.pag.recomm.icc.carconfigurator.web;

import static org.mockito.Mockito.when;
import static org.springframework.http.MediaType.APPLICATION_JSON;

import de.pag.recomm.icc.carconfigurator.service.FetchRecommendationsService;
import de.pag.recomm.icc.carconfigurator.service.Recommendation;
import de.pag.recomm.icc.carconfigurator.web.request.RequestData;
import de.pag.recomm.icc.carconfigurator.web.request.RequestFilter;
import de.pag.recomm.icc.carconfigurator.web.request.RequestMain;
import de.pag.recomm.icc.carconfigurator.web.request.RequestMeta;
import java.util.ArrayList;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.MockitoAnnotations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.reactive.WebFluxTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.reactive.server.EntityExchangeResult;
import org.springframework.test.web.reactive.server.WebTestClient;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

@RunWith(SpringRunner.class)
@WebFluxTest
@ContextConfiguration(classes = RestGetRecommendationsController.class)
public class RestGetRecommendationsControllerTest {

  private RestGetRecommendationsController restGetRecommendationsController;

  private WebTestClient webTestClient;

  @Autowired
  protected ApplicationContext context;

  @MockBean(name = "fetchRecommendationsQuery")
  private FetchRecommendationsService fetchRecommendationsServiceInPort;

  @Before
  public void init() {
    MockitoAnnotations.initMocks(this);

    restGetRecommendationsController = new RestGetRecommendationsController(fetchRecommendationsServiceInPort);
    webTestClient = WebTestClient.bindToController(restGetRecommendationsController).build();
  }

  @Test
  public void testAPI() {
    List<String> options = new ArrayList<>();
    options.add("SOME_FEATURE");

    Recommendation recommendation1 = new Recommendation("ATEST1", 1.0);
    Recommendation recommendation2 = new Recommendation("BTEST2", 0.9);
    Recommendation recommendation3 = new Recommendation("CTEST3", 0.8);

    List<Recommendation> recommendations = new ArrayList<>();
    recommendations.add(recommendation1);
    recommendations.add(recommendation2);
    recommendations.add(recommendation3);

    RequestMain request = new RequestMain();
    RequestData data = new RequestData();
    data.setModel_code("987654");
    List<String> option_codes = new ArrayList<>();
    option_codes.add("SOME_FEATURE");
    data.setOption_codes(option_codes);
    RequestMeta meta = new RequestMeta();
    meta.setUuid("123456");
    meta.setTimestamp("5678");
    RequestFilter filter = new RequestFilter();
    filter.setCount_r(3);
    filter.setCountry("de");
    request.setData(data);
    request.setFilter(filter);
    request.setMeta(meta);

    String stringResult = "{\"meta\":{\"uuid\":\"123456\",\"timestamp\":\"5678\",\"model_version\":\"${model_version}\"},\"data\":{\"recommendations\":[{\"option\":\"ATEST1\",\"probability\":1.0},{\"option\":\"BTEST2\",\"probability\":0.9},{\"option\":\"CTEST3\",\"probability\":0.8}]}}";

    when(fetchRecommendationsServiceInPort.getRecommendations("987654",
            options, 3, "de"))
        .thenReturn(Flux.fromIterable(recommendations));

    EntityExchangeResult<String> result = this.webTestClient
        .post().uri("/v1/options")
        .accept(APPLICATION_JSON)
        .contentType(APPLICATION_JSON)
        .body(Mono.just(request), RequestMain.class)
        .exchange()
        .expectStatus().isOk()
        .expectBody(String.class)
        .returnResult();

    String receivedResult = result.getResponseBody();
    assert (receivedResult.equals(stringResult));
  }
}
