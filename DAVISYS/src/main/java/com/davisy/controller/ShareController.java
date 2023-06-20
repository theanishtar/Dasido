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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.davisy.dao.PostDao;
import com.davisy.dao.ShareDao;
import com.davisy.dao.UserDao;
import com.davisy.entity.Post;
import com.davisy.entity.Share;
import com.davisy.entity.User;
import com.davisy.service.SessionService;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;
import java.io.File;

@Controller
public class ShareController {

	@Autowired
	HttpServletRequest request;
	@Autowired
	PostDao pdao;
	@Autowired
	ShareDao sdao;
	@Autowired
	SessionService sessionService;

	@GetMapping("/share/{id}")
	public String share(@PathVariable("id") int id, String imagePath) {
		Post post = pdao.findByIdPost(id);
		User user = sessionService.get("user");
		Share share = new Share();
		String email = request.getParameter("text");
		String username = "dasido.2hand.davisy@gmail.com";
		String password = "lufmpspdrkuwiouj";

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
			message.setSubject("Người dùng "+user.getUsername()+" muốn chia sẻ cho bạn 1 sản phẩm");
			message.setText("Link sản phẩm:http://localhost:8080/post/"+id);
			Transport.send(message);
			System.out.println("Done");
			share.setPost(post);
			share.setUser(user);
			share.setDate_Share(new Date());
			sdao.saveAndFlush(share);
		} catch (MessagingException e) {
			System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"+e);
			e.printStackTrace();
//			return "redirect:/main";
		}
		return "redirect:/main";
	}

}
