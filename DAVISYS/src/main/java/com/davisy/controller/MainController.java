package com.davisy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	@RequestMapping("/")
	String main() {
		return "jsp/main";
	}
	
//	@RequestMapping("/main")
//	String main2() {
//		return "jsp/main";
//	}
}
