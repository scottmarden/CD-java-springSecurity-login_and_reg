package com.scottmarden.loginandreg.controllers;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.scottmarden.loginandreg.models.User;
import com.scottmarden.loginandreg.services.UserService;
import com.scottmarden.loginandreg.validator.UserValidator;

@Controller
public class LogRegCtrl {
	
	private UserService userService;
	
	private UserValidator userValidator;
	
	public LogRegCtrl(UserService userService, UserValidator userValidator) {
		this.userService = userService;
		this.userValidator = userValidator;
	}
	
//	@RequestMapping(value= "/")
//	public String landingPage(@RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, @Valid @ModelAttribute("user") User user, Model model) {
//		return "landingPage.jsp";
//	}
	
	@RequestMapping(value= "/welcome")
	public String landingPage(@RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, @Valid @ModelAttribute("user") User user, Model model) {
		return "landingPage.jsp";
	}
	
	@RequestMapping(value="/registration")
	public String redirectLanding() {
		return "redirect:/welcome";
	}
	
	@PostMapping(value="/registration")
	public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {
		userValidator.validate(user, result);
		if(result.hasErrors()) {
			return "landingPage.jsp";
		}
		userService.saveWithUserRole(user);
		return "redirect:/home";
	}
	
	@RequestMapping(value="/login")
	public String login(@RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, Model model, @Valid @ModelAttribute("user") User user) {
		if(error != null) {
			model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
		}
		if(logout != null) {
			model.addAttribute("logoutMessage", "Logout Successful!");
		}
		return "landingPage.jsp";
	}
	
	@RequestMapping(value= {"/", "/home"})
	public String home(Principal principal, Model model) {
		String username = principal.getName();
		User currentUser = userService.findByUsername(username);
		model.addAttribute("currentUser", currentUser);
		return "homePage.jsp";
	}

}
