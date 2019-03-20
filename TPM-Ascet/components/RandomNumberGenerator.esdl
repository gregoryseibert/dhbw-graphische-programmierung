package components;

type smallint is integer 0 .. 1000;

class RandomNumberGenerator {
	smallint memory = 1;

	@generated("blockdiagram")
	public integer calc(smallint in parameterA, smallint in parameterC, smallint in parameterM) {
		memory = (((memory * parameterA) + parameterC) % parameterM); // Main/calc 1
		return memory; // Main/calc 2
	}
}