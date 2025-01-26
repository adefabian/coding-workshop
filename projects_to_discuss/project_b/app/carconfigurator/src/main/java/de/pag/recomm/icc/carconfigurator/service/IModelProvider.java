package de.pag.recomm.icc.carconfigurator.service;

import de.pag.recomm.icc.carconfigurator.exception.ModelNotLoadableException;
import org.tensorflow.SavedModelBundle;

public interface IModelProvider {

  SavedModelBundle getValue(String modelcode) throws ModelNotLoadableException;
}
