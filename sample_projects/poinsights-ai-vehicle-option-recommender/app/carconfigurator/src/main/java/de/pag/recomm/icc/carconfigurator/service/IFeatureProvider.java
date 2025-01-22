package de.pag.recomm.icc.carconfigurator.service;

import java.util.Map;

public interface IFeatureProvider {
    Map<Integer, String> getKey(String modelcode);
    Map<String, Integer> getValue(String modelcode);
}
