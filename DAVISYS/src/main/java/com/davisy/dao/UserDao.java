package com.davisy.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.davisy.entity.User;

public interface UserDao extends JpaRepository<User, String> {

	@Query(value = "SELECT * FROM users WHERE ID=:id", nativeQuery = true)
	public User findIdUser(int id);
	@Query(value = "Select * from users where username like ?1",nativeQuery = true)
	public User findByUsername(String username);
	@Query(value = "Select * from users where email like ?1",nativeQuery = true)
	public User findByEmail(String email);
}
