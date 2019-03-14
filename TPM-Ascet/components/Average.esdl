package components;

static class Average {
	const real numberOfItems = 4.0;

	@no_side_effect
	@generated("blockdiagram")
	public real calculateAverage(real in inputVal1, real in inputVal2, real in inputVal3, real in inputVal4) {
		return((inputVal1 + inputVal2 + inputVal3 + inputVal4) / numberOfItems); // Main/calculateAverage 1
	}
}