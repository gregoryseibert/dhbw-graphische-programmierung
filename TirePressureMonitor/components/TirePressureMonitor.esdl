package components;

class TirePressureMonitor {
	characteristic real deviationThreshold = 0.05;
	Average averageComponent;
	DeviationDetector deviationDetectorComponent;
	Integrator integratorComponent;
	real distanceFrontLeft = 0.0;
	real distanceFrontRight = 0.0;
	real distanceRearRight = 0.0;
	real distanceRearLeft = 0.0;

	@generated("blockdiagram")
	public boolean checkTirePressure(real in dTVal, real in vFrontLeft, real in vFrontRight, real in vRearLeft, real in vRearRight) {
		distanceFrontLeft = integratorComponent.integrate(dTVal, vFrontLeft); // Main/checkTirePressure 1
		distanceFrontRight = integratorComponent.integrate(dTVal, vFrontRight); // Main/checkTirePressure 2
		distanceRearLeft = integratorComponent.integrate(dTVal, vRearLeft); // Main/checkTirePressure 3
		distanceRearRight = integratorComponent.integrate(dTVal, vRearRight); // Main/checkTirePressure 4
		return deviationDetectorComponent.checkForDeviation(distanceFrontLeft, distanceFrontRight, distanceRearLeft, distanceRearRight, averageComponent.calculateAverage(distanceFrontLeft, distanceFrontRight, distanceRearLeft, distanceRearRight), deviationThreshold); // Main/checkTirePressure 5
	}
}