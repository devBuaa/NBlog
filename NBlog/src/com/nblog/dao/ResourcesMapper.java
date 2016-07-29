package com.nblog.dao;

import com.nblog.bean.Resources;
import java.util.List;

public interface ResourcesMapper extends BaseMapper{
    int deleteByPrimaryKey(Integer id);

    int insert(Resources record);

    Resources selectByPrimaryKey(Integer id);

    List<Resources> selectAll();

    int updateByPrimaryKey(Resources record);
    
    List<Resources> selectbyUserno(String userno);
}