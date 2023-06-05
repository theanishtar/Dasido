package com.davisy.entity;


import java.io.Serializable;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "INTERESTED")

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Interested implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int ID;
	
	@ManyToOne
	@JoinColumn(name = "userID")
	User user;
	
	@ManyToOne
	@JoinColumn(name = "postID")
	Post post;
	
	String content;
}
