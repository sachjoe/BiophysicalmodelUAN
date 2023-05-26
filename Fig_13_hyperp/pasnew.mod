TITLE passive membrane channel

UNITS {
	(mV) = (millivolt)
	(mA) = (milliamp)
	(S) = (siemens)
}

NEURON {
	SUFFIX pasnew
	NONSPECIFIC_CURRENT i
    USEION k READ ik VALENCE 1
	USEION ca READ ica VALENCE 2
	USEION h READ ih VALENCE 1
	USEION na READ ina VALENCE 1
	USEION cl READ icl VALENCE -1
	RANGE g, e, itotal
}

PARAMETER {
	g = .0001	(S/cm2)	<0,1e9>
	e = -41.583	(mV)
    area
}

ASSIGNED {
    v (mV)  
    i (mA/cm2)
    ik	 (mA/cm2)
    ica	 (mA/cm2)
    ih	 (mA/cm2)
    ina	 (mA/cm2)
	icl	 (mA/cm2)
    itotal(mA/cm2)
}

BREAKPOINT {
	i = g*(v - e)
    itotal = (ik+ica+ih+ina+i+icl)*area*0.01
}