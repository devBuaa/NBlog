package com.nblog.dao;

import java.util.List;

import com.nblog.bean.User;

public interface UserDao extends BaseDao{
	public List<User> findUserPage(User user);
	public User findUserByName(User user);
	 
}
