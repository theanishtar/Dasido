package com.davisy.entity;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "GENDERS")

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Gender implements Serializable{
	@Id
	int ID;
	String name_Gender;
	
	@JsonIgnore
	@OneToMany (mappedBy = "gender")
	List<User> user;
}
