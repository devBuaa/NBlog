package com.nblog.dao;

import java.util.List;

import com.nblog.bean.Role;

public interface RoleDao extends BaseDao {
	public List<Role> seletUserRole(Role map);
	
	public void deleteById(Role map);
}
