package components;

data interface velocityMessage {
	real vFrontLeft = 0.0;
	real vFrontRight = 0.0;
	real vRearLeft = 0.0;
	real vRearRight = 0.0;
}

data interface distanceMessage {
	real distanceFrontLeft = 0.0;
	real distanceFrontRight = 0.0;
	real distanceRearLeft = 0.0;
	real distanceRearRight = 0.0;
	real averageDistance = 0.0;
}

data interface deviationMessage {
	boolean deviationDetected = false;
	boolean recalibrate = false;
}