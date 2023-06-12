package com.davisy.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.davisy.entity.Chats;

public interface ChatsDao extends JpaRepository<Chats, Integer> {
	@Query(value = "SELECT * FROM chats WHERE name_chats =:chatName",nativeQuery = true)
	public Chats findChatNames(String chatName);

}
