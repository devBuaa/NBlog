package com.nblog.dao;

import com.nblog.bean.Login;
import java.util.List;
import com.nblog.util.Page;
/**
 * @author hsu
 * @version 1.0
 */
public interface LoginMapper extends BaseMapper{
	//通过主键删除对象Login
	int deleteByPrimaryKey(String systemNo);
	//插入一个对象Login
    int insert(Login login);
    //通过主键获取对象Login
    Login selectByPrimaryKey(String systemNo);
    //获取所有对象<一般不建议使用>
    List<Login> selectAll();
    //通过主键更新对象Login
    int updateByPrimaryKey(Login login);	
    //分页获取对象
    @SuppressWarnings("rawtypes")
    List<Login> selectByPage(Page page);
	//删除一个对象Login
	int delete(Login login);
	//通过where条件查找
	Login selectByWhere(Login login);
	

}
