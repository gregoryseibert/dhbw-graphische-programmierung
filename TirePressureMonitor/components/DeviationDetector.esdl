package components;

class DeviationDetector {
	@no_side_effect
	@generated("blockdiagram")
	public boolean checkForDeviation(real in inputVal1, real in inputVal2, real in inputVal3, real in inputVal4, real in referenceVal, real in deviationThreshold) {
		return((((abs(((inputVal1 - referenceVal) / referenceVal)) >= deviationThreshold) || (abs(((inputVal2 - referenceVal) / referenceVal)) >= deviationThreshold)) || (abs(((inputVal3 - referenceVal) / referenceVal)) >= deviationThreshold)) || (abs(((inputVal4 - referenceVal) / referenceVal)) >= deviationThreshold)); // Main/checkForDeviation 1
	}
}