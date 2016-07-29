package com.nblog.dao;

import com.nblog.bean.User;
import com.nblog.util.Page;

import java.util.List;

public interface UserMapper extends BaseMapper{
    int deleteByPrimaryKey(String userno);

    int insert(User record);

    User selectByPrimaryKey(String userno);

    List<User> selectAll();

    int updateByPrimaryKey(User record);
    
    User selectByUsername(String username);
    
    @SuppressWarnings("rawtypes")
    List<User>  selectByPage(Page page);
}