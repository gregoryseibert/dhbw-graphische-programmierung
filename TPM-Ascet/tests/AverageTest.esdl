package tests;

import assertLib.Assert;

import components.Average;

static class AverageTest {
	@Test
	public void testAveragePositive() {
		real avgResult = Average.calculateAverage(1.0, 2.0, 3.0, 4.0);
		
		Assert.assertTrue(avgResult == 2.5);
	}
	
	@Test
	public void testAverageNegative() {
		real avgResult = Average.calculateAverage(-1.0, -2.0, -3.0, -4.0);
		
		Assert.assertTrue(avgResult == -2.5);
	}
	
	@Test
	public void testAverageMixed() {
		real avgResult = Average.calculateAverage(-1.0, 2.0, -3.0, 4.0);
		
		Assert.assertTrue(avgResult == 0.5);
	}
	
	@Test
	public void testAverageNull() {
		real avgResult = Average.calculateAverage(0.0, 0.0, 0.0, 0.0);
		
		Assert.assertTrue(avgResult == 0.0);
	}
}