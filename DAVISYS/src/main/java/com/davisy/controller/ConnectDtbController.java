package com.davisy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.davisy.dao.CommentDao;
import com.davisy.dao.FollowerDao;
import com.davisy.dao.HistoryDao;
import com.davisy.dao.InterestedDao;
import com.davisy.dao.PostDao;
import com.davisy.dao.ProvinceDao;
import com.davisy.dao.ShareDao;
//import com.davisy.dao.FollowerDAO;
import com.davisy.dao.UserDao;
import com.davisy.entity.Comment;
import com.davisy.entity.Follower;
import com.davisy.entity.History;
import com.davisy.entity.Interested;
import com.davisy.entity.Post;
import com.davisy.entity.Province;
import com.davisy.entity.Share;
import com.davisy.entity.User;
import com.davisy.service.SessionService;

@Controller
@Transactional
public class ConnectDtbController {
	@Autowired
	UserDao udao;
	@Autowired
	PostDao pdao;
	@Autowired
	FollowerDao fdao;
	@Autowired
	CommentDao cdao;
	@Autowired
	HistoryDao hdao;
	@Autowired
	ShareDao sdao;
	@Autowired
	InterestedDao idao;
	@Autowired
	ProvinceDao prdao;
	@Autowired
	SessionService sessionService;	
//	@RequestMapping("/jsp/home")
//	public String index(Model model) {
//		Follower fl = new Follower();
//		model.addAttribute("fl", fl);
//		List<Follower> fls = fldao.findAll();
//		model.addAttribute("fls", fls);
//		return "jsp/home";
//	}
	
	@RequestMapping("/jsp/conect")
	public String index(Model model) {
		User userSession = sessionService.get("user");
		if(userSession == null) {
			return "error";
		}
		List<User> users = udao.findAll();
		model.addAttribute("users", users);
	
		List<Post> posts = pdao.findAll();
		model.addAttribute("posts", posts);
		
		List<Follower> fls = fdao.findAll();
		model.addAttribute("fls", fls);
		
		List<Comment> cmts = cdao.findAll();
		model.addAttribute("cmts", cmts);
		
		List<Share> shr = sdao.findAll();
		model.addAttribute("shr", shr);
		
		List<Interested> inter = idao.findAll();
		model.addAttribute("inter", inter);
		
		List<History> his = hdao.findAll();
		model.addAttribute("his", his);
		
		List<Province> pro = prdao.findAll();
		model.addAttribute("pro", pro);
		
		return "jsp/conectDtb";
	}
} 
