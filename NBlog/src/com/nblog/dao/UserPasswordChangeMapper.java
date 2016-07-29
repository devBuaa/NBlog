package com.nblog.dao;

import com.nblog.bean.UserPasswordChange;
import java.util.List;

public interface UserPasswordChangeMapper extends BaseMapper{
    int insert(UserPasswordChange record);

    List<UserPasswordChange> selectAll();
}