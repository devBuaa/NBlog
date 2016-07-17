package com.nblog.util;

import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import com.nblog.bean.User;

public class PasswordHelper {
	private RandomNumberGenerator randomNumberGenerator = new SecureRandomNumberGenerator();
	private String algorithmName = "md5";
	private int hashIterations = 2;

	public void encryptPassword(User userFormMap) {
		String salt=randomNumberGenerator.nextBytes().toHex();
		userFormMap.put("CredentialsSalt", salt);
		String newPassword = new SimpleHash(algorithmName, userFormMap.get("Password"), ByteSource.Util.bytes(userFormMap.get("UserName")+salt), hashIterations).toHex();
		userFormMap.put("Password", newPassword); 
	}
	public static void main(String[] args) {
		PasswordHelper passwordHelper = new PasswordHelper();
		User userFormMap = new User();
		userFormMap.put("Password","123456");
		userFormMap.put("UserName","admin");
		passwordHelper.encryptPassword(userFormMap);
		System.out.println(userFormMap);
	}
}
