package com.davisy.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "messages")

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Messages implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	String content;
	String send_Time;

	@ManyToOne
	@JoinColumn(name = "sender_id")
	User user;

	@ManyToOne
	@JoinColumn(name = "chat_id")
	Chats chats;

	boolean send_Status;

}
