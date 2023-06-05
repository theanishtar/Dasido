package com.davisy.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Embeddable;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Entity
//@Table(name = "FOLLOWER")

@Table(name = "follower", uniqueConstraints = { @UniqueConstraint(columnNames = { "followerID", "userID" }) })

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Follower{
	@EmbeddedId
	private Pk pk;
	
	@Embeddable
	@Data
	@NoArgsConstructor
	@AllArgsConstructor
	public static class Pk implements Serializable{
		private static final long serialVersionUID = 1L;
		int followerID;
		int userID;
		
		@Override
		public String toString() {
			return "Pk [followerID = " + followerID + ", userID = " + userID + "]";
		}
	}
	
	@Override
	public String toString() {
	    return "Employee [pk=" + pk + "]";
	  }
}