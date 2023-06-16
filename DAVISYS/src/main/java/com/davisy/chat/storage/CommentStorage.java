package com.davisy.chat.storage;

import java.util.HashMap;

import com.davisy.chat.model.CommentModel;
import com.davisy.chat.model.UserModel;
import com.davisy.entity.Comment;

public class CommentStorage {
	private static CommentStorage instance;
	private HashMap<String, CommentModel> comments;

	private CommentStorage() {
		comments = new HashMap<String, CommentModel>();
	}

	public static synchronized CommentStorage getInstance() {
		if (instance == null) {
			instance = new CommentStorage();
		}
		return instance;
	}

	public HashMap<String, CommentModel> getComments() {
		return comments;
	}

	public void setComment(String commentId, CommentModel commentModel) throws Exception {
		if (comments.get(commentId) != null) {
			comments.remove(commentId);
//		throw new Exception("User aready exists with userName: " + userName);
		}
		comments.put(commentId, commentModel);
	}

}
