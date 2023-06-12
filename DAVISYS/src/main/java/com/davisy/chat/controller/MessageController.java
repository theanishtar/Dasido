package com.davisy.chat.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.socket.messaging.SessionConnectedEvent;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;

import com.davisy.chat.model.MessageModel;
import com.davisy.chat.model.UserModel;
import com.davisy.chat.storage.UserStorage;
import com.davisy.controller.LoginController;
import com.davisy.dao.ChatParticipantsDao;
import com.davisy.dao.ChatsDao;
import com.davisy.dao.MessagesDao;
import com.davisy.dao.UserDao;
import com.davisy.entity.ChatParticipants;
import com.davisy.entity.ChatParticipants.Primary;
import com.davisy.entity.Chats;
import com.davisy.entity.User;
import com.davisy.entity.Messages;
import com.davisy.entity.UserGoogleCloud;
import com.davisy.service.SessionService;

@RestController
@CrossOrigin
@Component
public class MessageController {
	@Autowired
	SessionService sessionService;
	@Autowired
	UserDao userDao;
	@Autowired
	ChatsDao chatsDao;
	@Autowired
	MessagesDao messagesDao;
	@Autowired
	ChatParticipantsDao chatParticipantsDao;
	@Autowired
	HttpServletResponse response;

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

	@GetMapping("/createChats/{chatName}")
	public void createChats(@PathVariable String chatName, @RequestParam("fromLogin") String fromLogin,
			@RequestParam("toUser") String toUser) {
		try {
			System.out.println("fromLogin: "+fromLogin);
			System.out.println("toUser: "+toUser);
			User user1 = userDao.findByUsername(fromLogin);
			User user2 = userDao.findByUsername(toUser);
			if (chatsDao.findChatNames(fromLogin + toUser) == null
					&& chatsDao.findChatNames(toUser + fromLogin) == null) {
				Chats chat = new Chats();
				chat.setName_chats(fromLogin + toUser);
				chatsDao.save(chat);
				List<User> users = new ArrayList<>();
				users.add(user1);
				users.add(user2);
				Chats newChat = chatsDao.findChatNames(fromLogin + toUser);
				for (User user : users) {
					ChatParticipants chatParticipant = new ChatParticipants();
					ChatParticipants.Primary pk = new Primary(newChat.getId(), user.getID());
					chatParticipant.setPrimary(pk);
					chatParticipantsDao.save(chatParticipant);
				}
			} else {
				User user = sessionService.get("user");
				PrintWriter out = response.getWriter();
				List<Object[]> listMessage = messagesDao.findListMessage(checkNameChat(fromLogin, toUser));
				for (Object[] oj : listMessage) {
					String outLine = "";
					if (user.getUsername().equals(String.valueOf(oj[3]))) {
						outLine = "<div class=\"message text-only\">\r\n"
								+ "						<div class=\"response\">\r\n"
								+ "							<p class=\"text\">" + String.valueOf(oj[1]) + "</p>\r\n"
								+ "						</div>\r\n" + "					</div>\r\n"
								+ "					<p class=\"response-time time\">" + String.valueOf(oj[2]) + "</p>";
					} 
					else {
						outLine = "<div class=\"message\">\r\n" + "						<div class=\"photo\"\r\n"
								+ "							style=\"background-image: url(" + String.valueOf(oj[4])
								+ ");\">\r\n" + "							<div class=\"online\"></div>\r\n"
								+ "						</div>\r\n" + "						<p class=\"text\">"
								+ String.valueOf(oj[1]) + "</p>\r\n" + "					</div>\r\n"
								+ "					<p class=\"time\">" + String.valueOf(oj[2]) + "</p>";
					}
					out.println(outLine);
				}

			}
		} catch (Exception e) {
			System.out.println("Error: " + e);
		}
	}

	@GetMapping("/insertChat")
	public void insertMessage(@RequestParam("fromLogin") String fromLogin, @RequestParam("toUser") String toUser,
			@RequestParam("userName") String userName, @RequestParam("message") String message,
			@RequestParam("time") String time) {
		try {
			Chats chats = chatsDao.findChatNames(checkNameChat(fromLogin, toUser));
			User user = userDao.findByUsername(userName);
			Messages messages = new Messages();
			messages.setContent(message);
			messages.setChats(chats);
			messages.setSend_Status(false);
			messages.setUser(user);
			messages.setSend_Time(time);
			messagesDao.save(messages);
		} catch (Exception e) {
			System.out.println("error: " + e);
		}

	}

	public String checkNameChat(String fromLogin, String toUser) {
		String chatName = "";
		if (chatsDao.findChatNames(fromLogin + toUser) == null) {
			chatName = chatsDao.findChatNames(toUser + fromLogin).getName_chats();

		} else {
			chatName = chatsDao.findChatNames(fromLogin + toUser).getName_chats();
		}
		return chatName;
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
