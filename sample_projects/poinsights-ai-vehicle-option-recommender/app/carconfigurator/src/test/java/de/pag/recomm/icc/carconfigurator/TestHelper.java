package de.pag.recomm.icc.carconfigurator;

import java.io.InputStream;

public class TestHelper {
    public static InputStream loadTestFile(String filename) {
        return TestHelper.class
                .getClassLoader()
                .getResourceAsStream(filename);
    }
}
