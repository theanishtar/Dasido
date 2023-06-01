package com.davisy.controller;

import java.util.Base64;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.davisy.model.UserGoogleCloud;
import com.davisy.service.SessionService;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class LoginController {
	public static UserGoogleCloud googleCloud = new UserGoogleCloud();
	@Autowired
	SessionService sessionService;

	@RequestMapping("/login")
	String login() {
		return "login";
	}

	@PostMapping("/home")
	String home(HttpServletRequest req, HttpServletResponse res, Model m) {
		String token = req.getParameter("credential");
		String[] chunks = token.split("\\.");

		Base64.Decoder decoder = Base64.getUrlDecoder();

		String header = new String(decoder.decode(chunks[0]));
		String payload = new String(decoder.decode(chunks[1]));

		UserGoogleCloud ugc = new Gson().fromJson(payload, UserGoogleCloud.class);
		googleCloud = ugc;
//		sessionService.set("currentUserGG", ugc);
		// System.out.println(ugc.getEmail());
		// @RequestBodyParam
//		Map<String, String[]> requestParameterMap = httpServletRequest.getParameterMap();
//		for (String key : requestParameterMap.keySet()) {
//			System.out.println("Key : " + key + ", Value: " + requestParameterMap.get(key)[0]);
//		}

		m.addAttribute("currentUserGG", ugc);
//		System.out.println(payload);
		return "main";
	}
}
