package com.nblog.dao;

import com.nblog.bean.UserPasswordChange;
import java.util.List;
import com.nblog.util.Page;
/**
 * @author hsu
 * @version 1.0
 */
public interface UserPasswordChangeMapper extends BaseMapper{
	
	int deleteByPrimaryKey(String systemNo);

    int insert(UserPasswordChange userPasswordChange);

    UserPasswordChange selectByPrimaryKey(String systemNo);

    List<UserPasswordChange> selectAll();

    int updateByPrimaryKey(UserPasswordChange userPasswordChange);	
    
    @SuppressWarnings("rawtypes")
    List<UserPasswordChange> selectByPage(Page page);
	
	int deleteByPrimaryKeys(String systemNo );
	
	int updateByPrimaryKeys(String systemNo );
	
	int delete(UserPasswordChange userPasswordChange);
	
	UserPasswordChange selectByWhere(UserPasswordChange userPasswordChange);
	

}
