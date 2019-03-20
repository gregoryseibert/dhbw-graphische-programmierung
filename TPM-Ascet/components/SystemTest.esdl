package components;

static class SystemTest
writes velocityMessage.vRearLeft, velocityMessage.vRearRight, velocityMessage.vFrontRight, velocityMessage.vFrontLeft, deviationMessage.recalibrate {
	RandomNumberGenerator RandomNumberGenerator_instance;
	RandomNumberGenerator RandomNumberGenerator_instance_2;
	RandomNumberGenerator RandomNumberGenerator_instance_3;
	RandomNumberGenerator RandomNumberGenerator_instance_4;
	characteristic integer parameterANormal = 24;
	characteristic integer parameterCNormal = 14;
	characteristic integer parameterMNormal = 28;
	characteristic integer parameterADeviation = 24;
	characteristic integer parameterCDeviation = 15;
	characteristic integer parameterMDeviation = 37;
	characteristic real baseSignal = 100.0;
	const real numberGain = 0.15;
	characteristic boolean recalibrate = false;

	@thread
	@generated("blockdiagram")
	public void calc() {
		deviationMessage.recalibrate = recalibrate; // Main/calc 1
		velocityMessage.vFrontLeft = ((real(RandomNumberGenerator_instance.calc(parameterANormal, parameterCNormal, parameterMNormal)) * numberGain) + baseSignal); // Main/calc 2
		velocityMessage.vFrontRight = ((real(RandomNumberGenerator_instance_2.calc(parameterANormal, parameterCNormal, parameterMNormal)) * numberGain) + baseSignal); // Main/calc 3
		velocityMessage.vRearRight = ((real(RandomNumberGenerator_instance_4.calc(parameterANormal, parameterCNormal, parameterMNormal)) * numberGain) + baseSignal); // Main/calc 4
		velocityMessage.vRearLeft = ((real(RandomNumberGenerator_instance_3.calc(parameterADeviation, parameterCDeviation, parameterMDeviation)) * numberGain) + baseSignal); // Main/calc 5
	}
}