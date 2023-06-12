package com.davisy.entity;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "administrative_regions")

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Administrative_region implements Serializable{
	@Id
	int id;
	String name;
	String name_en;
	String code_name;
	String code_name_en;
	
	@JsonIgnore
	@OneToMany (mappedBy = "administrative_region")
	List<Province> province;
}
