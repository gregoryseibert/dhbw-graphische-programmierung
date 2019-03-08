application {
	class lib.integrator.IntegratorTest
}
schedule {
	startup {
	}
	shutdown {
	}
	task Task0 priority 0 period 10ms delay 0ms {
		process lib.integrator.IntegratorTest.integrate
		process lib.integrator.IntegratorTest.outVal
	}
}