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
