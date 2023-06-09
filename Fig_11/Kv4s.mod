TITLE slow A-type potassium Kv4 channel for GPe neuron

COMMENT
 modeled by Gunay et al., 2008
 implemented in NEURON by Kitano, 2011
ENDCOMMENT

UNITS {
 (mV) = (millivolt)
 (mA) = (milliamp)
}

NEURON {
 SUFFIX Kv4s
 USEION k READ ek WRITE ik
 RANGE gmax, iKv4s, ik
}

PARAMETER {
 v (mV)
 dt (ms)
 gmax  = 0.001 (mho/cm2)
 iKv4s  = 0.0 (mA/cm2)
 ek (mV)

 theta_m = -49.0 (mV)
 k_m = 12.5 (mV)
 tau_m0 = 0.25 (ms)
 tau_m1 = 7.0 (ms)
 phi_m = -49.0 (mV)
 sigma_m0 = 29.0 (mV)
 sigma_m1 = -29.0 (mV)

 theta_h = -83.0 (mV)
 k_h = -10.0 (mV)
 tau_h0 = 50.0 (ms)
 tau_h1 = 121.0 (ms)
 phi_h = -83.0 (mV)
 sigma_h0 = 10.0 (mV)
 sigma_h1 = -10.0 (mV)
}

STATE {
 m h
}

ASSIGNED { 
 ik (mA/cm2)
 minf
 taum (ms)
 hinf
 tauh (ms)
}

BREAKPOINT {
 SOLVE states METHOD cnexp
 ik  = gmax*m*m*m*m*h*(v-ek)
 iKv4s = ik
}

UNITSOFF

INITIAL {
 settables(v)
 m = minf
 h = hinf
}

DERIVATIVE states {  
 settables(v)
 m' = (minf - m)/taum
 h' = (hinf - h)/tauh
}

PROCEDURE settables(v) {
        TABLE minf, taum, hinf, tauh FROM -100 TO 100 WITH 400

	minf = 1.0 / (1.0 + exp((theta_m - v)/k_m))
	taum = tau_m0 + (tau_m1 - tau_m0)/(exp((phi_m - v)/sigma_m0) + exp((phi_m - v)/sigma_m1))
	hinf = 1.0 / (1.0 + exp((theta_h - v)/k_h))
	tauh = tau_h0 + (tau_h1 - tau_h0)/(exp((phi_h - v)/sigma_h0) + exp((phi_h - v)/sigma_h1))
}

UNITSON
