package com.amc.service.imp;

import java.io.Serializable;
import java.util.List;

import com.amc.cfg.Constant;
import com.amc.domain.AmcDepartment;
import com.amc.domain.AmcRole;
import com.amc.domain.AmcUser;
import com.amc.service.UserService;
import com.amc.util.MDUtil;

public class UserServiceImp extends BaseServiceImp implements UserService {

	public AmcUser validateUser(AmcUser user) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<AmcUser> list = find("from AmcUser where name=? and password=?",
				new Object[] { user.getName(), user.getPassword() });
		if (list.size() == 1) {
			return list.get(0);
		} else {
			return null;
		}
	}
	public AmcUser checkExistUser(String username) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<AmcUser> list = find("from AmcUser where name=?",
				new Object[] { username});
		if (list.size() == 1) {
			return list.get(0);
		} else {
			return null;
		}
	}

	public int updatePassword(AmcUser user) {
		// TODO Auto-generated method stub
		int result=update("update AmcUser u set u.password = ? where u.id = ?", new Object[]{MDUtil.md5Encode(user.getPassword()),user.getId()});
		return result;
	}

	public int updateRole(AmcUser user) {
		// TODO Auto-generated method stub
		int result=update("update AmcUser u set u.roleId = ? where u.id = ?", new Object[]{user.getAmcRole().getId(),user.getId()});
		return result;
	}

	public int updateDepartment(AmcUser user) {
		// TODO Auto-generated method stub
		int result=update("update AmcUser u set u.departmentId = ? where u.id = ?", new Object[]{user.getAmcDepartment().getId(),user.getId()});
		return result;
	}
	public AmcUser loadByName(String name) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<AmcUser> list = find("from AmcUser where name=? ",
				new Object[] { name });
		if (list.size() == 1) {
			return list.get(0);
		} else {
			return null;
		}
	}
	public int getUserCount() {
		// TODO Auto-generated method stub
		return getCount("from AmcUser", null);
	}
	@SuppressWarnings("unchecked")
	public List<AmcUser> findUsersByPage(int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return findByPage("from AmcUser", null, pageNow, pageSize);
	}
	public AmcUser findUserById(Serializable id) {
		// TODO Auto-generated method stub
		return (AmcUser) findById(AmcUser.class, id);
	}
	@SuppressWarnings("unchecked")
	public List<AmcRole> getAllRoles() {
		// TODO Auto-generated method stub
		return find("from AmcRole", null);
	}
	@SuppressWarnings("unchecked")
	public List<AmcDepartment> getAllDepartments() {
		// TODO Auto-generated method stub
		return find("from AmcDepartment", null);
	}

	public void deleteUserById(Serializable id) {
		// TODO Auto-generated method stub
		update("delete from AmcUser where id=?", new Object[] { id });
	}

}
