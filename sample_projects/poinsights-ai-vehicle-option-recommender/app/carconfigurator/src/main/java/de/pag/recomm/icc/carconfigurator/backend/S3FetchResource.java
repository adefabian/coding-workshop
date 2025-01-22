package de.pag.recomm.icc.carconfigurator.backend;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.SdkClientException;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.transfer.MultipleFileDownload;
import com.amazonaws.services.s3.transfer.TransferManager;
import com.amazonaws.services.s3.transfer.TransferManagerBuilder;
import de.pag.recomm.icc.carconfigurator.exception.ForbiddenException;
import java.io.File;
import java.io.InputStream;
import lombok.AccessLevel;
import lombok.NonNull;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;

@FieldDefaults(level = AccessLevel.PRIVATE)
@Slf4j
public class S3FetchResource implements FetchResource {

  private final AmazonS3 amazonS3Client;
  private final String bucket;
  private final TransferManager transferManager;

  public S3FetchResource(@NonNull AmazonS3 amazonS3Client, String bucket) {
    this.amazonS3Client = amazonS3Client;
    this.bucket = bucket;
    this.transferManager = TransferManagerBuilder.standard().withS3Client(amazonS3Client).build();
  }

  @Override
  public void downloadFolder(String folderKey, String destinationDirectory) {
    try {
      MultipleFileDownload download = transferManager.downloadDirectory(bucket, folderKey, new File(destinationDirectory));
      download.waitForCompletion();
    } catch (InterruptedException e) {
      log.error("Cannot download key ({}}) from bucket ({}}) due to: ", folderKey, bucket, e);
      throw new RuntimeException(e);
    }
  }

  @Override
  public InputStream load(String resource) {
    try {
      if (!amazonS3Client.doesBucketExistV2(bucket)) {
        throw new ResourceNotFoundException("Bucket does not exist.");
      }
      if (!amazonS3Client.doesObjectExist(bucket, resource)) {
        throw new ResourceNotFoundException("Object does not exist.");
      }
      // S3Object includes the bucket name, key (object name), object meta (meta information), and InputStream.
      return amazonS3Client
          .getObject(bucket, resource)
          .getObjectContent();
    } catch (AmazonServiceException e) {
      log.error("S3 service exception -> ", e);
      throw new ForbiddenException(e.getMessage());
    } catch (SdkClientException e) {
      log.error("Cannot get resource ({}}) of bucket objects for bucket ({}}) due to: ", resource, bucket, e);
      throw new RuntimeException(e);
    }
  }
}
