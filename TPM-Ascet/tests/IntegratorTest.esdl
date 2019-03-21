package tests;

import assertLib.Assert;

import components.Integrator;

static class IntegratorTest {
	Integrator integratorInstance;
	
	@Test
	public void testIntegrator() {
		real integrationResult = 0.0;
		
		integratorInstance.integrate(1.5, 5.0);
		
		integrationResult = integratorInstance.outVal();
		
		Assert.assertTrue(integrationResult == 7.5);
		
		integratorInstance.integrate(1.5, 5.0);
		
		integrationResult = integratorInstance.outVal();
		
		Assert.assertTrue(integrationResult == 15.0);
	}
	
	@Test
	public void testIntegratorReset() {
		real integrationResult = 0.0;
		
		integratorInstance.integrate(1.5, 5.0);
		
		integrationResult = integratorInstance.outVal();
		
		Assert.assertTrue(integrationResult == 7.5);
		
		integratorInstance.resetMemory();
		
		integratorInstance.integrate(1.5, 5.0);
		
		integrationResult = integratorInstance.outVal();
		
		Assert.assertTrue(integrationResult == 7.5);
	}
}