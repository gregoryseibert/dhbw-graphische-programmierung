package components;

class Integrator {
	real memory = 0.0;

	@generated("blockdiagram")
	public void integrate(real in dTVal, real in inputVal) {
		memory = ((inputVal * dTVal) + memory); // Main/integrate 1
	}

	@no_side_effect
	@generated("blockdiagram")
	public real outVal() {
		return memory;
	}

	@generated("blockdiagram")
	public void resetMemory() {
		memory = 0.0;
	}
}