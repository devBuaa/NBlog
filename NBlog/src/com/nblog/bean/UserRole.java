package com.nblog.bean;

import com.nblog.annotation.TableSeg;
import com.nblog.util.FormMap;
/**
 * @author hsu
 *用户与角色对应关系类
 */
@TableSeg(tableName = "userrole", id="UserNo")
public class UserRole extends FormMap<String, Object>{
	private static final long serialVersionUID = 1L;
	
	private String UserNo;
	private int RoleId;
	
	public String getUserNo() {
		return UserNo;
	}
	public void setUserNo(String userNo) {
		UserNo = userNo;
	}
	public int getRoleId() {
		return RoleId;
	}
	public void setRoleId(int roleId) {
		RoleId = roleId;
	}
	
	
}
