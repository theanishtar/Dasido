package com.davisy.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.davisy.entity.District;

public interface DistrictsDao extends JpaRepository<District, String> {

	@Query(value = "SELECT * FROM districts WHERE  province_code=:id", nativeQuery = true)
	List<District> findAllById(String id);

	@Query(value = "SELECT * FROM districts WHERE code=:id", nativeQuery = true)
	public District findAllByIdDistrict(String id);
}
