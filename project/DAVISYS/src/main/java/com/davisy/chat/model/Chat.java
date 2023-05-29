package com.davisy.chat.model;

public class Chat {
	private String message;
	private String from;
	private String to;
	public Chat(String message, String from, String to) {
		super();
		this.message = message;
		this.from = from;
		this.to = to;
	}
	public Chat() {
		super();
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	
	
}
