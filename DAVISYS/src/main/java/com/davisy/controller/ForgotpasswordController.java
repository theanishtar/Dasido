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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.davisy.dao.UserDao;
import com.davisy.entity.User;

@RestController
@CrossOrigin
public class ForgotpasswordController {
	@Autowired
	UserDao userDao;
	private String emailUser = "";
	private String ma = null;
	private String maxacnhan = "";

	public void generateRandomNumbers() {
		String codeMail = "";
		for (int i = 0; i < 6; i++) {
			codeMail = codeMail + (int) (Math.floor(Math.random() * 9));

		}
		maxacnhan = codeMail;

	}

	@GetMapping("/getCode/{email}")
	public String getCode(@PathVariable String email, Model m) {
		User user = new User();
		try {
			user = userDao.findByEmail(email);
			if (user == null) {
//				m.addAttribute("messageForgot1", "Mã xác nhận chưa đúng!");
				ma = null;
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
					message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
					message.setSubject("MÃ XÁC NHẬN");
					generateRandomNumbers();
					message.setText("Mã xác nhận của bạn là : " + maxacnhan);
					Transport.send(message);
					emailUser=email;
					System.out.println("Done");

				} catch (MessagingException e) {
					System.out.println("Fail");
					e.printStackTrace();
				}
				ma = maxacnhan;
			}
		} catch (Exception e) {
//			m.addAttribute("messageForgot1", "Mã xác nhận chưa đúng!");
			ma = null;
			System.out.println("error: " + e);
		}
		return ma;

	}

	@GetMapping("/getMa/{mxn}")
	public String getMa(@PathVariable String mxn, Model m) {
		if (!maxacnhan.equals(mxn)) {
			ma = null;
		} else {
			ma = mxn;System.out.println(mxn);
		}
		return ma;
	}
	
	@GetMapping("/updatepass/{confirmpass}")
	public String updatepass(@PathVariable String confirmpass) {
		try {
			User user =  userDao.findByEmail(emailUser);
			user.setPassword(confirmpass);
			userDao.saveAndFlush(user);
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println("err: " + e);
		}
		
		return "OK";
	}
}
		