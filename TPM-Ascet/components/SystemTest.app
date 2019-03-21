application {
	class components.SystemTest
	class components.TirePressureMonitor
}
schedule {
	startup {
	}
	shutdown {
	}
	task Task0 priority 0 period 10ms delay 0ms {
		process components.SystemTest.calc
		process components.TirePressureMonitor.checkTirePressure
	}
}