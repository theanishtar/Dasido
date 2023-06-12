package com.davisy.entity;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "provinces")

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Province implements Serializable{
	@Id
	String code;
	
	String name;
	String name_en;
	String full_name;
	String full_name_en;
	String code_name;
	
	@JsonIgnore
	@OneToMany (mappedBy = "province")
	List<District> district;
	
	@ManyToOne
	@JoinColumn(name = "administrative_region_id")
	Administrative_region administrative_region;
	
	@OneToOne
	@JoinColumn(name = "administrative_unit_id")
	Administrative_unit administrative_unit;
	
	@OneToMany(mappedBy = "province")
	List<User> user;
//	@ManyToOne
//	@JoinColumn(name = "userAddressID")
//	Province province;
}
