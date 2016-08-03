package com.nblog.bean;

import com.nblog.annotation.TableSeg;

@TableSeg(tableName="RoleResources",id="roleId")
public class RoleResources{
	private Integer roleId;
	private Integer resId;
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	
	public Integer getRoleId() {
		return this.roleId;
	}
	public void setResId(Integer resId) {
		this.resId = resId;
	}
	
	public Integer getResId() {
		return this.resId;
	}

	public String toString() {
		return new StringBuilder()
			.append("RoleId = "+roleId)
			.append(",")
			.append("ResId = "+resId)
			
			.toString();
	}	
}
