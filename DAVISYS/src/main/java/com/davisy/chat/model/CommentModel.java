package com.davisy.chat.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentModel {
	private String userNameSession;
	private String userImg;
	private String userName;
	private String fullName;
	private String content;
	private Date commnentDate;
	private boolean cmt_Status;

	@Override
	public String toString() {
		return "CommentModel{" + "userNameSession='" + userNameSession + '\'' + ", userImg='" + userImg + '\''
				+ ", userName='" + userName + '\'' + ", fullName='" + fullName + '\'' + ", content='" + content + '\''
				+ ", commnentDate='" + commnentDate + '\'' + ", cmt_Status='" + cmt_Status + '\'' + '}';
	}
}
