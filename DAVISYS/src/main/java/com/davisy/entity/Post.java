package com.davisy.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "post")

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Post implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int ID;

	@ManyToOne
	@JoinColumn(name = "userID")
	User user;

	String post;

	@Temporal(TemporalType.DATE)
	@Column(name = "date_Post")
	Date date_Post = new Date();

	String hashTag;
	String address_Product;
	String link_Image;
	boolean send_StatusID;
	boolean post_Status;
	String product;

	@JsonIgnore
	@OneToMany(mappedBy = "post")
	List<Comment> comment;

	@OneToOne
	@JoinColumn(name = "ID")
	History history;

	@JsonIgnore
	@OneToMany(mappedBy = "post")
	List<Interested> interested;

	@JsonIgnore
	@OneToMany(mappedBy = "post")
	List<Share> share;
}
