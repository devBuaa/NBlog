package com.nblog.bean;

import com.nblog.annotation.TableSeg;
import com.nblog.util.FormMap;

/**
 * @author hsu
 * 用户类
 */
@TableSeg(tableName = "user",id = "UserNo")
public class User extends FormMap<String,Object>{
	private static final long serialVersionUID = 1L;
	
	private String UserNo;//主键
	private String UserName;//用户名
	private String Password;//密码
	private String CredentialsSalt;//加盐
	private String Email;//email
	private String MobilePhone;//phone
	private String Address;
	private String Career;//职业
	private String Industry;//行业
	private String Locked;//状态锁定：0-未锁定，1-锁定
	private String SignTime;//注册时间

	
	public String getUserName() {
		return UserName;
	}

	public void setUserName(String userName) {
		UserName = userName;
	}

	public String getUserNo() {
		return UserNo;
	}

	public void setUserNo(String userNo) {
		UserNo = userNo;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getCredentialsSalt() {
		return CredentialsSalt;
	}

	public void setCredentialsSalt(String credentialsSalt) {
		CredentialsSalt = credentialsSalt;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getMobilePhone() {
		return MobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		MobilePhone = mobilePhone;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getCareer() {
		return Career;
	}

	public void setCareer(String career) {
		Career = career;
	}

	public String getIndustry() {
		return Industry;
	}

	public void setIndustry(String industry) {
		Industry = industry;
	}

	public String getLocked() {
		return Locked;
	}

	public void setLocked(String locked) {
		Locked = locked;
	}

	public String getSignTime() {
		return SignTime;
	}

	public void setSignTime(String signTime) {
		SignTime = signTime;
	}
	
}