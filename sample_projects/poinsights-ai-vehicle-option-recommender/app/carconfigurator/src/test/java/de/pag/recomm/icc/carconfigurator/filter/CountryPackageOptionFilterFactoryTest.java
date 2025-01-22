package de.pag.recomm.icc.carconfigurator.filter;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import de.pag.recomm.icc.carconfigurator.service.IFilterProvider;
import de.pag.recomm.icc.carconfigurator.service.Recommendation;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import static de.pag.recomm.icc.carconfigurator.TestHelper.loadTestFile;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * @author fabianade (fabian.ade@mhp.com) on 20.10.20.
 */

public class CountryPackageOptionFilterFactoryTest {
    @Mock
    private IFilterProvider loadFilterFunction = mock(IFilterProvider.class);

    @Before
    public void setUp() throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        TypeReference<List<CountryOptionPackage>> typeReferenceOptionPackage = new TypeReference<>() {
        };
        InputStream options = loadTestFile("country_package.json");
        when(loadFilterFunction.getCountryPackageOptions()).thenReturn(mapper.readValue(options, typeReferenceOptionPackage));
    }

    @Test
    public void testDeletionOfOptionWhichIsPartOfCountryPackage() {

        List<String> selectedOptions = List.of("PS2");
        List<Recommendation> recommendationList = new ArrayList<>();
        recommendationList.add(new Recommendation("4L6", 0.9));

        CountryPackageOptionFilterFactory swissFilter = new CountryPackageOptionFilterFactory(loadFilterFunction);
        List<Recommendation> filtered = recommendationList
                .stream()
                .filter(swissFilter.create(selectedOptions))
                .collect(Collectors.toList());
        assertTrue(filtered.isEmpty());
    }

    @Test
    public void testDeletionOfOptionWhichIsPartOfDifferentCountryPackage() {

        List<String> selectedOptions = List.of("PS2");
        List<Recommendation> recommendationList = new ArrayList<>();
        recommendationList.add(new Recommendation("6XV", 0.9));

        CountryPackageOptionFilterFactory swissFilter = new CountryPackageOptionFilterFactory(loadFilterFunction);
        List<Recommendation> filtered = recommendationList
                .stream()
                .filter(swissFilter.create(selectedOptions))
                .collect(Collectors.toList());
        assertEquals("6XV", filtered.get(0).getOption());
        assertEquals(0.9, filtered.get(0).getProbability(), 0.0);
        assertEquals(1, filtered.size());
    }

    @Test
    public void testNoCountryPackageSelected() {

        List<String> selectedOptions = List.of("A123");
        List<Recommendation> recommendationList = new ArrayList<>();
        recommendationList.add(new Recommendation("4L6", 0.9));

        CountryPackageOptionFilterFactory swissFilter = new CountryPackageOptionFilterFactory(loadFilterFunction);
        List<Recommendation> filtered = recommendationList
                .stream()
                .filter(swissFilter.create(selectedOptions))
                .collect(Collectors.toList());
        assertTrue(!filtered.isEmpty());
    }

    @Test
    public void testPartialMatchOfCountryPackageId() {

        List<String> selectedOptions = List.of("PS2A");
        List<Recommendation> recommendationList = new ArrayList<>();
        recommendationList.add(new Recommendation("4L6", 0.9));

        CountryPackageOptionFilterFactory swissFilter = new CountryPackageOptionFilterFactory(loadFilterFunction);
        List<Recommendation> filtered = recommendationList
                .stream()
                .filter(swissFilter.create(selectedOptions))
                .collect(Collectors.toList());
        assertTrue(!filtered.isEmpty());
    }

    @Test
    public void testOptionKeysHavePrefix() {

        List<String> selectedOptions = List.of("PP6C");
        List<Recommendation> recommendationList = new ArrayList<>();

        recommendationList.add(new Recommendation("C9M3", 0.9));
        recommendationList.add(new Recommendation("DQQ1", 0.4));
        recommendationList.add(new Recommendation("P4F2", 0.6));

        CountryPackageOptionFilterFactory swissFilter = new CountryPackageOptionFilterFactory(loadFilterFunction);
        List<Recommendation> filtered = recommendationList
                .stream()
                .filter(swissFilter.create(selectedOptions))
                .collect(Collectors.toList());
        assertTrue(filtered.isEmpty());
    }

    @Test
    public void testSomeOptionKeysHavePrefix() {

        List<String> selectedOptions = List.of("P6C");
        List<Recommendation> recommendationList = new ArrayList<>();

        recommendationList.add(new Recommendation("9M3", 0.9));
        recommendationList.add(new Recommendation("DQQ1", 0.4));
        recommendationList.add(new Recommendation("M1G8", 0.6));

        CountryPackageOptionFilterFactory swissFilter = new CountryPackageOptionFilterFactory(this.loadFilterFunction);
        List<Recommendation> filtered = recommendationList
                .stream()
                .filter(swissFilter.create(selectedOptions))
                .collect(Collectors.toList());
        assertTrue(filtered.isEmpty());
    }
}
