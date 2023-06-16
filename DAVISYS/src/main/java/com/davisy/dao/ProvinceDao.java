package com.davisy.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.davisy.entity.Province;

public interface ProvinceDao extends JpaRepository<Province, String>{
	@Query(value = "SELECT * FROM provinces WHERE code=:code", nativeQuery = true)
	public Province findIdProvince(String code);
}
