package com.nblog.dao;

import com.nblog.bean.Resources;
import java.util.List;
import com.nblog.util.Page;
/**
 * @author hsu
 * @version 1.0
 */
public interface ResourcesMapper extends BaseMapper{
	
	int deleteByPrimaryKey(Integer id);

    int insert(Resources resources);

    Resources selectByPrimaryKey(Integer id);

    List<Resources> selectAll();

    int updateByPrimaryKey(Resources resources);	
    
    @SuppressWarnings("rawtypes")
    List<Resources> selectByPage(Page page);
	
	int deleteByPrimaryKeys(Integer id );
	
	int updateByPrimaryKeys(Integer id );
	
	int delete(Resources resources);
	
	Resources selectByWhere(Resources resources);
	
	List<Resources> selectByUserNo(String userno);
}
