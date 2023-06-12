package com.davisy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class I18NController {
	@GetMapping("/index")
	public String index() {
		return "index";
	}
}
