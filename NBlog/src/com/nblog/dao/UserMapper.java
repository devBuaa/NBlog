package com.nblog.dao;

import com.nblog.bean.User;
import java.util.List;
import com.nblog.util.Page;
/**
 * @author hsu
 * @version 1.0
 */
public interface UserMapper extends BaseMapper{
	
	int deleteByPrimaryKey(String userNo);

    int insert(User user);

    User selectByPrimaryKey(String userNo);

    List<User> selectAll();

    int updateByPrimaryKey(User user);	
    
    @SuppressWarnings("rawtypes")
    List<User> selectByPage(Page page);
	
	int deleteByPrimaryKeys(String userNo );
	
	int updateByPrimaryKeys(String userNo );
	
	int delete(User user);
	
	User selectByWhere(User user);
	
	User selectByUserName(String userName);

}
