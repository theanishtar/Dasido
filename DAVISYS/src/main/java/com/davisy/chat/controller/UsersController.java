package com.davisy.chat.controller;

import java.util.Date;
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
import com.davisy.entity.Chats;
import com.davisy.entity.User;
import com.davisy.entity.UserGoogleCloud;
import com.davisy.service.SessionService;

import javax.servlet.http.HttpSession;

import com.davisy.controller.LoginController;
import com.davisy.dao.ChatsDao;
import com.davisy.dao.FollowerDao;
import com.davisy.dao.MessagesDao;
import com.davisy.dao.UserDao;

@RestController
@CrossOrigin
@Component
public class UsersController {
	long millis = System.currentTimeMillis();
	java.sql.Date day = new java.sql.Date(millis);
	@Autowired
	SessionService sessionService;
	@Autowired
	FollowerDao followerDao;
	@Autowired
	UserDao userDao;
	@Autowired
	ChatsDao chatsDao;
	@Autowired
	MessagesDao messagesDao;
	public static User user = new User();

	@GetMapping("/registration/{userName}")
	public ResponseEntity<Void> register(@PathVariable String userName) {
		try {
			user = sessionService.get("user");
			HashMap<String, UserModel> check = UserStorage.getInstance().getUsers();
			if (check.size() == 0) {
				for (User us : userDao.findAll()) {
					UserModel userModel = new UserModel();
					userModel.setType(UserModel.MessageType.LEAVE);
					userModel.setOnline(us.getOl());
					userModel.setUserName(us.getUsername());
					userModel.setFullName(us.getFullname());
					userModel.setEmail(us.getEmail());
					userModel.setImage(us.getAvatar());
					userModel.setMessageUnRead(messagesDao.countMessageUnread(us.getID()));
					userModel.setLastMessage(lastMeassage(user.getUsername(), us.getUsername()));
					UserStorage.getInstance().setUser(us.getUsername(), userModel);
				}
			} else {
				User users = sessionService.get("user");
				UserModel userModel = check.get(users.getUsername());
				userModel.setType(UserModel.MessageType.JOIN);
				userModel.setUserName(users.getUsername());
				userModel.setFullName(users.getFullname());
				userModel.setEmail(users.getEmail());
				userModel.setImage(users.getAvatar());
				UserStorage.getInstance().setUser(users.getUsername(), userModel);

//				UserModel userModel =check.get(user.getUsername());
//				userModel.setType(UserModel.MessageType.JOIN);
//				UserStorage.getInstance().setUser(user.getUsername(), userModel);
			}

		} catch (Exception e) {
			System.out.println("error: " + e);
			return ResponseEntity.badRequest().build();
		}
		return ResponseEntity.ok().build();
	}

	public String lastMeassage(String fromLogin, String toUser) {
		try {
			String message = "";
			String chatName = "";
			if (chatsDao.findChatNames(fromLogin + toUser) == null) {
				chatName = toUser + fromLogin;

			} else {
				chatName = fromLogin + toUser;
			}
			if (!"".equals(chatName) && chatsDao.findChatNames(chatName) != null) {
				List<Object[]> listMessage = messagesDao.findListMessage(chatName);
				if (listMessage.size() > 0) {
					message = String.valueOf(listMessage.get(listMessage.size() - 1)[1]);
				}

			}
			return message;
		} catch (Exception e) {
			System.out.println("error1: " + e);
			throw e;
		}

	}

	@MessageMapping("/fetchAllUsers")
	@SendTo("/topic/public")
	public HashMap<String, UserModel> fetchAll() {
		return UserStorage.getInstance().getUsers();
	}

	public java.sql.Date day() {
		return day;
	}

	public static String getDate(Date d) {
		/*
		 * 86400000: 1 ngày 2.5920E+9: 1 tháng 2592000000 3.1536E+10: 1 năm
		 */
		String result = "";
		Date now = new Date();
		if (((now.getTime() - d.getTime()) % 86400000) == 0) {
			int day = (int) ((d.getTime() - now.getTime()) / 86400000);
			if (day >= 21)
				result = "Khoảng 3 tuần trước";
			else if (day >= 14)
				result = "Khoảng 2 tuần trước";
			else if (day >= 7)
				result = "Khoảng 1 tuần trước";
			else
				result = "Khoảng " + day + " ngày trước";
			return result;
		}
		Double m = (double) d.getTime() - (double) now.getTime();
		if (m % 25920 == 0) {
			result = String.valueOf((d.getTime() - now.getTime()) / 25920) + " tháng trước";
			return result;
		}
		return "";
	}
}
