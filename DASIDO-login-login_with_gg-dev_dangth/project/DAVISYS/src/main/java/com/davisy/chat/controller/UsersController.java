package com.davisy.chat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.socket.messaging.SessionConnectedEvent;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;

import com.davisy.chat.model.UserModel;
import com.davisy.chat.storage.UserStorage;
import com.davisy.model.UserGoogleCloud;
import com.davisy.service.SessionService;

import jakarta.servlet.http.HttpSession;

import com.davisy.controller.LoginController;

@RestController
@CrossOrigin
@Component
public class UsersController {

	@GetMapping("/registration/{userName}")
	public ResponseEntity<Void> register(@PathVariable String userName) {
		try {
			UserModel userModel = new UserModel();
			UserGoogleCloud cloud = LoginController.googleCloud;
			userModel.setType(UserModel.MessageType.JOIN);
			userModel.setClouds(cloud);
//			String s = sessionService.getAttribute("user");
//			System.out.println("session: " + s);
			
			UserStorage.getInstance().setUser(userName, userModel);
		} catch (Exception e) {
			return ResponseEntity.badRequest().build();
		}
		return ResponseEntity.ok().build();
	}

	@MessageMapping("/fetchAllUsers")
	@SendTo("/topic/public")
	public HashMap<String, UserModel> fetchAll() {
		return UserStorage.getInstance().getUsers();
	}

	

}
