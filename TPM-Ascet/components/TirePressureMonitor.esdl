package components;

static class TirePressureMonitor
reads velocityMessage.vFrontLeft, velocityMessage.vFrontRight, velocityMessage.vRearLeft, velocityMessage.vRearRight
writes deviationMessage.deviationDetected {
	characteristic real deviationThreshold = 0.005; //0.5 percent
	Integrator Integrator_instance1;
	Integrator Integrator_instance2;
	Integrator Integrator_instance3;
	Integrator Integrator_instance4;

	@thread
	@generated("blockdiagram")
	public void checkTirePressure() {
		Integrator_instance1.integrate(DeltaTimeService.deltaT, velocityMessage.vFrontLeft); // Main/checkTirePressure 1
		Integrator_instance2.integrate(DeltaTimeService.deltaT, velocityMessage.vFrontRight); // Main/checkTirePressure 2
		Integrator_instance3.integrate(DeltaTimeService.deltaT, velocityMessage.vRearLeft); // Main/checkTirePressure 3
		Integrator_instance4.integrate(DeltaTimeService.deltaT, velocityMessage.vRearRight); // Main/checkTirePressure 4
		deviationMessage.deviationDetected = DeviationDetector.checkForDeviation(Integrator_instance1.outVal(), Integrator_instance2.outVal(), Integrator_instance3.outVal(), Integrator_instance4.outVal(), Average.calculateAverage(Integrator_instance1.outVal(), Integrator_instance2.outVal(), Integrator_instance3.outVal(), Integrator_instance4.outVal()), deviationThreshold); // Main/checkTirePressure 5
	}
}