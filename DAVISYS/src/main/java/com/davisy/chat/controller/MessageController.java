package com.davisy.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.socket.messaging.SessionConnectedEvent;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;

import com.davisy.chat.model.MessageModel;
import com.davisy.chat.model.UserModel;
import com.davisy.chat.storage.UserStorage;
import com.davisy.controller.LoginController;
import com.davisy.entity.User;
import com.davisy.entity.UserGoogleCloud;
import com.davisy.service.SessionService;

@RestController
@Component
public class MessageController {
	@Autowired
	SessionService sessionService;

	@Autowired
	private SimpMessagingTemplate simpMessagingTemplate;

	@MessageMapping("/chat/{to}")
	public void sendMessage(@DestinationVariable String to, MessageModel message) {
//		System.out.println("handling send message: " + message + " to: " + to);
		boolean isExists = UserStorage.getInstance().getUsers().containsKey(to);
		if (isExists) {
			simpMessagingTemplate.convertAndSend("/topic/messages/" + to, message);
		}
	}

	@EventListener
	public void handleWebSocketConnectListener(SessionConnectedEvent event) {
		System.out.println("Conect successfull");
	}

	@EventListener
	public void logout(SessionDisconnectEvent event) {
		try {
			User user = UsersController.user;
			UserModel userModel = new UserModel();
			userModel.setType(UserModel.MessageType.LEAVE);
			userModel.setUserName(user.getUsername());
			userModel.setFullName(user.getFullname());
			userModel.setEmail(user.getEmail());
			userModel.setImage(user.getAvatar());
			UserStorage.getInstance().setUser(user.getUsername(), userModel);
			simpMessagingTemplate.convertAndSend("/topic/public", UserStorage.getInstance().getUsers());

		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("error: " + e);
			e.printStackTrace();
		}
	}
}
