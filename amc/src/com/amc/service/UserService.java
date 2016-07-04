package com.amc.service;

import java.io.Serializable;
import java.util.List;

import com.amc.domain.AmcDepartment;
import com.amc.domain.AmcRole;
import com.amc.domain.AmcUser;

public interface UserService extends BaseService {
	AmcUser validateUser(AmcUser user);//验证用户名和密码是否正确
	AmcUser checkExistUser(String username);//检查用户名是否存在
	AmcUser loadByName(String name);//根据用户名获得用户
	List<AmcUser> findUsersByPage(int pageNow,int pageSize);
	AmcUser findUserById(Serializable id);//根据用户名获得用户
	List<AmcRole> getAllRoles();
	List<AmcDepartment> getAllDepartments();
	int getUserCount(); 
	int updatePassword(AmcUser user);
	int updateRole(AmcUser user);
	int updateDepartment(AmcUser user);
	void deleteUserById(Serializable id);
}
