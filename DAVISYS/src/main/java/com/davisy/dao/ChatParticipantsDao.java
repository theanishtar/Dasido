package com.davisy.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.davisy.entity.ChatParticipants;

public interface ChatParticipantsDao extends JpaRepository<ChatParticipants, Integer> {
	@Query(value = "SELECT *FROM chat_participants WHERE chat_id =:idchat AND user_id =:iduser", nativeQuery = true)
	public ChatParticipants FindChatRoom(int idchat, int iduser);
}
