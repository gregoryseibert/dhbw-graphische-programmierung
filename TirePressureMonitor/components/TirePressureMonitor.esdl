package components;

class TirePressureMonitor {
	characteristic real deviationThreshold = 0.05;
	Average averageComponent;
	Integrator integratorComponent;
	DeviationDetector deviationDetectorComponent;

	@generated("blockdiagram")
	public boolean checkTirePressure(real in dTVal, real in vFrontLeft, real in vFrontRight, real in vRearLeft, real in vRearRight) {
		integratorComponent.integrate(dTVal, vFrontLeft); // Main/checkTirePressure 1
		integratorComponent.integrate(dTVal, vFrontRight); // Main/checkTirePressure 2
		integratorComponent.integrate(dTVal, vRearLeft); // Main/checkTirePressure 3
		integratorComponent.integrate(dTVal, vRearRight); // Main/checkTirePressure 4
		return deviationDetectorComponent.checkForDeviation(vFrontLeft, vFrontRight, vRearLeft, vRearRight, averageComponent.calculateAverage(integratorComponent.outVal(), integratorComponent.outVal(), integratorComponent.outVal(), integratorComponent.outVal()), deviationThreshold); // Main/checkTirePressure 5
	}
}