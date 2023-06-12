package com.davisy.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
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
	int get_report=0;

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
