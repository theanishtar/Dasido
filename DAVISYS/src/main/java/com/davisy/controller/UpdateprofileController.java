package com.davisy.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.davisy.dao.ProvinceDao;
import com.davisy.dao.UserDao;

import com.davisy.entity.Province;
import com.davisy.entity.User;
import com.davisy.service.SessionService;

@Controller
public class UpdateprofileController {
	@Autowired
	UserDao userDao;
	@Autowired
	ProvinceDao provinceDao;

	@Autowired
	HttpServletRequest request;

	@Autowired
	SessionService sessionService;
	@Autowired
	ServletContext app;

	public static String renameFile(String fileName, String id) {
		return FilenameUtils.getBaseName(id) + ".png";
	}

	@ModelAttribute("listTP")
	public List<Province> list(Model m) {
		return provinceDao.findAll();
	}

	@GetMapping("/updatepro")
	public String profile(Model model) {
		return "jsp/updateprofile";
	}

	@PostMapping("/updatepro")
	public String profile2(Model model, @RequestParam("file") MultipartFile file) {

		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String address = request.getParameter("address");
		User users = userDao.findByEmail(email);
		String birthday = request.getParameter("birthday");
		String pattern = "yyyy-MM-dd";

		DateFormat dateFormat = new SimpleDateFormat(pattern);
		try {
			Date date = dateFormat.parse(birthday);
			users.setBirthday(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			User user = sessionService.get("user");
			String uploadRootPath = app.getRealPath("/views/images/user/");
			String newName = user.getUsername();
			File uploadRootDir = new File(uploadRootPath);
			if (uploadRootDir.exists()) {
				uploadRootDir.mkdirs();
			}

			String fileName = file.getOriginalFilename();
			File serverFile = new File(uploadRootDir.getAbsoluteFile() + File.separator
					+ UpdateprofileController.renameFile(fileName, newName));
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
			stream.write(file.getBytes());
			stream.close();
			users.setAvatar("/views/images/user/" + newName + ".png");
		} catch (Exception e) {
			System.out.println("loi " + e);
			return "jsp/updateprofile";
		}
		Province pr = provinceDao.findIdProvince(Integer.valueOf(address));
		users.setFullname(fullname);
		users.setGender(gender);
		users.setProvince(pr);
		sessionService.set("user", users);
		userDao.saveAndFlush(users);
		model.addAttribute("messageupdate", "Cập nhật thành công!");
		return "jsp/updateprofile";
	}

}