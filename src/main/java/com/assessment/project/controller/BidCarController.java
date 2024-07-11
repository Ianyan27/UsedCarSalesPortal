package com.assessment.project.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.assessment.project.dao.Car;
import com.assessment.project.dao.CarBid;
import com.assessment.project.dao.Users;
import com.assessment.project.exception.CarNotAvailableForBidException;
import com.assessment.project.services.BidService;
import com.assessment.project.services.CarService;
import com.assessment.project.services.CreateAccountService;

@Controller
public class BidCarController {

	@Autowired
	private CarService carService;
	@Autowired 
	private CreateAccountService createAccServ;
	@Autowired
	private BidService bidService;
	@GetMapping(value = "/bid_cars")
	public String checkBidCars(Model model) {
		String user ="";
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(principal instanceof UserDetails) {
			user = ((UserDetails) principal).getUsername();
		} else {
			user = principal.toString();
		}
		System.out.println("this is just the user " + user);
		List<Car> bidCar = carService.viewCars();
		model.addAttribute("bidCar", bidCar);
		model.addAttribute("user", user);
		return "bid_cars_page";
	}
	@GetMapping(value = "/bid_car")
	public String bidCars(@RequestParam Long carId, Model model) throws CarNotAvailableForBidException{
		Car bidCars = carService.getCarById(carId);
		model.addAttribute("bidCars", bidCars);
		return "bid_car_form_page";
	}
	@PostMapping(value ="/bid_car_form")
	public String saveNewStores(@ModelAttribute Car car, @RequestParam Long carId, @RequestParam String bidPrice) {
		String user ="";
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(principal instanceof UserDetails) {
			user = ((UserDetails) principal).getUsername();
		} else {
			user = principal.toString();
		}
		Long carBidId = carId;
		Car carE = carService.getCarById(carId);
		Users userE = createAccServ.getUserName(user);
		System.out.println("hello i am " + user);
		Date bid_date = new Date();
		CarBid carBidInfo = new CarBid();
		carBidInfo.setBidderName(user);
		carBidInfo.setBidderPrice(bidPrice);
		carBidInfo.setCar(carE);
		carBidInfo.setUser(userE);
		carBidInfo.setBidDateTime(bid_date);
		CarBid saveCarBid = bidService.saveBid(carBidInfo);
		car.setCarId(carId);
		carService.saveCar(car);
		
		return "redirect:/bid_cars";
	}
}
