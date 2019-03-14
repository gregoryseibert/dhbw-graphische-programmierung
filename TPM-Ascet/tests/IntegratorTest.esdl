package tests;

import components.Integrator;

static class IntegratorTest {
	Integrator tester;
	characteristic real integrate_dTVal = 0.0;
	characteristic real integrate_inputVal = 0.0;
	real integrate_return;

	@thread
	public void integrate() {
		integrate_return = tester.integrate(integrate_dTVal, integrate_inputVal);
	}
}