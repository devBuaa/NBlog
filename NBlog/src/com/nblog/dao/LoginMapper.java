package com.nblog.dao;

import com.nblog.bean.Login;
import java.util.List;

public interface LoginMapper extends BaseMapper{
    int deleteByPrimaryKey(String systemno);

    int insert(Login record);

    Login selectByPrimaryKey(String systemno);

    List<Login> selectAll();

    int updateByPrimaryKey(Login record);
}