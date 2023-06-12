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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.davisy.entity.User;
import com.davisy.service.SessionService;

@Controller
public class ContactController {

	@Autowired
	HttpServletRequest request;
	@Autowired
	SessionService sessionService;
	@RequestMapping("/contact")
	public String contact() {
		User userSession = sessionService.get("user");
		if(userSession == null) {
			return "error";
		}
		return "jsp/contact";
	}
	
	@PostMapping("/contact")
	public String contact2() {
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String messages = request.getParameter("message");
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
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("dasido.2hand.davisy@gmail.com"));
			message.setSubject(subject);
			message.setText("Họ và tên: "+name+"   Email:  "+email+"  Nội dung: "+messages);
			Transport.send(message);
			System.out.println("Done");
			return "redirect:/main";
		} catch (MessagingException e) {
			System.out.println("Fail");
			e.printStackTrace();
		}
		return "jsp/contact";
	}
	
}
