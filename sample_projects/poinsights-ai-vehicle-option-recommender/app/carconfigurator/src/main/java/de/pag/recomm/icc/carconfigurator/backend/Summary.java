package de.pag.recomm.icc.carconfigurator.backend;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class Summary {
    @JsonProperty("run_id")
    String runId;
    @JsonProperty("train_id")
    String trainId;
    @JsonProperty("market")
    String market;
    @JsonProperty("db_filter")
    SummaryDbFilter dbFilter;
    @JsonProperty("model_version")
    String modelVersion;
    @JsonProperty("item_codes")
    List<String> itemCodes;
    @JsonProperty("val_acc")
    double valAcc;
    @JsonProperty("val_recall_m")
    double valRecallM;
    @JsonProperty("val_precision_m")
    double valPrecisionM;
    @JsonProperty("val_f1_m")
    double valF1M;

    public String getModelcode() {
      return dbFilter.getModelCode();
    }

    public String getModelCG() {
      return dbFilter.getModelCG();
    }
}
