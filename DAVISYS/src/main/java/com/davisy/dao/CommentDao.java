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

	@Query(value = "SELECT a.ID,a.userID,a.parent_comment_id,a.postID,a.date_Comment,a.content,a.cmt_Status "
			+ "FROM COMMENT a INNER JOIN POST b ON a.postID = b.ID "
			+ "INNER JOIN USERS c ON b.userID = c.ID WHERE c.username=:username ORDER BY a.date_Comment DESC", nativeQuery = true)
	public List<Comment> findAllCommentUserSession(String username);

}
