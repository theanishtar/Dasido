package com.davisy.controller;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.davisy.dao.UserDao;
import com.davisy.entity.User;
import com.davisy.service.CookieService;
import com.davisy.service.ParamService;
import com.davisy.service.SessionService;



@Controller
public class SignupController {
	@Autowired
	UserDao userdao;

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
	@GetMapping("/signup")
	public String signup(Model m) {
		m.addAttribute("user", new User());
		return "signup";
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
		if (userSignup==null && emailSignup == null ) {

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
					acc.setFullname(item.getFullname());
					acc.setBirthday(null);
					//acc.setGenderID(null);
					acc.setProvince(null);
					acc.setAvatar("views/images/user/user.jpg");
					acc.setMark(0);
					acc.setUser_Status(false);
					acc.setUser_Role(false);
					acc.setBan(false);

				} catch (MessagingException e) {
					System.out.println("Fail");
					e.printStackTrace();
				}
				return "validator";
			}

		} else if (userSignup != null) {
			m.addAttribute("messageuser", "Tên đăng nhập đã tồn tại!");
		} else if (emailSignup != null) {
			m.addAttribute("messageemail", "Email đã tồn tại!");
		}

		return "signup";
	}

	@PostMapping("/validate")
	public String validator(Model model) {
		String mxn = request.getParameter("mxn");
		if (!mxn.equals(maxacnhan)) {
			model.addAttribute("messagevalidate", "Mã xác nhận chưa đúng!");
			return "validator";
		} else {
			sessionService.set("user", acc);
			userdao.saveAndFlush(acc);
			

		}
		return "jsp/main";
	}
}
