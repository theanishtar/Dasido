package com.davisy.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.davisy.dao.PostDao;
import com.davisy.dao.UserDao;
import com.davisy.entity.Post;
import com.davisy.entity.PostEntity;
import com.davisy.entity.User;
import com.davisy.service.SessionService;


@Controller
public class AdminController {
	@Autowired
	PostDao postDao;
	@Autowired
	UserDao userDao;
	@Autowired
	SessionService sessionService;
	
	Date now = new Date();
	int month = Integer.valueOf(now.getMonth());
	int day = Integer.valueOf(now.getDay());
	
	@GetMapping("/admin")
	public String adminpage(Model model) {
		User userSession = sessionService.get("user");
		if(userSession == null) {
			return "error";
		}
		String returnString = "";
		if(userSession.isUser_Role()== true) {
			loadPosts(model);
			loadUsers(model);
			loadReportPost(model);
			loadReportUsers(model);
			loadTotalPostMonth(model);
			loadTotalUserMonth(model);
			percentPostSend(model);
			totalReportPostToday(model);
//			totalPostAllMonth(model);
			top3Product(model);
			returnString = "admin/home/index";
		}else {
			returnString = "aaaa";
			return "error404";
		}
		return returnString;
		
	}
	
	@GetMapping("/admin/report")
	public String adminpageReport(Model model) {
		User userSession = sessionService.get("user");
		if(userSession == null) {
			return "error";
		}
		loadPosts(model);
		loadUsers(model);
		loadReportPost(model);
		loadReportUsers(model);
		return "admin/home/report";
	}
	@GetMapping("/admin/usermanage")
	public String adminpageUserManage(Model model) {
		User userSession = sessionService.get("user");
		if(userSession == null) {
			return "error";
		}
		/* loadPosts(model); */
		loadUsers(model);
		/*
		 * loadReportPost(model); loadReportUsers(model);
		 */
		return "admin/home/usermanage";
	}
	
	public void loadPosts(Model model) {
		try {
			List<Post> posts = postDao.findAll();
			List<PostEntity> postEntity = new ArrayList<>();
			for (Post p : posts) {
				List<String> images = new ArrayList<>();
				String image = p.getLink_Image();
				for (String img : image.split(",")) {
					images.add(img);
				}
				postEntity.add(new PostEntity(p, images));
			}

			model.addAttribute("posts", postEntity);
		} catch (Exception e) {
			System.out.println("Error loadPost: " + e);
		}
	}
	
	public void loadUsers(Model model) {
		try {
			List<User> users = userDao.findAll();
			model.addAttribute("users", users);
		} catch (Exception e) {
			System.out.println("Error loadUsers: " + e);
		}
	}
	
	public void loadReportPost(Model model) {
		List<Object[]> listR = postDao.getReportPost();
//		for(Object[] oj: listR) {
//			System.out.println("test+ "+ oj[1]);
//		}
		model.addAttribute("postsReport", listR);
	}
	
	public void loadReportUsers(Model model) {
		List<User> usersR = userDao.getReportUsers();
		model.addAttribute("usersReport", usersR);
	}
	
	public void loadTotalPostMonth(Model model) {
		int totalPost = postDao.totalPostMonth(month);
//		System.out.println(totalPost);
		model.addAttribute("totalPost", totalPost);
	}
	
	public void loadTotalUserMonth(Model model) {
		int totalUser = userDao.totalUserMonth(month);
//		System.out.println(totalUser);
		model.addAttribute("totalUser", totalUser);
	}
	
	public void percentPostSend(Model model) {
		int percentPost = postDao.percentPostSend();
//		System.out.println(percentPost);
		model.addAttribute("percentPost", percentPost);
	}
	
	public void totalReportPostToday(Model model) {
		int totalPostReport = postDao.totalReportPostToday(day);
//		System.out.println(totalPostReport);
		model.addAttribute("totalPostReport", totalPostReport);
	}
	
	public void top3Product(Model model) {
		String top1P = "", top2P = "", top3P = "";
		List<Object[]> listTop3 = postDao.top3Product();
		int i = 0;
		for(Object[] oj: listTop3) {
			if(i == 0) {
				top1P = String.valueOf(oj[0]);
			}
			if(i == 1) {
				top2P = String.valueOf(oj[0]);
			}
			if(i == 2) {
				top3P = String.valueOf(oj[0]);
			}
			i++;
		}
		model.addAttribute("top1P", top1P);
		model.addAttribute("top2P", top2P);
		model.addAttribute("top3P", top3P);
	}
	
}
