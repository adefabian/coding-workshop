package de.pag.recomm.icc.carconfigurator.web;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;

import java.util.Collections;
import java.util.List;

@Getter
@Setter
public class GetRecommendationsRequest {

    @Setter(AccessLevel.NONE)
    String market;

    List<String> options = Collections.emptyList();

    @Setter(AccessLevel.NONE)
    String modelcode;

    int size = 5;

    String sessionid;

    long timestamp;

    public void setMarket(String market) {
        this.market = market.toLowerCase();
    }

    public void setModelcode(String modelcode) {
        this.modelcode = modelcode.toLowerCase();
    }

}
