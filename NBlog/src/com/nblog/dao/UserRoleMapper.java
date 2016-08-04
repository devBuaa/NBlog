package com.nblog.dao;

import com.nblog.bean.UserRole;
import java.util.List;
import com.nblog.util.Page;
/**
 * @author hsu
 * @version 1.0
 */
public interface UserRoleMapper extends BaseMapper{
	//通过主键删除对象UserRole
	int deleteByPrimaryKey(String userNo);
	//插入一个对象UserRole
    int insert(UserRole userRole);
    //通过主键获取对象UserRole
    UserRole selectByPrimaryKey(String userNo);
    //获取所有对象<一般不建议使用>
    List<UserRole> selectAll();
    //通过主键更新对象UserRole
    int updateByPrimaryKey(UserRole userRole);	
    //分页获取对象
    @SuppressWarnings("rawtypes")
    List<UserRole> selectByPage(Page page);
    //通过联合主键删除对象UserRole
	int deleteByPrimaryKeys(String userNo,Integer roleId);
	//通过联合主键更新对象UserRole
	int updateByPrimaryKeys(String userNo,Integer roleId);
	//删除一个对象UserRole
	int delete(UserRole userRole);
	//通过where条件查找
	UserRole selectByWhere(UserRole userRole);
	

}
