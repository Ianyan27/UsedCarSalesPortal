package com.assessment.project.exception;


import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalHandlerException {
	
	@ExceptionHandler(CarNotFoundException.class)
	public String handleCarNotFoundException(Model model) {
		System.out.println("GlobalHandlerException");
		model.addAttribute("exception_msg", "Car does not exist");
		return "home_search_page";
	}
	
	@ExceptionHandler(CarNotAvailableForBidException.class)
	public String handleCarNotAvailable(Model model) {
		model.addAttribute("not_available", "Car is not availabe for bidding, Please select another car");
		return "bid_cars_page";
	}
}
