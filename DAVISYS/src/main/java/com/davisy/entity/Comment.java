package com.davisy.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "COMMENT")

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Comment implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int ID;

	@ManyToOne
	@JoinColumn(name = "userID")
	User user;

	@ManyToOne
	@JoinColumn(name = "postID")
	Post post;
	

	@ManyToOne()
	@JoinColumn(name = "parent_comment_id")
	Comment commentParent;
	
	@OneToMany(mappedBy = "commentParent", cascade = CascadeType.ALL)
	List<Comment>replyComment;

	@Temporal(TemporalType.DATE)
	@Column(name = "dateComment")
	Date dateComment = new Date();

	String content;
}
