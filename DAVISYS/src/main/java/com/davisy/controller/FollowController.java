package com.davisy.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.davisy.dao.FollowerDao;
import com.davisy.dao.PostDao;
import com.davisy.dao.UserDao;

//import com.davisy.dao.Postdao;
//import com.davisy.dao.FollowerDAO;

import com.davisy.entity.Follower;
import com.davisy.entity.Post;
import com.davisy.entity.User;

@Controller
@Transactional
public class FollowController {
	@Autowired
	FollowerDao followerDAO;
	
	@Autowired
	UserDao userDAO;

	@GetMapping("/addFollow/{id}")
	public String addFollow(Model model, Follower follower, @PathVariable("id") int id) {
		Follower.Pk pk = new Follower.Pk();

		pk.setFollowerID(1);
		pk.setUserID(id);
		follower.setPk(pk);

		followerDAO.save(follower);
		System.out.println("Thêm thành công");
		return "redirect:/homm";
	}

	@GetMapping("/deleteFollow/{id}")
	public String deleteFollow(Model model, Follower follower, @PathVariable("id") int id) {
		followerDAO.delete(followerDAO.findUserUnlf(1, id));
		System.out.println("Hủy thành công");
		return "redirect:/homm";
	}
}
