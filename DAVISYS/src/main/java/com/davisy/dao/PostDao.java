package com.davisy.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.davisy.entity.Post;

public interface PostDao extends JpaRepository<Post, Integer> {

	@Query(value = " SELECT * FROM POST  WHERE ID=(SELECT MAX(ID) FROM POST )", nativeQuery = true)
	public Post maxId();
}
