package components;
import lib.average.Average;
import lib.integrator.Integrator;

class TirePressureMonitor {
	Average averageCalculator;
	real average;
	Integrator Integrator_instance;

	@generated("blockdiagram")
	public void calc(real in dTVal, real in vFrontLeft, real in vFrontRight, real in vRearLeft, real in vRearRight) {
		average = averageCalculator.calc(Integrator_instance.outVal(), Integrator_instance.outVal(), Integrator_instance.outVal(), Integrator_instance.outVal()); // Main/calc 1
		Integrator_instance.integrate(dTVal, vFrontLeft); // Main/calc 2
		Integrator_instance.integrate(dTVal, vFrontRight); // Main/calc 3
		Integrator_instance.integrate(dTVal, vRearLeft); // Main/calc 4
		Integrator_instance.integrate(dTVal, vRearRight); // Main/calc 5
	}
}