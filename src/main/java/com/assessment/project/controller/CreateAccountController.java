package com.assessment.project.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.assessment.project.dao.Users;
import com.assessment.project.services.CreateAccountService;


@Controller
public class CreateAccountController {

	@Autowired
	private CreateAccountService createAccServ;
	
	@GetMapping(value = "/create_account")
	public String createNewAcc(Map<String, Object> model) {
		Users user = new Users();
		model.put("user", user);
		return "create_account_page";
	}
	@PostMapping(value = "create_account")
	public String saveAccount(@ModelAttribute("user") Users user, Model model) {
		createAccServ.saveAccount(user);
		String creating_acc_success = "Account Created Successfully";
		model.addAttribute("create_acc_success", creating_acc_success);
		return "create_account_page";
	}
}
