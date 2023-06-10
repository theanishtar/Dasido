package com.davisy.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.davisy.entity.Comment;

public interface CommentDao extends JpaRepository<Comment, Integer> {
	@Query(value = "SELECT *FROM COMMENT WHERE parent_comment_id =:id", nativeQuery = true)
	public List<Comment> findAllByIdComment(int id);

	@Query(value = "SELECT *FROM COMMENT WHERE ID =:id", nativeQuery = true)
	public Comment findByIdComment(int id);

}
