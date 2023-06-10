package com.davisy.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "history")

@Data
@NoArgsConstructor
@AllArgsConstructor
public class History implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int ID;
	
	@ManyToOne
	@JoinColumn(name = "userID")
	User user;
	
	@OneToOne
	@JoinColumn(name = "postID")
	Post post;
}
