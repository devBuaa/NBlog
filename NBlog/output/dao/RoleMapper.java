package com.nblog.dao;

import com.nblog.bean.Role;
import java.util.List;
import com.nblog.util.Page;
/**
 * @author hsu
 * @version 1.0
 */
public interface RoleMapper extends BaseMapper{
	//通过主键删除对象Role
	int deleteByPrimaryKey(Integer id);
	//插入一个对象Role
    int insert(Role role);
    //通过主键获取对象Role
    Role selectByPrimaryKey(Integer id);
    //获取所有对象<一般不建议使用>
    List<Role> selectAll();
    //通过主键更新对象Role
    int updateByPrimaryKey(Role role);	
    //分页获取对象
    @SuppressWarnings("rawtypes")
    List<Role> selectByPage(Page page);
	//删除一个对象Role
	int delete(Role role);
	//通过where条件查找
	Role selectByWhere(Role role);
	

}
