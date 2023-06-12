package com.davisy.chat.model;

import java.util.Date;

import com.davisy.entity.User;
import com.davisy.entity.UserGoogleCloud;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserModel {
	private MessageType type;
	private String userName;
	private String fullName;
	private String email;
	private String image;
	private int messageUnRead;
	private String lastMessage;
	private Date online;

	public enum MessageType {
		JOIN, LEAVE
	}
}
