package com.nblog.dao;

import com.nblog.bean.Role;
import java.util.List;

public interface RoleMapper extends BaseMapper{
    int deleteByPrimaryKey(Integer id);

    int insert(Role record);

    Role selectByPrimaryKey(Integer id);

    List<Role> selectAll();

    int updateByPrimaryKey(Role record);

}