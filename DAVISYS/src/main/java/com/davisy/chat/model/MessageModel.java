package com.davisy.chat.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MessageModel {
	private String message;
	private String fromLogin;
	private String img;

	@Override
	public String toString() {
		return "MessageModel{" + "message='" + message + '\'' + ", fromLogin='" + fromLogin + '\'' + ", img='" + img + '\''+'}';
	}
}
