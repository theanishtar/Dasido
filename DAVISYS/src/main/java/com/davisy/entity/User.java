package com.davisy.entity;

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
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "users")

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int ID;
	@NotBlank(message = "Vui lòng nhập tên đăng nhập")
	String username;
	@NotBlank(message = "Vui lòng nhập mật khẩu")
	String password;
	String fullname;
	@NotBlank(message = "Vui lòng nhập địa chỉ email")
	@Email(message = "Vui lòng nhập đúng định dạng email")
	String email;
	
	@Temporal(TemporalType.DATE)
	@Column (name = "birthday")
	Date birthday = new Date();
	
	@ManyToOne
	@JoinColumn(name = "genderID")
	Gender gender;
	
	@OneToOne
	@JoinColumn(name = "user_AddressID")
	Province province;
	
	String avatar;
	int mark;
	boolean user_Status;
	boolean user_Role;
	boolean ban;
	
	@OneToMany 
	List<Post> post;
	
	@OneToMany (mappedBy = "user")
	List<Comment> comment;
	
	@OneToMany (mappedBy = "user")
	List<History> history;
	
	@OneToMany (mappedBy = "user")
	List<Interested> interested;
	
	@OneToMany (mappedBy = "user")
	List<Share> share;
}
