package com.nblog.service;

import com.nblog.bean.User;

public interface UserService {
	public User getUserById(int userId); 
	public void addUser(User user);
}
