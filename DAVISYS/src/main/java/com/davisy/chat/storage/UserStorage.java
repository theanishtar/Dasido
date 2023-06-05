package com.davisy.chat.storage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.davisy.chat.model.UserModel;
import com.davisy.entity.UserGoogleCloud;

public class UserStorage {
	private static UserStorage instance;

	private HashMap<String, UserModel> users;

	private UserStorage() {
		users = new HashMap<String, UserModel>();
	}

	public static synchronized UserStorage getInstance() {
		if (instance == null) {
			instance = new UserStorage();
		}
		return instance;
	}

	public HashMap<String, UserModel> getUsers() {
		return users;
	}

	public void setUser(String userName, UserModel userModel) throws Exception {
		if (users.get(userName) != null) {
			users.remove(userName);
//			throw new Exception("User aready exists with userName: " + userName);
		}
		users.put(userName, userModel);
//		System.out.println("setUser: " + users.get(userName) + "   " + userModel);
	}

}
