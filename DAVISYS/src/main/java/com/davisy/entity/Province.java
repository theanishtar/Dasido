package com.davisy.entity;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
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
	
	@OneToOne(mappedBy = "province")
    User user;
//	@ManyToOne
//	@JoinColumn(name = "userAddressID")
//	Province province;
}
