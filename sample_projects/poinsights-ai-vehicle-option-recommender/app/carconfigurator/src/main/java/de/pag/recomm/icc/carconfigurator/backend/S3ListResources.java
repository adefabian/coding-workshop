package de.pag.recomm.icc.carconfigurator.backend;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.ObjectListing;
import lombok.AccessLevel;
import lombok.NonNull;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import reactor.core.publisher.Flux;

@FieldDefaults(level = AccessLevel.PRIVATE)
@Slf4j
public class S3ListResources implements ListResources {

    AmazonS3 amazonS3Client;
    private String bucket;

    public S3ListResources(@NonNull AmazonS3 amazonS3Client, String bucket) {
        this.amazonS3Client = amazonS3Client;
        this.bucket = bucket;
    }

    @Override
    public Flux<ResourceMetadata> listResources(String prefix) {
        return Flux.push(stringFluxSink -> {
            try {
                if (!amazonS3Client.doesBucketExistV2(bucket)) {
                    stringFluxSink.error(new ResourceNotFoundException("Bucket does not exist."));
                    return;
                }
                ObjectListing result = null;
                do {
                    result = result == null ? amazonS3Client.listObjects(bucket, prefix) : amazonS3Client.listNextBatchOfObjects(result);
                    result.getObjectSummaries().forEach(item -> stringFluxSink.next(new ResourceMetadata(item.getKey(), item.getLastModified())));
                }
                while (result.isTruncated());
            } catch (Exception e) {
                log.error("Cannot get list of bucket objects for bucket ({}) and prefix ({}) due to: ", bucket, prefix, e);
                stringFluxSink.error(e);
                return;
            }
            stringFluxSink.complete();
        });
    }
}
