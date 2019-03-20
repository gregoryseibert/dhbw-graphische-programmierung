package components;

static class TirePressureMonitor
reads velocityMessage.vFrontLeft, velocityMessage.vFrontRight, velocityMessage.vRearLeft, velocityMessage.vRearRight, deviationMessage.recalibrate
writes deviationMessage.deviationDetected, distanceMessage.distanceFrontLeft, distanceMessage.distanceFrontRight, distanceMessage.distanceRearLeft, distanceMessage.distanceRearRight {
	@dT
	public real deltaT;
	characteristic real deviationThreshold = 0.005; //0.5 percent
	Integrator Integrator_instance;
	Integrator Integrator_instance_2;
	Integrator Integrator_instance_3;
	Integrator Integrator_instance_4;

	@thread
	@generated("blockdiagram")
	public void checkTirePressure() {
		Integrator_instance.integrate(deltaT, velocityMessage.vFrontLeft); // Main/checkTirePressure 1
		Integrator_instance_2.integrate(deltaT, velocityMessage.vFrontRight); // Main/checkTirePressure 2
		Integrator_instance_3.integrate(deltaT, velocityMessage.vRearLeft); // Main/checkTirePressure 3
		Integrator_instance_4.integrate(deltaT, velocityMessage.vRearRight); // Main/checkTirePressure 4
		deviationMessage.deviationDetected = DeviationDetector.checkForDeviation(Integrator_instance.outVal(), Integrator_instance_2.outVal(), Integrator_instance_3.outVal(), Integrator_instance_4.outVal(), Average.calculateAverage(Integrator_instance.outVal(), Integrator_instance_2.outVal(), Integrator_instance_3.outVal(), Integrator_instance_4.outVal()), deviationThreshold); // Main/checkTirePressure 5
		if (deviationMessage.recalibrate) {
			Integrator_instance.resetMemory(); // Main/checkTirePressure 6/if-then 1
			Integrator_instance_2.resetMemory(); // Main/checkTirePressure 6/if-then 2
			Integrator_instance_3.resetMemory(); // Main/checkTirePressure 6/if-then 3
			Integrator_instance_4.resetMemory(); // Main/checkTirePressure 6/if-then 4
		} // Main/checkTirePressure 6
		distanceMessage.distanceFrontLeft = Integrator_instance.outVal(); // Main/checkTirePressure 7
		distanceMessage.distanceFrontRight = Integrator_instance_2.outVal(); // Main/checkTirePressure 8
		distanceMessage.distanceRearLeft = Integrator_instance_3.outVal(); // Main/checkTirePressure 9
		distanceMessage.distanceRearRight = Integrator_instance_4.outVal(); // Main/checkTirePressure 10
	}
}