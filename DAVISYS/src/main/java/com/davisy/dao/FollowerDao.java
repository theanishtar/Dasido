package com.davisy.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.davisy.entity.Follower;

public interface FollowerDao extends JpaRepository<Follower, Integer> {
	@Query(value = "SELECT * FROM FOLLOWER WHERE followerID=:id", nativeQuery = true)
	public List<Follower> findAllFollower(int id);

	@Query(value = "select * from FOLLOWER where followerID = :id1 and userID = :id2", nativeQuery = true)
	public Follower findUserUnlf(int id1, int id2);

//	delete from FOLLOWER where followerID = 1 and userID = 1
	
	@Query(value = "SELECT COUNT(FOLLOWERID) AS FOLLOWERCOUNT FROM FOLLOWER\r\n"
			+ "INNER JOIN USERS ON FOLLOWER.USERID=USERS.ID\r\n"
			+ "WHERE USERS.ID = :id", nativeQuery = true)
	public int countFollower(int id);
	
	
	@Query(value = "SELECT COUNT(FOLLOWERID) AS FOLLOWERCOUNT FROM FOLLOWER\r\n"
			+ "	 INNER JOIN USERS ON FOLLOWER.followerID=USERS.ID\r\n"
			+ "	 WHERE USERS.ID= :id", nativeQuery = true)
	public int countFollowing(int id);
	 
	
}