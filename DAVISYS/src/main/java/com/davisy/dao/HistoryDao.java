package com.davisy.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.davisy.entity.History;

public interface HistoryDao extends JpaRepository<History, Integer>{
	@Query(value = "SELECT USERS.USERNAME, POST.LINK_IMAGE, POST.ID \r\n"
			+ "FROM POST \r\n"
			+ "	INNER JOIN USERS\r\n"
			+ "	ON POST.USERID = USERS.ID\r\n"
			+ "	INNER JOIN INTERESTED \r\n"
			+ "	ON POST.ID = INTERESTED.POSTID\r\n"
			+ "WHERE INTERESTED.USERID=:id", nativeQuery = true)
	public List<Object[]> userReacHistory(int id);
	
	@Query(value = "SELECT USERS.USERNAME, POST.LINK_IMAGE \r\n"
			+ "FROM POST \r\n"
			+ "	INNER JOIN USERS\r\n"
			+ "	ON POST.USERID = USERS.ID\r\n"
			+ "	INNER JOIN SHARE \r\n"
			+ "	ON POST.ID = SHARE.POSTID\r\n"
			+ "WHERE SHARE.USERID=:id", nativeQuery = true)
	public List<Object[]> userShareHistory(int id);
	
}
