package de.porsche.datalake.mib2;

import com.google.common.base.CaseFormat;
import de.porsche.datalake.core.Configs;
import de.porsche.datalake.core.DataLakeBase;
import de.porsche.datalake.model.tools.Flatten;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.math3.random.RandomDataGenerator;
import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.expressions.UserDefinedFunction;
import org.apache.spark.sql.streaming.DataStreamWriter;
import org.apache.spark.sql.streaming.StreamingQueryException;
import org.apache.spark.sql.types.DataTypes;
import org.apache.spark.sql.types.StructField;
import org.apache.spark.sql.types.StructType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import static org.apache.spark.sql.functions.*;
//TODO JavaDocs and corporate license statement (on top of the file) are missing
public class ArchivistMib2Main extends DataLakeBase {

  private static final Logger logger = LoggerFactory.getLogger(ArchivistMib2Main.class);

  public static void main(String[] args) {
    new ArchivistMib2Main()
        .run();
  }

  @Override
  //TODO This method can be divided into different methods to make it more maintainable and readable.
  // Please add some log statements in order to debug.
  public void run() {
//TODO if it is irrelevant this code should be deleted.
//    ClampSignal_lnd +
//    LocalHazardEvent_lnd +
//    Message_lnd +
//    Meta_lnd +
//    NavDbRegionVersion_lnd +
//    ParkingInfo_lnd +
//    PathPositions_lnd +
//    TelemetryData_lnd +
//    TrafficRestriction_lnd +

    TopicProcessor processor = new TopicProcessor().invoke(config.getKafkaTopics(), eu.tsystems.mms.DatalakeMIB.model.xfcd.codec.Core.XfcdEnvelope.class.getTypeName(), "mib2-parquet-backup", InputFormat.PROTOBUF);

    Dataset<Row> processedDF = processor.getProcessedDF();
    Dataset<Row> incomingFlat = Flatten.makeItFlat(processedDF, 3, "__");

    UserDefinedFunction transformBase64String = udf(
        (byte[] bytes) -> Base64.encodeBase64String(bytes), DataTypes.StringType
    );

    UserDefinedFunction generateLongId = udf(
        () -> new RandomDataGenerator().nextLong(0, Long.MAX_VALUE), DataTypes.LongType
    );

    incomingFlat = incomingFlat
        .withColumn("id", generateLongId.apply())
        .withColumn("messages__flow__uuid_session", transformBase64String.apply(col("messages__flow__uuid_session")))
        .withColumn("messages__flow__uuid_config", transformBase64String.apply(col("messages__flow__uuid_config")));


    // Message flow table -> merged in every other table
    String[] flowCols = {"messages__flow__uuid_session", "messages__flow__seq_session", "messages__flow__uuid_config"};
    Dataset<Row> flowDf = incomingFlat.select("id", flowCols);
    flowDf = formatColHeadersMessageTable(flowDf, CaseFormat.UPPER_CAMEL);
    flowDf = flowDf.withColumn("date", date_format(current_date(), "yyyy_MM_dd"));

    if (Configs.INSTANCE.isLocalMode()) {
      incomingFlat.printSchema();
      flowDf.printSchema();
    }

    DataStreamWriter<Row> flowSink = getParquetSink("Message_lnd", flowDf);
    flowSink.start();
    initConsoleSink(flowDf);


    // meta array and Meta_lnd table
    String[] allMeta = ArrayUtils.addAll(flowCols, "messages__meta");
    Dataset<Row> messagesFlatMeta = Flatten.makeItFlat(incomingFlat.select("id", allMeta), 3, "__");
    messagesFlatMeta = Flatten.makeItFlat(messagesFlatMeta, 2, "__");
    StructField[] fieldsMeta = messagesFlatMeta.schema().fields();
    String[] columnsMeta = new String[fieldsMeta.length];
    for (int i = 0; i < fieldsMeta.length; i++) {
      columnsMeta[i] = fieldsMeta[i].name();
    }
    createValueTable(flowCols, messagesFlatMeta, "Meta_lnd",
        Arrays.stream(columnsMeta).filter((s) -> s.contains("info")).toArray(String[]::new));


    // payload array and corresponding tables
    String[] all = ArrayUtils.addAll(flowCols, "messages__payload");
    Dataset<Row> messagesFlatPayload = Flatten.makeItFlat(incomingFlat.select("id", all), 3, "__");

    if (Configs.INSTANCE.isLocalMode()) {
      messagesFlatPayload.printSchema();
    }
    //TODO no need for this loop, please refer to api, directly we can get fieldNames messagesFlatPayload.schema().filedNames.toList
    StructField[] fields = messagesFlatPayload.schema().fields();
    String[] columns = new String[fields.length];
    for (int i = 0; i < fields.length; i++) {
      columns[i] = fields[i].name();
    }

    // ClampSignal_lnd
    createValueTable(flowCols, messagesFlatPayload, "ClampSignal_lnd",
        Arrays.stream(columns).filter((s) -> s.contains("payload__timestamp") || s.contains("app__clamp_signal")).toArray(String[]::new));

    // LocalHazardEvent_lnd
    createValueTable(flowCols, messagesFlatPayload, "LocalHazardEvent_lnd",
        Arrays.stream(columns).filter((s) -> s.contains("payload__timestamp") || s.contains("app__local_hazard")).toArray(String[]::new));

    // NavDbRegionVersion_lnd
    createValueTable(flowCols, messagesFlatPayload, "NavDbRegionVersion_lnd",
        Arrays.stream(columns).filter((s) -> s.contains("payload__timestamp") || s.contains("messages__payload__app__nav_db_region_version__version")).toArray(String[]::new) );

    // ParkingInfo_lnd
    createValueTable(flowCols, messagesFlatPayload, "ParkingInfo_lnd",
    	 Arrays.stream(columns).filter((s) -> s.contains("payload__timestamp") || s.contains("messages__payload__app__parking_info__event_type")).toArray(String[]::new) );

    // PathPositions_lnd
    createValueTable(flowCols, messagesFlatPayload, "PathPositions_lnd",
        Arrays.stream(columns).filter((s) -> s.contains("payload__timestamp") || s.contains("payload__position")).toArray(String[]::new));

    // TrafficRestriction_lnd
    createValueTable(flowCols, messagesFlatPayload, "TrafficRestriction_lnd",
        Arrays.stream(columns).filter((s) -> s.contains("payload__timestamp") || s.contains("app__traffic_restric")).toArray(String[]::new));

    // Telemetry_lnd
    String[] telemetryDataCols = {"messages__payload__timestamp"
        , "messages__flow__uuid_session"
        , "messages__flow__seq_session"
        , "messages__flow__uuid_config"
        , "messages__payload__telemetry__signal_data__key"
        , "messages__payload__telemetry__signal_data__value"
        , "messages__payload__telemetry__opaque_data__key"
        , "messages__payload__telemetry__opaque_data__value"};
    Dataset<Row> telemetryDataDf = messagesFlatPayload.select("id", telemetryDataCols);

    if (Configs.INSTANCE.isLocalMode()) {
      telemetryDataDf.printSchema();
    }
    //TODO If this name changes then it requires a code change. Can we get from properties file.
    String file = "audi-sammelbare-signale-in-dsas.csv";

    StructType schema = new StructType()
        .add("ID", "integer")
        .add("Message", "string")
        .add("Signal", "string");
    Dataset<Row> dsasSignal = spark.read().format("csv")
        .option("sep", ",")
        .option("header", "true")
        .schema(schema)
        .load(file);
    dsasSignal = dsasSignal.withColumnRenamed("ID", "signalId");

    if (config.isLocalMode()) {
      dsasSignal.show();
      dsasSignal.printSchema();
    }
    //TODO no need re-reference, can be written as 1 statement as it is written from line 179 to 185.
    Dataset<Row> signalMapDf = telemetryDataDf.join(dsasSignal, telemetryDataDf.col("messages__payload__telemetry__signal_data__value").equalTo(dsasSignal.col("signalId")), "left");
    signalMapDf = signalMapDf.drop("signalId");
    signalMapDf = signalMapDf.withColumnRenamed("messages__payload__telemetry__signal_data__key", "signalKey");
    signalMapDf = signalMapDf.withColumnRenamed("messages__payload__telemetry__signal_data__value", "signalValue");
    signalMapDf = signalMapDf.withColumnRenamed("Message", "signalKeyMessage");
    signalMapDf = signalMapDf.withColumnRenamed("Signal", "signalKeySignal");
    signalMapDf = signalMapDf.join(dsasSignal, signalMapDf.col("messages__payload__telemetry__opaque_data__key").equalTo(dsasSignal.col("signalId")), "left");
    signalMapDf = signalMapDf.drop("signalId");
    signalMapDf = signalMapDf.withColumnRenamed("messages__payload__telemetry__opaque_data__key", "opaqueKey");
    signalMapDf = signalMapDf.withColumn("opaqueValue", transformBase64String.apply(col("messages__payload__telemetry__opaque_data__value"))).drop("messages__payload__telemetry__opaque_data__value");
    signalMapDf = signalMapDf.withColumnRenamed("Message", "opaqueKeyMessage");
    signalMapDf = signalMapDf.withColumnRenamed("Signal", "opaqueKeySignal")
        .withColumnRenamed("id", "Id")
        .withColumnRenamed("messages__payload__timestamp", "timestamp")
        .withColumnRenamed("messages__flow__uuid_session", "UuidSession")
        .withColumnRenamed("messages__flow__seq_session", "SeqSession")
        .withColumnRenamed("messages__flow__uuid_config", "UuidConfig")
        .withColumn("date", date_format(current_date(), "yyyy_MM_dd"));

    if (config.isLocalMode()) {
      signalMapDf.printSchema();
    }

    DataStreamWriter<Row> telemetryData = getParquetSink("TelemetryData_lnd", signalMapDf);
    telemetryData.start();
    initConsoleSink(signalMapDf);

    try {
      processor.getStreamingQuery().awaitTermination();
    } catch (StreamingQueryException e) {
      logger.error("-----> StreamingQueryException", e);
    }
  }

  private void createValueTable(String[] flowCols, Dataset<Row> messagesFlat, String sinkFolder, String... colNames) {
    Dataset<Row> dataset = messagesFlat.select("id", (String[]) ArrayUtils.addAll(flowCols, colNames));
    dataset = formatColHeaders(dataset, CaseFormat.LOWER_CAMEL);
    // Add date column for partitioning
    dataset = dataset.withColumn("date", date_format(current_date(), "yyyy_MM_dd"));
    if (Configs.INSTANCE.isLocalMode()) {
      dataset.printSchema();
    }
    DataStreamWriter<Row> sink = getParquetSink(sinkFolder, dataset);
    sink.start();
    initConsoleSink(dataset);
  }

  private Dataset<Row> formatColHeaders(Dataset<Row> dataset, CaseFormat caseFormat) {
    String[] columns = dataset.columns();
    List<String> newColumnNames = new ArrayList();
    //TODO please explain this code in short comments
    for (String col : columns) {
      //TODO i is not a right variable name, please provide correct name.
      // Some portion is just repeated in next method.
      //  a flag as parameter could make one method as next method is just subset of this method.
      int i = col.lastIndexOf("__");
      String newColName;
      if (col.contains("timestamp")) {
        newColumnNames.add("timestamp");
        continue;
      } else if (col.contains("uuid_session") || col.contains("seq_session") || col.contains("uuid_config")) {
        if (i != -1) {
          newColName = CaseFormat.LOWER_UNDERSCORE.to(CaseFormat.UPPER_CAMEL, col.substring(i + 2));
        } else {
          newColName = CaseFormat.LOWER_UNDERSCORE.to(CaseFormat.UPPER_CAMEL, col);
        }
        newColumnNames.add(newColName);
        continue;
      } else if (col.equals("id")) {
        newColumnNames.add("Id");
        continue;
      }
      if (i != -1) {
        newColName = CaseFormat.LOWER_UNDERSCORE.to(caseFormat, col.substring(i + 2));
      } else {
        newColName = CaseFormat.LOWER_UNDERSCORE.to(caseFormat, col);
      }
      newColumnNames.add(newColName);
    }

    for (int i = 0; i < columns.length; i++) {
      dataset = dataset.withColumnRenamed(columns[i], newColumnNames.get(i));
    }
    return dataset;
  }

  private Dataset<Row> formatColHeadersMessageTable(Dataset<Row> dataset, CaseFormat caseFormat) {
    String[] columns = dataset.columns();
    List<String> newColumnNames = new ArrayList();
    //TODO please explain this code in short comments
    for (String col : columns) {
      //TODO i is not a right variable name, please provide correct name.
      int i = col.lastIndexOf("__");
      String newColName;
      if (col.contains("timestamp")) {
        newColumnNames.add("timestamp");
        continue;
      }
      if (i != -1) {
        newColName = CaseFormat.LOWER_UNDERSCORE.to(caseFormat, col.substring(i + 2));
      } else {
        newColName = CaseFormat.LOWER_UNDERSCORE.to(caseFormat, col);
      }
      newColumnNames.add(newColName);
    }

    for (int i = 0; i < columns.length; i++) {
      dataset = dataset.withColumnRenamed(columns[i], newColumnNames.get(i));
    }
    return dataset;
  }
 // test
}
