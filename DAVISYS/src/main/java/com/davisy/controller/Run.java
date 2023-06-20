package com.davisy.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import java.util.Properties;
import java.util.List;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.davisy.dao.CommentDao;
import com.davisy.dao.FollowerDao;
import com.davisy.dao.PostDao;
import com.davisy.dao.UserDao;
import com.davisy.entity.Comment;
import com.davisy.entity.CommentEntity;
import com.davisy.entity.Follower;
import com.davisy.entity.Post;
import com.davisy.entity.PostEntity;
import com.davisy.entity.User;
import com.davisy.service.CookieService;
import com.davisy.service.ParamService;
import com.davisy.service.SessionService;

import javax.servlet.http.HttpServletRequest;

@Controller
public class Run {
	@Autowired
	UserDao userdao;

	@Autowired
	FollowerDao followerDAO;

	@Autowired
	PostDao pdao;
	@Autowired
	CommentDao commentDao;

	@Autowired
	HttpServletRequest request;

	@Autowired
	ParamService paramService;

	@Autowired
	CookieService cookieService;

	@Autowired
	SessionService sessionService;

	User acc = new User();

	private String maxacnhan = "";

	public void generateRandomNumbers() {
		String codeMail = "";
		for (int i = 0; i < 6; i++) {
			codeMail = codeMail + (int) (Math.floor(Math.random() * 9));

		}
		maxacnhan = codeMail;

	}

	@GetMapping("/index")
	public String index(Model model) {
		return "index";
	}

//	@GetMapping("/main")
//	public String index2(Model model) {
//		return "jsp/main";
//	}

	@GetMapping("/adminpage")
	public String adminpage(Model model) {
		return "jsp/adminpage";
	}

	@GetMapping("/forgot")
	public String forgot(Model model) {
		String emailForgot = request.getParameter("emailForgot");
		User emailSignup = userdao.findByEmail(emailForgot);

		if (emailForgot == null) {
			model.addAttribute("messageForgot", "Email không tồn tại!");
		} else {
			String username = "dasido.2hand.davisy@gmail.com";
			String password = "qhgpqcfcxpuhsdep";

			Properties prop = new Properties();
			prop.put("mail.smtp.host", "smtp.gmail.com");
			prop.put("mail.smtp.port", "587");
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.starttls.enable", "true");
			prop.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
			Session session = Session.getInstance(prop, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});

			try {
				Message message = new MimeMessage(session);
				message.setFrom(new InternetAddress(username));
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailForgot));
				message.setSubject("MÃ XÁC NHẬN ĐĂNG KÍ");
				generateRandomNumbers();
				message.setText("Mã xác nhận của bạn là : " + maxacnhan);
				Transport.send(message);
				System.out.println("Done");

			} catch (MessagingException e) {
				System.out.println("Fail");
				e.printStackTrace();
			}
		}
		return "forgotpassword";
	}

	@GetMapping("/history")
	public String history(Model model) {
		return "jsp/history";
	}

//	@GetMapping("/homm")
//	public String home(Model model) {
//		return "jsp/home";
//	}
//	@RequestMapping("/main")
//	public String home(Model model) {
////		List<Follower> fls = followerDAO.findAllFollower(1);
////		List<User> users = new ArrayList<>();
////		for (Follower f : fls) {
////			Follower.Pk pk = f.getPk();
////			users.add(userdao.findIdUser(pk.getUserID()));
////		}
////		model.addAttribute("follower", users);
////
////		User entity = new User();
////		model.addAttribute("user", entity);
////		List<User> listSuggestedFriend = userdao.findAll();
////		
////		List<User> listFriends = new ArrayList<>();
////		for (int i = 0; i < 4; i++) {
////			int ran = (int) Math.floor(Math.random() * listSuggestedFriend.size());
////			listFriends.add(listSuggestedFriend.get(ran));
////			listSuggestedFriend.remove(ran);
////		}
////		model.addAttribute("listFriends", listFriends);
//		User userSession = sessionService.get("user");
//		List<Follower> fls = followerDAO.findAllFollower(userSession.getID());
//		List<User> users = new ArrayList<>();
//		for (Follower f : fls) {
//			Follower.Pk pk = f.getPk();
//			users.add(userdao.findIdUser(pk.getUserID()));
//		}
//		model.addAttribute("follower", users);
//
//		List<User> listSuggestedFriend = userdao.findAllByIdUser(userSession.getID());
//		loadPost(model);
//		List<User> listFriends = new ArrayList<>();
//		for (int i = 0; i < 4; i++) {
//			int ran = (int) Math.floor(Math.random() * listSuggestedFriend.size());
//			listFriends.add(listSuggestedFriend.get(ran));
//			listSuggestedFriend.remove(ran);
//		}
//		model.addAttribute("listFriends", listFriends);
//		return "jsp/main";
//	}

//	public void loadPost(Model model) {
//		try {
//			List<Post> posts = pdao.findAll();
//			List<PostEntity> postEntity = new ArrayList<>();
//			List<Comment> comments = commentDao.findAll();
//			List<CommentEntity> commentEntity = new ArrayList<>();
//			int dem = 0;
//			for (Post p : posts) {
//				List<String> images = new ArrayList<>();
//				String image = p.getLink_Image();
//				for (String img : image.split(",")) {
//					images.add(img);
//				}
//				postEntity.add(new PostEntity(p, images));
//			}
//			for (Comment cm : comments) {
//				if (cm.getCommentParent() == null) {
//					dem = commentDao.findAllByIdComment(cm.getID()).size();
//				}
//				commentEntity.add(new CommentEntity(cm, dem));
//				dem = 0;
//			}
//			model.addAttribute("posts", postEntity);
//			model.addAttribute("comments", commentEntity);
//		} catch (Exception e) {
//			System.out.println("Error loadPost: " + e);
//		}
//
//	}

	@GetMapping("/message")
	public String message(Model model) {
		return "jsp/message";
	}

	
	


	@GetMapping("/error404")
	public String error404(Model model) {
		return "jsp/error404";
	}

}
