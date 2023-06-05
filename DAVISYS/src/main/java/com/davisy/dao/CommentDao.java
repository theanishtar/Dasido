package com.davisy.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.davisy.entity.Comment;


public interface CommentDao extends JpaRepository<Comment, Integer>{
	

}
