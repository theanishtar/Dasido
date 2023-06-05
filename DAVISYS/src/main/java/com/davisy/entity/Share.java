package com.davisy.entity;

import java.io.Serializable;
import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "SHARE")

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Share implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int ID;
	
	@ManyToOne
	@JoinColumn(name = "postID")
	Post post;
	
	@ManyToOne
	@JoinColumn(name = "userID")
	User user;
	
	@Temporal(TemporalType.DATE)
	@Column (name = "date_Share")
	Date date_Share = new Date();
}
