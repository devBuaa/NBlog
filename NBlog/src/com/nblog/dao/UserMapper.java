package com.nblog.dao;

import com.nblog.bean.User;
import java.util.List;
import com.nblog.util.Page;
/**
 * @author hsu
 * @version 1.0
 */
public interface UserMapper extends BaseMapper{
	//通过主键删除对象User
	int deleteByPrimaryKey(String userNo);
	//插入一个对象User
    int insert(User user);
    //通过主键获取对象User
    User selectByPrimaryKey(String userNo);
    //获取所有对象<一般不建议使用>
    List<User> selectAll();
    //通过主键更新对象User
    int updateByPrimaryKey(User user);	
    //分页获取对象
    @SuppressWarnings("rawtypes")
    List<User> selectByPage(Page page);
	//删除一个对象User
	int delete(User user);
	//通过where条件查找
	User selectByWhere(User user);
	//通过UserName获取对象
	User selectByUserName(String userName);
	

}
