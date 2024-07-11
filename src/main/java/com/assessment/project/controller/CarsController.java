package com.assessment.project.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
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
import org.springframework.web.multipart.MultipartFile;

import com.assessment.project.dao.Car;
import com.assessment.project.dao.Users;
import com.assessment.project.services.CarService;
import com.assessment.project.services.CreateAccountService;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;

@Controller
public class CarsController {

	private static final String UPLOAD_DIRECTORY = "/images";
	@Autowired
	private CarService carService;
	@GetMapping(value = "/check_cars")
	public String checkCars(@RequestParam Long carId, Model model) {
		Car checkCar = carService.getCarById(carId);
		model.addAttribute("checks", checkCar);
		return "check_cars_page";
	}
	@GetMapping(value = "post_cars")
	public String postCar(Model model) {
		Car car = new Car();
		model.addAttribute("car", car);
		return "post_car_page";
	}
	@PostMapping(value = "post_new_cars")
	public String saveCars(@ModelAttribute Car car, @RequestParam("file") MultipartFile file, HttpSession session, Model model) throws Exception {
		String carImage = file.getOriginalFilename();
		if(carImage != null && !carImage.trim().isEmpty()) {
		car.setCarImage(carImage);
		ServletContext context = session.getServletContext();
		String path = context.getRealPath(UPLOAD_DIRECTORY);
		String filename = file.getOriginalFilename();
		System.out.println(path + " " + filename);
		byte[] bytes = file.getBytes();
		BufferedOutputStream stream = new BufferedOutputStream(
				new FileOutputStream(new File(path + File.separator + filename)));
		stream.write(bytes);
		stream.flush();
		stream.close();
		}
		String user = "";
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(principal instanceof UserDetails) {
			user = ((UserDetails) principal).getUsername();
		} else {
			user = principal.toString();
		}
		car.setUserName(user);
		carService.saveCar(car);
		return "redirect:/view_cars";
	}
	@GetMapping(value = "/view_cars")
	public String viewCars(Model model) {
		List<Car> car = carService.viewCars();
		model.addAttribute("car", car);
		return "view_car_page";
	}
	@GetMapping(value = "/edit_cars")
	public String editStores(@RequestParam Long carId, Model model) {
		Car editCars = carService.getCarById(carId);
		System.out.println("Car id is" + carId);
		model.addAttribute("editCars", editCars);
		return "edit_car_page";
	}
	@PostMapping(value ="/save_edit_cars")
	public String saveNewStores(@ModelAttribute Car car, @RequestParam Long carId) {
		car.setCarId(carId);
		System.out.println(car.getCarId() + "post maping");
		carService.saveCar(car);
		return "redirect:/view_cars";
	}
	@GetMapping(value = "/delete_cars")
	public String deleteCar(@RequestParam Long carId) {
		carService.deleteCar(carId);
		return "redirect:/view_cars";
	}
}
