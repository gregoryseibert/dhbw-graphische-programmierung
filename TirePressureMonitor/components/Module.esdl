package components;

static class Module {
	TirePressureMonitor tirePressureMonitorComponent;
	characteristic real vFrontLeft = 0.0;
	characteristic real vFrontRight = 0.0;
	characteristic real vRearLeft = 0.0;
	characteristic real vRearRight = 0.0;
	boolean detectedTirePressureDeviation = false;

	@thread
	@generated("blockdiagram")
	public void calc() {
		detectedTirePressureDeviation = tirePressureMonitorComponent.checkTirePressure(DeltaTimeService.deltaT, vFrontLeft, vFrontRight, vRearLeft, vRearRight); // Main/calc 1
	}
}