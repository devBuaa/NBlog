package com.nblog.bean;

import com.nblog.annotation.TableSeg;

@TableSeg(tableName="Login",id="systemNo")
public class Login{
	private String systemNo;
	private String name;
	private String loginIp;
	private String loginBrowser;
	private String offlineTime;
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
	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}
	
	public String getLoginIp() {
		return this.loginIp;
	}
	public void setLoginBrowser(String loginBrowser) {
		this.loginBrowser = loginBrowser;
	}
	
	public String getLoginBrowser() {
		return this.loginBrowser;
	}
	public void setOfflineTime(String offlineTime) {
		this.offlineTime = offlineTime;
	}
	
	public String getOfflineTime() {
		return this.offlineTime;
	}

	public String toString() {
		return new StringBuilder()
			.append("SystemNo = "+systemNo)
			.append(",")
			.append("Name = "+name)
			.append(",")
			.append("LoginIp = "+loginIp)
			.append(",")
			.append("LoginBrowser = "+loginBrowser)
			.append(",")
			.append("OfflineTime = "+offlineTime)
			
			.toString();
	}	
}
