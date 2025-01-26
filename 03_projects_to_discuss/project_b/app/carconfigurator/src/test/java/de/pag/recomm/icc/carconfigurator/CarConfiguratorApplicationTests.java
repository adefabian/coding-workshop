package de.pag.recomm.icc.carconfigurator;

import de.pag.recomm.icc.carconfigurator.service.IFilterProvider;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
@ActiveProfiles({"localtest"})
public class CarConfiguratorApplicationTests {

    @MockBean(name = "loadFilterFunction")
    IFilterProvider loadFilterFunction;

    @Test
    public void contextLoads() {
    }

}
