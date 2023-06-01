package com.davisy.chat.model;

import com.davisy.model.UserGoogleCloud;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserModel {
	private MessageType type;
	private UserGoogleCloud clouds;

	public enum MessageType {
		JOIN, LEAVE
	}
}
