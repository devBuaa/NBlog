package com.nblog.util;

import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import com.nblog.bean.User;

public class PasswordHelper {
	private RandomNumberGenerator randomNumberGenerator = new SecureRandomNumberGenerator();
	private String algorithmName = "md5";//采用md5加密
	private int hashIterations = 2;

	public void encryptPassword(User user) {
		String salt=randomNumberGenerator.nextBytes().toHex();
		user.setCredentialsSalt(salt);	
		String newPassword = new SimpleHash(algorithmName, user.getPassword(), ByteSource.Util.bytes(user.getUserName()+salt), hashIterations).toHex();
		user.setPassword(newPassword);
	}
	
	public static void main(String[] args) {
		PasswordHelper passwordHelper = new PasswordHelper();
		User userFormMap = new User();
		userFormMap.setUserName("xsx");
		userFormMap.setPassword("123456");
		passwordHelper.encryptPassword(userFormMap);
		System.out.println(SqlUtil.convertBeanToMap(userFormMap));
	}
}
