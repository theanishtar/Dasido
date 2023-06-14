package com.davisy.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.davisy.dao.HistoryDao;
import com.davisy.entity.Post;
import com.davisy.entity.PostEntity;
import com.davisy.entity.User;
import com.davisy.service.SessionService;

@Controller
public class HistoryController {
	@Autowired
	HistoryDao historyDao;
	@Autowired
	SessionService sessionService;
	
	@GetMapping("/history")
	public String adminpage(Model model) {
		User userSession = sessionService.get("user");
		String returnString = "";
		if (userSession == null) {
			returnString = "error";
		}else {
			loadHistoryInterested(model, userSession.getID());
			loadHistoryShare(model, userSession.getID());
			returnString = "jsp/history";
		}
		return returnString;

	}
	
	public void loadHistoryInterested(Model model, int id) {
		try {
			List<Object[]> listHI = historyDao.userReacHistory(id);
			List<String> images = new ArrayList<>();
			for (Object[] oj : listHI) {
				String image = String.valueOf(oj[1]);
				for (String img : image.split(",")) {
					images.add(img);
				}
			}
			model.addAttribute("listHI", listHI);
			model.addAttribute("listHIImages", images);
		} catch (Exception e) {
			System.out.println("Error loadHistoryInterested: " + e);
		}
	}
	
	public void loadHistoryShare(Model model, int id) {
		try {
			List<Object[]> listHS = historyDao.userShareHistory(id);
			List<String> images = new ArrayList<>();
			for (Object[] oj : listHS) {
				String image = String.valueOf(oj[1]);
				for (String img : image.split(",")) {
					images.add(img);
				}
			}
			model.addAttribute("listHS", listHS);
			model.addAttribute("listHSImages", images);
		} catch (Exception e) {
			System.out.println("Error loadHistoryShare: " + e);
		}
	}
	
}
