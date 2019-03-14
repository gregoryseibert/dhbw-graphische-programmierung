package components;

class Integrator {
	real memory = 0.0;
	characteristic real kI = 4.0;

	@generated("blockdiagram")
	public real integrate(real in dTVal, real in inputVal) {
		memory = ((inputVal * kI * dTVal) + memory); // Main/integrate 1
		return memory; // Main/integrate 2
	}
}