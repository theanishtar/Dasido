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
import org.eclipse.tags.shaded.org.apache.bcel.generic.NEW;
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

import com.davisy.dao.FollowerDao;
import com.davisy.dao.PostDao;
import com.davisy.dao.UserDao;
import com.davisy.entity.Follower;
import com.davisy.entity.Post;
import com.davisy.entity.User;
import com.davisy.service.CookieService;
import com.davisy.service.ParamService;
import com.davisy.service.SessionService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class Run {
	@Autowired
	UserDao userdao;

	@Autowired
	FollowerDao followerDAO;
	
	@Autowired
	PostDao pdao;
	
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

	@GetMapping("/log")
	public String log(Model model) {
		String user = cookieService.getValue("user");
		if (user != null) {
			String pass = cookieService.getValue("pass");
			model.addAttribute("user", user);
			model.addAttribute("pass", pass);
		}
		return "jsp/login";
	}

	@PostMapping("/log")
	public String log2(Model model) {
		String usernametemp = "";
		String passtemp = "";
		String username = paramService.getString("usernamelg", "");
		String password = paramService.getString("passwordlg", "");

		boolean remember = paramService.getBoolean("remember", false);
		User user = userdao.findByUsername(username);

		if (user == null) {
			model.addAttribute("message", "Tên đăng nhập hoạc mật khẩu không đúng!");
		} else {
			if (!user.getPassword().equals(password)) {
				model.addAttribute("message", "Tên đăng nhập hoạc mật khẩu không đúng!");
//				return "redirect:/log";
			} else {
				sessionService.set("user", user);
				if (remember) {
					cookieService.add("user", usernametemp, 10);
					cookieService.add("pass", passtemp, 10);
				} else {
					cookieService.delete("user");
					cookieService.delete("pass");
				}
				System.out.println();
				return "redirect:/homm";
			}

		}

		return "jsp/login";
	}

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
		return "jsp/forgotpassword";
	}

	@GetMapping("/history")
	public String history(Model model) {
		return "jsp/history";
	}

//	@GetMapping("/homm")
//	public String home(Model model) {
//		return "jsp/home";
//	}
	@RequestMapping("/homm")
	public String home(Model model) {
		List<Follower> fls = followerDAO.findAllFollower(1);
		List<User> users = new ArrayList<>();
		for (Follower f : fls) {
			Follower.Pk pk = f.getPk();
			users.add(userdao.findIdUser(pk.getUserID()));
		}
		model.addAttribute("follower", users);

		User entity = new User();
		model.addAttribute("user", entity);
		List<User> listSuggestedFriend = userdao.findAll();

		List<Post> posts = pdao.findAll();
		model.addAttribute("posts", posts);

//		int dem = 0;
		List<User> listFriends = new ArrayList<>();
		for (int i = 0; i < 4; i++) {
			int ran = (int) Math.floor(Math.random() * listSuggestedFriend.size());
			listFriends.add(listSuggestedFriend.get(ran));
			listSuggestedFriend.remove(ran);
		}
		model.addAttribute("listFriends", listFriends);
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
	public String signup(Model m) {
		m.addAttribute("user", new User());
		return "jsp/signup";
	}

	@RequestMapping("/createuser")
	public String signup(@Validated @ModelAttribute("user") User item, BindingResult result,
			RedirectAttributes attrRedirect, Model m) {

		String to = request.getParameter("email");
		String pass = request.getParameter("password");
		String repass = request.getParameter("re_password");
		String user = request.getParameter("username");
		User userSignup = userdao.findByUsername(user);

		User emailSignup = userdao.findByEmail(to);

		if (result.hasErrors()) {
			return "signup";
		}
		if (userSignup == null && emailSignup == null) {

			if (!pass.equals(repass)) {
				m.addAttribute("message", "Mật khẩu xác nhận chưa trùng khớp!");
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
					message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
					message.setSubject("MÃ XÁC NHẬN ĐĂNG KÍ");
					generateRandomNumbers();
					message.setText("Mã xác nhận của bạn là : " + maxacnhan);
					Transport.send(message);
					System.out.println("Done");
					acc.setEmail(item.getEmail());
					acc.setUsername(item.getUsername());
					acc.setPassword(item.getPassword());
					acc.setFullname(null);
					acc.setBirthday(null);
					acc.setGender(null);
					acc.setProvince(null);
					acc.setAvatar(null);
					acc.setMark(0);
					acc.setUser_Status(false);
					acc.setUser_Role(false);
					acc.setBan(false);

				} catch (MessagingException e) {
					System.out.println("Fail");
					e.printStackTrace();
				}
				return "jsp/validator";
			}

		} else if (userSignup != null) {
			m.addAttribute("messageuser", "Tên đăng nhập đã tồn tại!");
		} else if (emailSignup != null) {
			m.addAttribute("messageemail", "Email đã tồn tại!");
		}

		return "jsp/signup";
	}

	@PostMapping("/validate")
	public String validator(Model model) {
		String mxn = request.getParameter("mxn");
		if (!mxn.equals(maxacnhan)) {
			model.addAttribute("messagevalidate", "Mã xác nhận chưa đúng!");
			return "jsp/validator";
		} else {
			sessionService.set("user", acc);
			userdao.saveAndFlush(acc);

		}
		return "redirect:/homm";
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
