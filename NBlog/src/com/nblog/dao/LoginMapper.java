package com.nblog.dao;

import com.nblog.bean.Login;
import java.util.List;
import com.nblog.util.Page;
/**
 * @author hsu
 * @version 1.0
 */
public interface LoginMapper extends BaseMapper{
	
	int deleteByPrimaryKey(String systemNo);

    int insert(Login login);

    Login selectByPrimaryKey(String systemNo);

    List<Login> selectAll();

    int updateByPrimaryKey(Login login);	
    
    @SuppressWarnings("rawtypes")
    List<Login> selectByPage(Page page);
	
	int deleteByPrimaryKeys(String systemNo );
	
	int updateByPrimaryKeys(String systemNo );
	
	int delete(Login login);
	
	Login selectByWhere(Login login);
	

}
