package com.davisy.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.davisy.dao.UserDao;
import com.davisy.entity.User;

@RestController
@CrossOrigin
public class SearchController {
	@Autowired
	UserDao userDao;
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpServletResponse response;


	@GetMapping("/searchByName")
	public void searchAll() {
		try {
			List<User> listUser = userDao.findAll();
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			String txtSearch = request.getParameter("txt");
			PrintWriter out = response.getWriter();
			for (User us : listUser) {
				if ((us.getFullname().toLowerCase().contains(txtSearch.toLowerCase())
						|| us.getUsername().toLowerCase().contains(txtSearch.toLowerCase()))
						&& us.isUser_Role() == false && us.isBan() == false && us.isUser_Status()) {
					out.println("<a href=\"/profile/" + us.getID() + "\" id=\"find-content\"> <img alt=\"\"\r\n"
							+ "					src=\"" + us.getAvatar() + "\">\r\n"
							+ "					<div class=\"post-find\">" + us.getFullname() + "</div>\r\n"
							+ "				</a>");
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

	}
}
