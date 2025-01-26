package de.pag.recomm.icc.carconfigurator.backend;

import com.amazonaws.SdkClientException;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.ObjectListing;
import com.amazonaws.services.s3.model.S3ObjectSummary;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import reactor.core.publisher.Flux;
import reactor.test.StepVerifier;

import java.util.Date;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.initMocks;

public class S3ListResourcesTest {

    private S3ListResources underTest;
    @Mock
    private AmazonS3 s3ClientMock;
    @Mock
    private ObjectListing olMock;
    private final List<S3ObjectSummary> s3os = new ArrayList<>();

    private static final String BUCKET = "test-bucket";
    private static final Date NOW = Date.from(Instant.now());

    @Before
    public void setup() {
        initMocks(this);
        underTest = new S3ListResources(s3ClientMock, BUCKET);
    }

    @Test
    public void listResourcesReturnsOneElement() {
        when(s3ClientMock.doesBucketExistV2(BUCKET)).thenReturn(Boolean.TRUE);
        when(s3ClientMock.listObjects(BUCKET, "p")).thenReturn(olMock);
        when(olMock.isTruncated()).thenReturn(Boolean.FALSE);
        when(olMock.getObjectSummaries()).thenReturn(s3os);
        S3ObjectSummary summary = new S3ObjectSummary();
        summary.setKey("key");
        summary.setLastModified(NOW);
        s3os.add(summary);

        Flux<ResourceMetadata> flux = underTest.listResources("p");

        StepVerifier
                .create(flux)
                .expectNext(new ResourceMetadata("key", NOW))
                .verifyComplete();
    }

    @Test
    public void listResourcesReturnsTruncatedList() {
        when(s3ClientMock.doesBucketExistV2(BUCKET)).thenReturn(Boolean.TRUE);
        when(s3ClientMock.listObjects(BUCKET, "p")).thenReturn(olMock);
        when(olMock.isTruncated()).thenReturn(Boolean.TRUE);
        when(olMock.getObjectSummaries()).thenReturn(s3os);
        ObjectListing olMock2 = mock(ObjectListing.class);
        when(s3ClientMock.listNextBatchOfObjects(any(ObjectListing.class))).thenReturn(olMock2);
        when(olMock2.isTruncated()).thenReturn(Boolean.FALSE);
        when(olMock2.getObjectSummaries()).thenReturn(s3os);
        S3ObjectSummary summary = new S3ObjectSummary();
        summary.setKey("key");
        summary.setLastModified(NOW);
        s3os.add(summary);

        Flux<ResourceMetadata> flux = underTest.listResources("p");

        StepVerifier
                .create(flux)
                .expectNext(new ResourceMetadata("key", NOW))
                .expectNext(new ResourceMetadata("key", NOW))
                .verifyComplete();
    }

    @Test
    public void listResourcesDoesntFindBucket() {
        when(s3ClientMock.doesBucketExistV2(BUCKET)).thenReturn(Boolean.FALSE);

        Flux<ResourceMetadata> flux = underTest.listResources("p");

        StepVerifier
                .create(flux)
                .verifyError(ResourceNotFoundException.class);
    }

    @Test
    public void listResourcesHasError() {
        SdkClientException testException = new SdkClientException("boom");
        when(s3ClientMock.doesBucketExistV2(BUCKET)).thenReturn(Boolean.TRUE);
        when(s3ClientMock.listObjects(BUCKET, "p")).thenThrow(testException);

        Flux<ResourceMetadata> flux = underTest.listResources("p");

        StepVerifier
                .create(flux)
                .verifyErrorMatches(throwable -> throwable.equals(testException));
    }

}
