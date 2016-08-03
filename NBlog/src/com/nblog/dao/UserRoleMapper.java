package com.nblog.dao;

import com.nblog.bean.UserRole;
import java.util.List;
import com.nblog.util.Page;
/**
 * @author hsu
 * @version 1.0
 */
public interface UserRoleMapper extends BaseMapper{
	
	int deleteByPrimaryKey(String userNo);

    int insert(UserRole userRole);

    UserRole selectByPrimaryKey(String userNo);

    List<UserRole> selectAll();

    int updateByPrimaryKey(UserRole userRole);	
    
    @SuppressWarnings("rawtypes")
    List<UserRole> selectByPage(Page page);
	
	int deleteByPrimaryKeys(String userNo ,Integer roleId );
	
	int updateByPrimaryKeys(String userNo ,Integer roleId );
	
	int delete(UserRole userRole);
	
	UserRole selectByWhere(UserRole userRole);
	

}
