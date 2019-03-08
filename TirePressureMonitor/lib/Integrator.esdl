package lib;

class Integrator {
	real memory = 0.0;
	characteristic real kI = 4.0;

	@generated("blockdiagram")
	public void integrate(real in dTVal, real in inputVal) {
		memory = ((inputVal * kI * dTVal) + memory); // Main/integrate 1
	}

	@no_side_effect
	@generated("blockdiagram")
	public real outVal() {
		return memory; // Main/outVal 1
	}
}