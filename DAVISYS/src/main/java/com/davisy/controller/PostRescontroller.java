package com.davisy.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.davisy.dao.DistrictsDao;
import com.davisy.dao.WardsDao;
import com.davisy.entity.District;
import com.davisy.entity.Wards;
import com.davisy.service.SessionService;

@RestController
@CrossOrigin
public class PostRescontroller {
	@Autowired
	SessionService sessionService;
	@Autowired
	DistrictsDao districtsDao;
	@Autowired
	WardsDao wardsDao;
	@Autowired
	HttpServletResponse response;
	@Autowired
	HttpServletRequest request;

	@GetMapping("/getDistricts")
	public void getDistricts() {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			String idProvince = request.getParameter("selectProvince");
			List<District> districts = districtsDao.findAllById(idProvince);
			PrintWriter out = response.getWriter();
			int i=0;
			for (District dt : districts) {
				out.println("<option value=\"" + dt.getCode() + "\">" + dt.getFull_name() + "</option>");
				
			}
		} catch (Exception e) {
			System.out.println("Error getDistricts: " + e);
		}
	}

	@GetMapping("/getWards")
	public void getWards() {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			String idDistrict = request.getParameter("selectDistrict");
			List<Wards> wards = wardsDao.findAllById(idDistrict);
			PrintWriter out = response.getWriter();
			for (Wards w : wards) {
				out.println("<option value=\"" + w.getCode() + "\">" + w.getFull_name() + "</option>");
			}
		} catch (Exception e) {
			System.out.println("Error getWards: " + e);
		}
	}
}
