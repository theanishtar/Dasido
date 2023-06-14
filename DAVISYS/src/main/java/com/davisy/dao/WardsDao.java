package com.davisy.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.davisy.entity.Wards;

public interface WardsDao extends JpaRepository<Wards, String> {
	@Query(value = "SELECT * FROM wards WHERE district_code=:id", nativeQuery = true)
	public List<Wards> findAllById(String id);

	@Query(value = "SELECT * FROM wards WHERE code=:id", nativeQuery = true)
	public Wards findByIdWards(String id);
}
