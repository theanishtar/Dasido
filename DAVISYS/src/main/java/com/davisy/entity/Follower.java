package com.davisy.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
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