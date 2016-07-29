package com.nblog.dao;

import com.nblog.bean.UserRole;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserRoleMapper extends BaseMapper{
    int deleteByPrimaryKey(@Param("userno") String userno, @Param("roleid") Integer roleid);

    int insert(UserRole record);

    List<UserRole> selectAll();

}