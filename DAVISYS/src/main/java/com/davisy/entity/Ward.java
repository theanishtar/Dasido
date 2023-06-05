package com.davisy.entity;


import java.io.Serializable;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "wards")

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Ward implements Serializable{
	@Id
	String code;
	String name;
	String name_en;
	String full_name;
	String full_name_en;
	String code_name;
	
	@ManyToOne
	@JoinColumn(name = "district_code")
	District district;
	
	@OneToOne
	@JoinColumn(name = "administrative_unit_id")
	Administrative_unit administrative_unit;
}
