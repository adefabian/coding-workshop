package de.pag.recomm.icc.carconfigurator.web.request;

import java.util.List;
import lombok.Data;

@Data
public class RequestData {
  private String model_code;
  private List<String> option_codes;
}
