package lib.average;

class Average {
	const real numberOfItems = 4.0;

	@generated("blockdiagram")
	public real calc(real in inputVal1, real in inputVal2, real in inputVal3, real in inputVal4) {
		return((inputVal1 + inputVal2 + inputVal3 + inputVal4) / numberOfItems); // Main/calc 1
	}
}