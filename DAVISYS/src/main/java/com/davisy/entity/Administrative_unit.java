package com.davisy.entity;

import java.io.Serializable;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "administrative_units")

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Administrative_unit implements Serializable{
	@Id
	int id;
	String full_name;
	String full_name_en;
	String short_name;
	String short_name_en;
	String code_name;
	String code_name_en;
}
