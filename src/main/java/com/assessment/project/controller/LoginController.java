package com.assessment.project.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
	
	@GetMapping(value = "/login")
	public String login() {
		return "login_page";
	}
	@GetMapping(value = "/login_error")
	public String loginError(Model model) {
		String erro_msg = "Please try again";
		model.addAttribute("error_msg", erro_msg);
		return "login_page";
	}
}
