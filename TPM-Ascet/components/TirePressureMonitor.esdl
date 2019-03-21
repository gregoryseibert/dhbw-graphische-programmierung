package components;

static class TirePressureMonitor
reads velocityMessage.vFrontLeft, velocityMessage.vFrontRight, velocityMessage.vRearLeft, velocityMessage.vRearRight, deviationMessage.recalibrate
writes deviationMessage.deviationDetected, distanceMessage.distanceFrontLeft, distanceMessage.distanceFrontRight, distanceMessage.distanceRearLeft, distanceMessage.distanceRearRight, distanceMessage.averageDistance {
	@dT public real deltaT;
	characteristic real deviationThreshold = 0.005; //0.5 percent
	Integrator Integrator_instance;
	Integrator Integrator_instance_2;
	Integrator Integrator_instance_3;
	Integrator Integrator_instance_4;
	WarningSOS WarningSOS_instance;

	@thread
	@generated("blockdiagram")
	public void checkTirePressure() {
		if (deviationMessage.recalibrate) {
			Integrator_instance.resetMemory(); // Main/checkTirePressure 1/if-then 1
			Integrator_instance_2.resetMemory(); // Main/checkTirePressure 1/if-then 2
			Integrator_instance_3.resetMemory(); // Main/checkTirePressure 1/if-then 3
			Integrator_instance_4.resetMemory(); // Main/checkTirePressure 1/if-then 4
		} // Main/checkTirePressure 1
		Integrator_instance.integrate(deltaT, velocityMessage.vFrontLeft); // Main/checkTirePressure 2
		Integrator_instance_2.integrate(deltaT, velocityMessage.vFrontRight); // Main/checkTirePressure 3
		Integrator_instance_3.integrate(deltaT, velocityMessage.vRearLeft); // Main/checkTirePressure 4
		Integrator_instance_4.integrate(deltaT, velocityMessage.vRearRight); // Main/checkTirePressure 5
		distanceMessage.distanceFrontLeft = Integrator_instance.outVal(); // Main/checkTirePressure 6
		distanceMessage.distanceFrontRight = Integrator_instance_2.outVal(); // Main/checkTirePressure 7
		distanceMessage.distanceRearLeft = Integrator_instance_3.outVal(); // Main/checkTirePressure 8
		distanceMessage.distanceRearRight = Integrator_instance_4.outVal(); // Main/checkTirePressure 9
		distanceMessage.averageDistance = Average.calculateAverage(Integrator_instance.outVal(), Integrator_instance_2.outVal(), Integrator_instance_3.outVal(), Integrator_instance_4.outVal()); // Main/checkTirePressure 10
		deviationMessage.deviationDetected = DeviationDetector.checkForDeviation(Integrator_instance.outVal(), Integrator_instance_2.outVal(), Integrator_instance_3.outVal(), Integrator_instance_4.outVal(), Average.calculateAverage(Integrator_instance.outVal(), Integrator_instance_2.outVal(), Integrator_instance_3.outVal(), Integrator_instance_4.outVal()), deviationThreshold); // Main/checkTirePressure 11
		WarningSOS_instance.deltaTime = deltaT; // Main/checkTirePressure 12
		if (DeviationDetector.checkForDeviation(Integrator_instance.outVal(), Integrator_instance_2.outVal(), Integrator_instance_3.outVal(), Integrator_instance_4.outVal(), Average.calculateAverage(Integrator_instance.outVal(), Integrator_instance_2.outVal(), Integrator_instance_3.outVal(), Integrator_instance_4.outVal()), deviationThreshold)) {
			WarningSOS_instance.warningSOSStatemachineTrigger(); // Main/checkTirePressure 13/if-then 1
		} // Main/checkTirePressure 13
	}
}