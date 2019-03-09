package tests;

import components.Integrator;

static class IntegratorTest {
	Integrator tester;
	characteristic real integrate_dTVal = 0.0;
	characteristic real integrate_inputVal = 0.0;
	real outVal_return = 0.0;

	@thread
	public void integrate() {
		tester.integrate(integrate_dTVal, integrate_inputVal);
	}

	@thread
	public void outVal() {
		outVal_return = tester.outVal();
	}
}