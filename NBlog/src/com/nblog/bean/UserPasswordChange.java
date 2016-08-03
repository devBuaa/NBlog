package com.nblog.bean;

import com.nblog.annotation.TableSeg;

@TableSeg(tableName="UserPasswordChange",id="systemNo")
public class UserPasswordChange{
	private String systemNo;
	private String name;
	private String oldPassword;
	private String newPassword;
	private String changeTime;
	public void setSystemNo(String systemNo) {
		this.systemNo = systemNo;
	}
	
	public String getSystemNo() {
		return this.systemNo;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getName() {
		return this.name;
	}
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}
	
	public String getOldPassword() {
		return this.oldPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	
	public String getNewPassword() {
		return this.newPassword;
	}
	public void setChangeTime(String changeTime) {
		this.changeTime = changeTime;
	}
	
	public String getChangeTime() {
		return this.changeTime;
	}

	public String toString() {
		return new StringBuilder()
			.append("SystemNo = "+systemNo)
			.append(",")
			.append("Name = "+name)
			.append(",")
			.append("OldPassword = "+oldPassword)
			.append(",")
			.append("NewPassword = "+newPassword)
			.append(",")
			.append("ChangeTime = "+changeTime)
			
			.toString();
	}	
}
