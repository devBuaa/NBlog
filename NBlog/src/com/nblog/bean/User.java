package com.nblog.bean;

import com.nblog.annotation.TableSeg;

@TableSeg(tableName="User",id="userNo")
public class User{
	private String userNo;
	private String userName;
	private String password;
	private String credentialsSalt;
	private String email;
	private String mobilePhone;
	private String address;
	private String career;
	private String industry;
	private String locked;
	private String signTime;
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	
	public String getUserNo() {
		return this.userNo;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getUserName() {
		return this.userName;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getPassword() {
		return this.password;
	}
	public void setCredentialsSalt(String credentialsSalt) {
		this.credentialsSalt = credentialsSalt;
	}
	
	public String getCredentialsSalt() {
		return this.credentialsSalt;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getEmail() {
		return this.email;
	}
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}
	
	public String getMobilePhone() {
		return this.mobilePhone;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getAddress() {
		return this.address;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	
	public String getCareer() {
		return this.career;
	}
	public void setIndustry(String industry) {
		this.industry = industry;
	}
	
	public String getIndustry() {
		return this.industry;
	}
	public void setLocked(String locked) {
		this.locked = locked;
	}
	
	public String getLocked() {
		return this.locked;
	}
	public void setSignTime(String signTime) {
		this.signTime = signTime;
	}
	
	public String getSignTime() {
		return this.signTime;
	}

	public String toString() {
		return new StringBuilder()
			.append("UserNo = "+userNo)
			.append(",")
			.append("UserName = "+userName)
			.append(",")
			.append("Password = "+password)
			.append(",")
			.append("CredentialsSalt = "+credentialsSalt)
			.append(",")
			.append("Email = "+email)
			.append(",")
			.append("MobilePhone = "+mobilePhone)
			.append(",")
			.append("Address = "+address)
			.append(",")
			.append("Career = "+career)
			.append(",")
			.append("Industry = "+industry)
			.append(",")
			.append("Locked = "+locked)
			.append(",")
			.append("SignTime = "+signTime)
			
			.toString();
	}	
}
