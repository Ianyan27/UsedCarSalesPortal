package com.assessment.project.exception;

public class CarNotFoundException extends Exception{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public CarNotFoundException(String string) {
		System.out.println("Car not found");
	}

}
