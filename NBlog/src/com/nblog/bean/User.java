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
	
	private String UserNo;
	private String UserName;

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
	
}