package com.davisy.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.davisy.dao.UserDao;
import com.davisy.entity.User;
import com.davisy.service.SessionService;

@Controller
public class ChangepasswordController {

	@Autowired
	UserDao udao;
	@Autowired
	SessionService sessionService;
	@Autowired
	HttpServletRequest request;
	@RequestMapping("/changepass")
	public String change() {
		return "jsp/changepassword";
	}
	@PostMapping("/changepass")
	public String changepass(Model m) {
			User usser = sessionService.get("user");
		if(usser == null) {
			return "error";
		}
		String passold = request.getParameter("passold");
		String passnew = request.getParameter("passnew");
		String confirmpass = request.getParameter("confirmpass");
	
		
		if(!passold.equals(usser.getPassword())) {
			m.addAttribute("changepass","Mật khẩu hiện tại của bạn không đúng!");
		}
		else if (!passnew.equals(confirmpass)) {
			m.addAttribute("changepass","Mật khẩu xác nhận không trùng khớp!");
		}else {
			usser.setPassword(passnew);
			sessionService.set("user", usser);
			udao.saveAndFlush(usser);
			m.addAttribute("changepass","Đổi mật khẩu thành công!");
		}
		return "jsp/changepassword";
	}
}
