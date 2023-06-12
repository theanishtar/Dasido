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
import com.davisy.service.SessionService;

@Controller
@Transactional
public class FollowController {
	@Autowired
	FollowerDao followerDAO;

	@Autowired
	UserDao userDao;

	@Autowired
	SessionService sessionService;

	/* ===Follow=== */
	@GetMapping("/addFollow/{id}")
	public String addFollow(Model model, Follower follower, @PathVariable("id") int id) {

		Follower.Pk pk = new Follower.Pk();
		User userSession = sessionService.get("user");

		if (userSession == null) {
			return "error";
		}
		pk.setFollowerID(userSession.getID());
		pk.setUserID(id);
		follower.setPk(pk);

		followerDAO.save(follower);
		System.out.println("Thêm thành công");
		return "redirect:/main";
	}

	@GetMapping("/deleteFollow/{id}")
	public String deleteFollow(Model model, Follower follower, @PathVariable("id") int id) {
		try {
			User userSession = sessionService.get("user");
			followerDAO.delete(followerDAO.findUserUnlf(userSession.getID(), id));
			System.out.println("Hủy thành công: " + followerDAO.findUserUnlf(userSession.getID(), id));
			List<Follower> fls = followerDAO.findAllFollower(userSession.getID());
			List<User> users = new ArrayList<>();
			for (Follower f : fls) {
				Follower.Pk pk = f.getPk();
				users.add(userDao.findIdUser(pk.getUserID()));
			}
			sessionService.set("follower", users);
		} catch (Exception e) {
			System.out.println("Error delete follow: " + e);
		}

		return "redirect:/main";
	}
}
