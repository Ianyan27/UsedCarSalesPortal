package com.assessment.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.assessment.project.dao.Car;
import com.assessment.project.dao.Users;
import com.assessment.project.exception.CarNotFoundException;
import com.assessment.project.services.CarService;
import com.assessment.project.services.CreateAccountService;


@Controller
public class HomepageController {

	@Autowired
	private CarService carService;
	@Autowired 
	private CreateAccountService createAccServ;
	@GetMapping(value = "home")
	public String home(Model model) {
		List<Car> car = carService.viewCars();
		String userName = "";
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		model.addAttribute("name", userName);
		model.addAttribute("car", car);
		return "home_page";
	}
	@GetMapping(value = "account")
	public String account(@ModelAttribute Users user, Model model) {
		String userEmail = "";
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(principal instanceof UserDetails) {
			userEmail = ((UserDetails) principal).getUsername();
		} else {
			userEmail = principal.toString();
		}
		model.addAttribute("user", user.getUserName());
		System.out.println("username from account page "+user.getUserName());
		model.addAttribute("email", userEmail);
		return "account_page";
	}
	@GetMapping(value = "/registered_accounts")
	public String regisAcc(Model model) {
		List<Users> users = createAccServ.listAll();
		model.addAttribute("users", users);
		return "registered_account_page";
	}
	@GetMapping(value = "/delete_acc")
	public String deleteAcc(@RequestParam Long userId) {
		createAccServ.deleteById(userId);
		return "redirect:/registered_accounts";
	}
	@GetMapping(value = "/home_search")
	public String searchHomeCars(@RequestParam String keyword, Model model) {
		List<Car> result = carService.searchCarByName(keyword);
		model.addAttribute("result", result);
		return "home_search_page";
	}
	@GetMapping(value = "/search")
	public String searchCars(@RequestParam String keyword, Model model) throws CarNotFoundException{
		List<Car> car = carService.searchCarByName(keyword);
		model.addAttribute("car", car);
		return "search_car_page";
	}
	@GetMapping (value = "/search_account")
	public String searchAccount(@RequestParam String search_acc, Model model) {
		List<Users> acc = createAccServ.searchByUserEmail(search_acc);
		model.addAttribute("acc", acc);
		return "account_searched_page";
	}
//	@GetMapping("/search_car/{carName}")
//	public String searchStorebyEmail(@PathVariable String carName, Model model) throws CarNotFoundException {
//		Car car = carService.findCarByName(carName);
//		System.out.println("Finding this " +  carName);
//		if (car == null) {
//			throw new CarNotFoundException("This " + carName + " doesn't exist in the portal");
//		}
//		model.addAttribute("car", car);
//		return "search_car_page";
//	}
}
