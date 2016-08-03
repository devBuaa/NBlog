package com.nblog.dao;

import com.nblog.bean.Role;
import java.util.List;
import com.nblog.util.Page;
/**
 * @author hsu
 * @version 1.0
 */
public interface RoleMapper extends BaseMapper{
	
	int deleteByPrimaryKey(Integer id);

    int insert(Role role);

    Role selectByPrimaryKey(Integer id);

    List<Role> selectAll();

    int updateByPrimaryKey(Role role);	
    
    @SuppressWarnings("rawtypes")
    List<Role> selectByPage(Page page);
	
	int deleteByPrimaryKeys(Integer id );
	
	int updateByPrimaryKeys(Integer id );
	
	int delete(Role role);
	
	Role selectByWhere(Role role);
	

}
