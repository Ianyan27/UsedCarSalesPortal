package com.assessment.project.exception;

public class CarNotAvailableForBidException extends Exception{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public CarNotAvailableForBidException() {
		System.out.println("Car not available");
	}
}
