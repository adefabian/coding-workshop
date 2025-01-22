package de.pag.recomm.icc.carconfigurator.web.request;

import lombok.Data;

@Data
public class RequestMain {
  private RequestMeta meta;
  private RequestFilter filter;
  private RequestData data;
}