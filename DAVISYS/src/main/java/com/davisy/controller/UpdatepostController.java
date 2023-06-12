package com.davisy.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.davisy.dao.PostDao;
import com.davisy.entity.Post;

@Controller
public class UpdatepostController {

	@Autowired
	PostDao postDao; 
	@Autowired
	HttpServletRequest request;
	@GetMapping("/updatepost/{idPost}")
	public String updatePost(@PathVariable String idPost) {
		try {
			int id = Integer.valueOf(idPost);
			Post updatepost = postDao.findByIdPost(id);
			request.setAttribute("updatepost",updatepost);
			System.out.println(updatepost.getPost());
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "jsp/profile";
	}
}
