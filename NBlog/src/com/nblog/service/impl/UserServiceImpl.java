package com.nblog.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nblog.bean.User;
import com.nblog.dao.UserMapper;
import com.nblog.service.UserService;
import com.nblog.util.Page;
@Service("userService")
public class UserServiceImpl extends BaseServiceImpl implements UserService {
	
	@Resource
	private UserMapper userMapper;

	

	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		
	}



    @SuppressWarnings("rawtypes")
    @Override
    public List<User> getUserByPage(Page page) {
        // TODO Auto-generated method stub
        List<User> users = userMapper.selectByPage(page);
        return users;
    }

}
