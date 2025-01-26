package de.pag.recomm.icc.carconfigurator.service;

import de.pag.recomm.icc.carconfigurator.backend.*;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import reactor.core.CoreSubscriber;
import reactor.core.publisher.BaseSubscriber;

import java.time.Instant;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static de.pag.recomm.icc.carconfigurator.TestHelper.loadTestFile;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.matches;
import static org.mockito.Mockito.*;
import static reactor.core.publisher.Flux.fromArray;

public class SummaryLoaderTest {

  @Mock
  private FetchResource fetchResourceOutPort;
  @Mock
  private ListResources listResourcesOutPort;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
  }

  private ResourceMetadata[] getResourceMetadataArray() {
    return new ResourceMetadata[]{
        new ResourceMetadata("model_ufzdqhee_Z7X0V2HFRS/summary_ufzdqhee.json", Date.from(Instant.now()))
    };
  }

  @Test
  public void allSummaryConsumersAreNotified() {
    when(listResourcesOutPort.listResources(anyString())).thenReturn(fromArray(getResourceMetadataArray()));
    when(fetchResourceOutPort.load(matches("model_ufzdqhee_Z7X0V2HFRS/summary_ufzdqhee.json"))).thenReturn(loadTestFile("model_ufzdqhee_Z7X0V2HFRS/summary_ufzdqhee.json"));
    List<CoreSubscriber<Summary>> s = new ArrayList<>();
    TestConsumer c1 = spy(TestConsumer.class);
    TestConsumer c2 = spy(TestConsumer.class);
    s.add(c1);
    s.add(c2);

    SummaryLoader underTest = new SummaryLoader(fetchResourceOutPort, listResourcesOutPort, "model_ufzdqhee_Z7X0V2HFRS/summary", ".json", s);
    underTest.loadResources();

    verify(c1, times(1)).hookOnNext(any());
    verify(c2, times(1)).hookOnNext(any());
  }

  @Test
  public void noSummaryConsumersAreNotifiedIfCompleted() {
    when(listResourcesOutPort.listResources(anyString())).thenReturn(fromArray(getResourceMetadataArray()));
    when(fetchResourceOutPort.load(matches("model_ufzdqhee_Z7X0V2HFRS/summary_ufzdqhee.json"))).thenReturn(loadTestFile("model_ufzdqhee_Z7X0V2HFRS/summary_ufzdqhee.json"));
    List<CoreSubscriber<Summary>> s = new ArrayList<>();
    CoreSubscriber<Summary> c1 = mock(CoreSubscriber.class);
    s.add(c1);

    SummaryLoader underTest = new SummaryLoader(fetchResourceOutPort, listResourcesOutPort, "model_ufzdqhee_Z7X0V2HFRS/summary", ".json", s);
    underTest.stop();
    underTest.loadResources();

    verify(c1, never()).onNext(any());
  }

  @Test
  public void noSummaryConsumersAreNotifiedIfSameSummaryIsOlder() {
    ResourceMetadata[] resourceMetadata = new ResourceMetadata[]{
        new ResourceMetadata("model_ufzdqhee_Z7X0V2HFRS/summary_ufzdqhee.json", Date.from(Instant.now())),
        new ResourceMetadata("model_ufzdqhee_Z7X0V2HFRS/summary_ufzdqhee.json", Date.from(Instant.now().minusSeconds(15L)))
    };
    when(listResourcesOutPort.listResources(anyString())).thenReturn(fromArray(resourceMetadata));
    when(fetchResourceOutPort.load(matches("model_ufzdqhee_Z7X0V2HFRS/summary_ufzdqhee.json"))).thenAnswer(invocationOnMock -> loadTestFile(
        "model_ufzdqhee_Z7X0V2HFRS/summary_ufzdqhee.json"));
    List<CoreSubscriber<Summary>> s = new ArrayList<>();
    TestConsumer c1 = spy(TestConsumer.class);
    s.add(c1);

    SummaryLoader underTest = new SummaryLoader(fetchResourceOutPort, listResourcesOutPort, "model_ufzdqhee_Z7X0V2HFRS/summary", ".json", s);
    underTest.loadResources();

    verify(c1, times(1)).hookOnNext(any());
  }

  @Test
  public void noSummaryConsumersAreNotifiedIfNoSummariesInList() {
    when(listResourcesOutPort.listResources(anyString())).thenReturn(fromArray(new ResourceMetadata[]{}));
    List<CoreSubscriber<Summary>> s = new ArrayList<>();
    TestConsumer c1 = spy(TestConsumer.class);
    s.add(c1);

    SummaryLoader underTest = new SummaryLoader(fetchResourceOutPort, listResourcesOutPort, "model_ufzdqhee_Z7X0V2HFRS/summary_", ".json", s);
    underTest.loadResources();

    verify(c1, never()).hookOnNext(any());
  }

  @Test
  public void wrongSuffixIsIgnored() {
    when(listResourcesOutPort.listResources(anyString())).thenReturn(
        fromArray(
            new ResourceMetadata[]{
                new ResourceMetadata("model_ufzdqhee_Z7X0V2HFRS/summary_ufzdqhee.wrong", Date.from(Instant.now()))
            }
        )
    );
    List<CoreSubscriber<Summary>> s = new ArrayList<>();
    CoreSubscriber<Summary> c1 = mock(CoreSubscriber.class);
    s.add(c1);

    SummaryLoader underTest = new SummaryLoader(fetchResourceOutPort, listResourcesOutPort, "model_ufzdqhee_Z7X0V2HFRS/summary", ".json", s);
    underTest.loadResources();

    verify(c1, never()).onNext(any());
  }

  static class TestConsumer extends BaseSubscriber<Summary> {

    public Summary summary;

    @Override
    public void hookOnNext(Summary summary) {
      this.summary = summary;
    }
  }
}
