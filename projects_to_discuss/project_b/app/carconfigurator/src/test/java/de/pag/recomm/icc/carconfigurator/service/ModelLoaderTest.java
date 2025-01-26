package de.pag.recomm.icc.carconfigurator.service;

import static de.pag.recomm.icc.carconfigurator.TestHelper.loadTestFile;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.matches;
import static org.mockito.Mockito.doAnswer;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import de.pag.recomm.icc.carconfigurator.backend.FetchResource;
import de.pag.recomm.icc.carconfigurator.backend.ModelLoader;
import de.pag.recomm.icc.carconfigurator.backend.Summary;
import de.pag.recomm.icc.carconfigurator.exception.ModelNotLoadableException;
import java.io.File;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.file.Paths;
import java.util.Map;
import org.apache.commons.io.FileUtils;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.stubbing.Answer;
import org.tensorflow.SavedModelBundle;
import org.tensorflow.Signature;
import org.tensorflow.Signature.TensorDescription;

public class ModelLoaderTest {

  @Mock
  private FetchResource fetchResourceOutPort;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
  }

  @Test
  public void modelsAreLoadedBySummaryRunId()
      throws ModelNotLoadableException, URISyntaxException {
    when(fetchResourceOutPort.load(matches("model_ufzdqhee_Z7X0V2HFRS"))).thenReturn(loadTestFile("model_ufzdqhee_Z7X0V2HFRS"));
    doAnswer((Answer<Void>) invocation -> {
      FileUtils.copyDirectory(
          new File(Paths.get(ModelLoaderTest.class.getClassLoader().getResource("model_ufzdqhee_Z7X0V2HFRS/model").toURI()).toString()),
          new File("/tmp/model_ufzdqhee_Z7X0V2HFRS/model"));
      return null;
    })
        .when(fetchResourceOutPort).downloadFolder(anyString(), anyString());
    Summary summary = mock(Summary.class);
    when(summary.getRunId()).thenReturn("ufzdqhee");
    when(summary.getTrainId()).thenReturn("Z7X0V2HFRS");
    when(summary.getModelcode()).thenReturn("modelcode");
    when(summary.getMarket()).thenReturn("market");

    ModelLoader underTest = new ModelLoader("model_", fetchResourceOutPort);
    underTest.onNext(summary);
    underTest.onComplete();
    SavedModelBundle outcome = underTest.getValue("modelcode");

    URL modelURL = ModelLoaderTest.class.getClassLoader().getResource("model_ufzdqhee_Z7X0V2HFRS/model");
    String modelPath = Paths.get(modelURL.toURI()).toString();
    SavedModelBundle expected = SavedModelBundle.load(modelPath, "serve");

    testModelEquality(expected, outcome);
  }

  @Test
  public void modelIsLoadedFromCache()
      throws ModelNotLoadableException {
    doAnswer((Answer<Void>) invocation -> {
      FileUtils.copyDirectory(
          new File(Paths.get(ModelLoaderTest.class.getClassLoader().getResource("model_ufzdqhee_Z7X0V2HFRS/model").toURI()).toString()),
          new File("/tmp/model_ufzdqhee_Z7X0V2HFRS/model"));
      return null;
    })
        .when(fetchResourceOutPort).downloadFolder(anyString(), anyString());
    Summary summary = mock(Summary.class);
    when(summary.getRunId()).thenReturn("ufzdqhee");
    when(summary.getTrainId()).thenReturn("Z7X0V2HFRS");
    when(summary.getModelcode()).thenReturn("modelcode");
    when(summary.getMarket()).thenReturn("market");

    ModelLoader underTest = new ModelLoader("model_", fetchResourceOutPort);
    underTest.onNext(summary);
    underTest.onComplete();

    SavedModelBundle outcome1 = underTest.getValue("modelcode");
    SavedModelBundle outcome2 = underTest.getValue("modelcode");

    assertEquals(outcome1, outcome2);
    verify(fetchResourceOutPort, times(1)).downloadFolder(anyString(), anyString());
  }

  private void testModelEquality(SavedModelBundle expected, SavedModelBundle actual) {
    for (Signature expectedSignature : expected.signatures()) {
      boolean hasMatch = false;
      for (Signature actualSignature : actual.signatures()) {
        if (expectedSignature.key().equals(actualSignature.key())) {
          hasMatch = true;
          assertTrue(expectedSignature.methodName().equals(actualSignature.methodName()));
          assertTrue(expectedSignature.inputNames().equals(actualSignature.inputNames()));
          assertTrue(expectedSignature.outputNames().equals(actualSignature.outputNames()));
          for (Map.Entry<String, TensorDescription> input : expectedSignature.getInputs().entrySet()) {
            TensorDescription expectedInput = input.getValue();
            TensorDescription actualInput = actualSignature.getInputs().get(input.getKey());
            assertTrue(expectedInput.name.equals(actualInput.name));
            assertTrue(expectedInput.dataType.equals(actualInput.dataType));
            assertTrue(expectedInput.shape.toString().equals(actualInput.shape.toString()));
          }
          for (Map.Entry<String, TensorDescription> output : expectedSignature.getOutputs().entrySet()) {
            TensorDescription expectedOutput = output.getValue();
            TensorDescription actualOutput = actualSignature.getOutputs().get(output.getKey());
            assertTrue(expectedOutput.name.equals(actualOutput.name));
            assertTrue(expectedOutput.dataType.equals(actualOutput.dataType));
            assertTrue(expectedOutput.shape.toString().equals(actualOutput.shape.toString()));
          }
          break;
        }
      }
      assertTrue(hasMatch);
    }
  }
}
