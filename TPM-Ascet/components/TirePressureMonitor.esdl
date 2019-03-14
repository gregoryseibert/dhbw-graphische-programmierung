package components;

static class TirePressureMonitor {
	characteristic real deviationThreshold = 0.05;
	characteristic real vFrontLeft = 0.0;
	characteristic real vFrontRight = 0.0;
	characteristic real vRearLeft = 0.0;
	characteristic real vRearRight = 0.0;
	
	Integrator integratorComponent;
	
	real distanceFrontLeft = 0.0;
	real distanceFrontRight = 0.0;
	real distanceRearRight = 0.0;
	real distanceRearLeft = 0.0;
	real averageDistance = 0.0;
	
	boolean detectedTirePressureDeviation = false;

	@thread
	@generated("blockdiagram")
	public void checkTirePressure() {
		distanceFrontLeft = integratorComponent.integrate(DeltaTimeService.deltaT, vFrontLeft); // Main/checkTirePressure 1
		distanceFrontRight = integratorComponent.integrate(DeltaTimeService.deltaT, vFrontRight); // Main/checkTirePressure 2
		distanceRearLeft = integratorComponent.integrate(DeltaTimeService.deltaT, vRearLeft); // Main/checkTirePressure 3
		distanceRearRight = integratorComponent.integrate(DeltaTimeService.deltaT, vRearRight); // Main/checkTirePressure 4
		averageDistance = Average.calculateAverage(distanceFrontLeft, distanceFrontRight, distanceRearLeft, distanceRearRight); // Main/checkTirePressure 5
		detectedTirePressureDeviation = DeviationDetector.checkForDeviation(distanceFrontLeft, distanceFrontRight, distanceRearLeft, distanceRearRight, averageDistance, deviationThreshold); // Main/checkTirePressure 6
	}
}