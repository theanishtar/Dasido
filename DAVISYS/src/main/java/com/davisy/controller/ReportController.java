package com.davisy.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.davisy.dao.PostDao;
import com.davisy.dao.UserDao;

@RestController
@CrossOrigin
public class ReportController {
	@Autowired
	PostDao postDao;
	@Autowired
	UserDao userDao;
	
	@GetMapping("/getTotalMonth")
	public List<Integer> totalPostAllMonth(Model model) {
		List<Object[]> listAllM = postDao.totalPostAllMonth();
		List<Integer> listAll = new ArrayList<>();
		for(Object[] oj: listAllM) {
			listAll.add(Integer.valueOf(String.valueOf(oj[1])));
			System.out.println("test+ "+ oj[1]);
		}
		return listAll;
	}
	
	@GetMapping("/getTotalProduct")
	public List<Object[]> top3Product(Model model) {
		List<Object[]> listTop3 = postDao.top3Product();
		List<Object[]> listCombine = new ArrayList<>();
		float sum = 0;
		for(Object[] oj: listTop3) {
			sum = sum + Float.valueOf(String.valueOf(oj[1]));
		}
		for(Object[] oj: listTop3) {
			float percent = (Float.valueOf(String.valueOf(oj[1])) / sum) * 100;
			String name = String.valueOf(oj[0]);
			listCombine.add(new Object[] { name, percent});
		}
		return listCombine;
	}
}
