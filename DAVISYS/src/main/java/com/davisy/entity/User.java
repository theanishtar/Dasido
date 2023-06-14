package com.davisy.entity;

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
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "users")

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int ID;
	@NotBlank(message = "Vui lòng nhập tên đăng nhập")
	String username;
	@NotBlank(message = "Vui lòng nhập mật khẩu")
	String password;
	String fullname;
	String sub;
	@NotBlank(message = "Vui lòng nhập địa chỉ email")
	@Email(message = "Vui lòng nhập đúng định dạng email")
	String email;

	@Temporal(TemporalType.DATE)
	@Column(name = "birthday")
	Date birthday = new Date();

	String gender;

	@ManyToOne
	@JoinColumn(name = "user_AddressID")
	Province province;

	String avatar;
	@Temporal(TemporalType.DATE)
	@Column(name = "ol")
	Date ol = new Date();
	int mark;
	boolean user_Status;
	boolean user_Role;
	boolean ban;
	int get_report;

	@OneToMany
	List<Post> post;

	@OneToMany(mappedBy = "user")
	List<Comment> comment;

	@OneToMany(mappedBy = "user")
	List<History> history;

	@OneToMany(mappedBy = "user")
	List<Interested> interested;

	@OneToMany(mappedBy = "user")
	List<Share> share;

	@OneToMany(mappedBy = "user")
	List<Messages> messages;
}
