package components;
@generated("statemachine")
type WarningSOSStatemachineStates is enum {
	Initial,
	ShortSignal,
	LampOff,
	End,
	LongSignal
};

type counterint is integer 0 .. 3;

class WarningSOS {
	@set
	real deltaTime;
	real time = 0.0;
	counterint counterSignalShort = 0;
	counterint counterSignalLong = 0;
	boolean lampIsOn = false;

	@generated("statemachine")
	public void warningSOSStatemachineTrigger() triggers WarningSOSStatemachine;

	@generatedStateMachine
	statemachine WarningSOSStatemachine using WarningSOSStatemachineStates {
		start Initial;

		state Initial {
			entry {
				time = 0.0;
			}
			static {
				time = time + deltaTime;
			}
			transition time > 1.0 to ShortSignal;
		}

		state ShortSignal {
			entry {
				time = 0.0;
				lampIsOn = true;
			}
			static {
				time = time + deltaTime;
			}
			exit {
				lampIsOn = false;
				counterSignalShort = counterSignalShort + 1;
			}
			transition time > 0.8 to LampOff;
		}

		state LampOff {
			entry {
				time = 0.0;
			}
			static {
				time = time + deltaTime;
			}
			transition counterSignalShort == 3 && counterSignalLong == 3 to End;
			transition time > 0.8 && counterSignalShort < 3 to ShortSignal;
			transition time > 0.8 && counterSignalShort == 3 && counterSignalLong < 3 to LongSignal;
		}

		state End {
			entry {
				time = 0.0;
				lampIsOn = false;
				counterSignalShort = 0;
				counterSignalLong = 0;
			}
			transition true to Initial;
		}

		state LongSignal {
			entry {
				time = 0.0;
				lampIsOn = true;
			}
			static {
				time = time + deltaTime;
			}
			exit {
				lampIsOn = false;
				counterSignalLong = counterSignalLong + 1;
			}
			transition time > 1.6 to LampOff;
		}
	}
}