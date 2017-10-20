package com.experts.TransAssist.services;

import com.experts.TransAssist.dao.UserDao;
import com.experts.TransAssist.entities.User;

public class UserService {
	public User checkCredentials(String email) {
		User user = (new UserDao()).check(email);
		return user;
	}
	
	public void addUser(User user){
		UserDao.save(user);
	}
}
