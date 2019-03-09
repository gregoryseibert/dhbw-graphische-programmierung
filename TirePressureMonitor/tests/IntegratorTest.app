application {
	class tests.IntegratorTest
}
schedule {
	startup {
	}
	shutdown {
	}
	task Task0 priority 0 period 10ms delay 0ms {
		process tests.IntegratorTest.integrate
		process tests.IntegratorTest.outVal
	}
}