package tests;

import assertLib.Assert;

import components.DeviationDetector;

static class DeviationDetectorTest {
	DeviationDetector detector;
	
	@Test
	public void testDeviationDetectorPositiveNumbers() {
		real inputVal1 = 100.0;
		real inputVal2 = 99.9;
		real inputVal3 = 99.85;
		real inputVal4 = 100.1;
		real referenceVal = 100.0;
		real threshold = 0.05;
		
		boolean deviationDetected = detector.checkForDeviation(inputVal1, inputVal2, inputVal3, inputVal4, referenceVal, threshold);
		
		Assert.assertFalse(deviationDetected);
	}
	
	@Test
	public void testDeviationDetectorPositiveNumbersWithDeviation() {
		real inputVal1 = 100.0;
		real inputVal2 = 99.9;
		real inputVal3 = 100.1;
		real inputVal4 = 94.3;
		real referenceVal = 100.0;
		real threshold = 0.05;
		
		boolean deviationDetected = detector.checkForDeviation(inputVal1, inputVal2, inputVal3, inputVal4, referenceVal, threshold);
		
		Assert.assertTrue(deviationDetected);
	}
	
	@Test
	public void testDeviationDetectorNegativeNumbers() {
		real inputVal1 = -100.0;
		real inputVal2 = -99.9;
		real inputVal3 = -99.85;
		real inputVal4 = -100.1;
		real referenceVal = -100.0;
		real threshold = 0.05;
		
		boolean deviationDetected = detector.checkForDeviation(inputVal1, inputVal2, inputVal3, inputVal4, referenceVal, threshold);
		
		Assert.assertFalse(deviationDetected);
	}
	
	@Test
	public void testDeviationDetectorZeroes() {
		real inputVal1 = 0.0;
		real inputVal2 = 0.0;
		real inputVal3 = 0.0;
		real inputVal4 = 0.0;
		real referenceVal = 0.0;
		real threshold = 0.05;
		
		boolean deviationDetected = detector.checkForDeviation(inputVal1, inputVal2, inputVal3, inputVal4, referenceVal, threshold);
		
		Assert.assertFalse(deviationDetected);
	}
	
	@Test
	public void testDeviationDetectorNegativeNumbersWithDeviation() {
		real inputVal1 = -100.0;
		real inputVal2 = -99.9;
		real inputVal3 = -100.1;
		real inputVal4 = -93.7;
		real referenceVal = -100.0;
		real threshold = 0.05;
		
		boolean deviationDetected = detector.checkForDeviation(inputVal1, inputVal2, inputVal3, inputVal4, referenceVal, threshold);
		
		Assert.assertTrue(deviationDetected);
	}
	
	@Test
	public void testDeviationDetectorMixedNumbersWithDeviation() {
		real inputVal1 = 100.0;
		real inputVal2 = -99.9;
		real inputVal3 = 100.1;
		real inputVal4 = 99.85;
		real referenceVal = -100.0;
		real threshold = 0.05;
		
		boolean deviationDetected = detector.checkForDeviation(inputVal1, inputVal2, inputVal3, inputVal4, referenceVal, threshold);
		
		Assert.assertTrue(deviationDetected);
	}
}