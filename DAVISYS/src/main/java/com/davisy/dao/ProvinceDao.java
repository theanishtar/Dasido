package com.davisy.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.davisy.entity.Province;

public interface ProvinceDao extends JpaRepository<Province, Integer>{
	
}
