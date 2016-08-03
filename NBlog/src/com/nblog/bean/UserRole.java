package com.nblog.bean;

import com.nblog.annotation.TableSeg;

@TableSeg(tableName="UserRole",id="userNo")
public class UserRole{
	private String userNo;
	private Integer roleId;
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	
	public String getUserNo() {
		return this.userNo;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	
	public Integer getRoleId() {
		return this.roleId;
	}

	public String toString() {
		return new StringBuilder()
			.append("UserNo = "+userNo)
			.append(",")
			.append("RoleId = "+roleId)
			
			.toString();
	}	
}
