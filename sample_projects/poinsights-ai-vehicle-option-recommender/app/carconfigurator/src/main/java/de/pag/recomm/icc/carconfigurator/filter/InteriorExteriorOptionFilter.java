package de.pag.recomm.icc.carconfigurator.filter;

import de.pag.recomm.icc.carconfigurator.service.Recommendation;

import java.util.function.Predicate;

/**
 * @author coding-workshop
 * @since 22.08.2019
 */

/**
 * Filter function that removes interior and exterior color recommendations
 */
public class InteriorExteriorOptionFilter implements Predicate<Recommendation> {
    public boolean test(Recommendation recommendation)  {
        return (recommendation.getOption().charAt(0) != 'F')
                    && (recommendation.getOption().charAt(0) != 'I');
    }
}
