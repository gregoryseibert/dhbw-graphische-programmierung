package tests;

import assertLib.Assert;

import components.RandomNumberGenerator;

static class RandomNumberGeneratorTest {
	RandomNumberGenerator generatorInstance;
	
	@Test
	public void testGenerator1() {
		integer randomNumber = generatorInstance.calc(1, 3, 3);
		
		Assert.assertTrue(randomNumber == 1);
	}
	
	@Test
	public void testGenerator2() {
		integer randomNumber = generatorInstance.calc(10, 5, 3);
		
		Assert.assertTrue(randomNumber == 0);
	}
}