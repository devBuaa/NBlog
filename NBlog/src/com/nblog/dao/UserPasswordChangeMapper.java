package com.nblog.dao;

import com.nblog.bean.UserPasswordChange;
import java.util.List;
import com.nblog.util.Page;
/**
 * @author hsu
 * @version 1.0
 */
public interface UserPasswordChangeMapper extends BaseMapper{
	//通过主键删除对象UserPasswordChange
	int deleteByPrimaryKey(String systemNo);
	//插入一个对象UserPasswordChange
    int insert(UserPasswordChange userPasswordChange);
    //通过主键获取对象UserPasswordChange
    UserPasswordChange selectByPrimaryKey(String systemNo);
    //获取所有对象<一般不建议使用>
    List<UserPasswordChange> selectAll();
    //通过主键更新对象UserPasswordChange
    int updateByPrimaryKey(UserPasswordChange userPasswordChange);	
    //分页获取对象
    @SuppressWarnings("rawtypes")
    List<UserPasswordChange> selectByPage(Page page);
	//删除一个对象UserPasswordChange
	int delete(UserPasswordChange userPasswordChange);
	//通过where条件查找
	UserPasswordChange selectByWhere(UserPasswordChange userPasswordChange);
	//通过Name获取对象
	UserPasswordChange selectByName(String name);
	//通过OldPassword获取对象
	UserPasswordChange selectByOldPassword(String oldPassword);
	//通过NewPassword获取对象
	UserPasswordChange selectByNewPassword(String newPassword);
	

}
