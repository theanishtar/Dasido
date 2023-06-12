package com.davisy.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "chat_participants")

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChatParticipants {

	@EmbeddedId
	Primary primary;

	@Embeddable
	@Data
	@NoArgsConstructor
	@AllArgsConstructor
	public static class Primary implements Serializable {
		private static final long serialVersionUID = 1L;
		int chat_id;
		int user_id;

		@Override
		public String toString() {
			return "Primary [chat_id = " + chat_id + ", user_id = " + user_id + "]";
		}
	}

	@Override
	public String toString() {
		return "ChatParticipants [primary=" + primary + "]";
	}
}
