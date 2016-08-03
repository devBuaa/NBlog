package com.nblog.dao;

import com.nblog.bean.RoleResources;
import java.util.List;
import com.nblog.util.Page;
/**
 * @author hsu
 * @version 1.0
 */
public interface RoleResourcesMapper extends BaseMapper{
	
	int deleteByPrimaryKey(Integer roleId);

    int insert(RoleResources roleResources);

    RoleResources selectByPrimaryKey(Integer roleId);

    List<RoleResources> selectAll();

    int updateByPrimaryKey(RoleResources roleResources);	
    
    @SuppressWarnings("rawtypes")
    List<RoleResources> selectByPage(Page page);
	
	int deleteByPrimaryKeys(Integer roleId ,Integer resId );
	
	int updateByPrimaryKeys(Integer roleId ,Integer resId );
	
	int delete(RoleResources roleResources);
	
	RoleResources selectByWhere(RoleResources roleResources);
	

}
