package com.nblog.service;

import java.util.List;

import com.nblog.bean.User;
import com.nblog.util.Page;

public interface UserService extends BaseService{
	@SuppressWarnings("rawtypes")
    public List<User> getUserByPage(Page page); 
	public void addUser(User user);
}
