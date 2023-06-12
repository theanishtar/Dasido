package com.davisy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Run {
	@GetMapping("/index")
	public String index(Model model) {
		return "index";
	}
	@GetMapping("/log")
	public String log(Model model) {
		return "jsp/login";
	}
	@GetMapping("/adminpage")
	public String adminpage(Model model) {
		return "jsp/adminpage";
	}
	@GetMapping("/forgot")
	public String forgot(Model model) {
		return "jsp/forgotpassword";
	}
	@GetMapping("/history")
	public String history(Model model) {
		return "jsp/history";
	}
	@GetMapping("/homm")
	public String home(Model model) {
		return "jsp/home";
	}
	@GetMapping("/message")
	public String message(Model model) {
		return "jsp/message";
	}
	@GetMapping("/profile")
	public String profile(Model model) {
		return "jsp/profile";
	}
	@GetMapping("/signup")
	public String signup(Model model) {
		return "jsp/signup";
	}
	@GetMapping("/updateprofile")
	public String updateprofile(Model model) {
		return "jsp/updateprofile";
	}
	@GetMapping("/error404")
	public String error404(Model model) {
		return "jsp/error404";
	}
}
