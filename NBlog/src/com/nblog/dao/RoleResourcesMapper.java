package com.nblog.dao;

import com.nblog.bean.RoleResources;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RoleResourcesMapper extends BaseMapper{
    int deleteByPrimaryKey(@Param("roleid") Integer roleid, @Param("resid") Integer resid);

    int insert(RoleResources record);

    List<RoleResources> selectAll();
}