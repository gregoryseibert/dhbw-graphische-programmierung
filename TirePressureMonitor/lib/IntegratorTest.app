application {
	class lib.IntegratorTest
}
schedule {
	startup {
	}
	shutdown {
	}
	task Task0 priority 0 period 10ms delay 0ms {
		process lib.IntegratorTest.integrate
		process lib.IntegratorTest.outVal
	}
}