package com.davisy.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "chats")

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Chats {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	String name_chats;

	@OneToMany(mappedBy = "chats")
//	@JoinColumn(name = "id")
	List<Messages> messages;

}
