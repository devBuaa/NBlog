package com.amc.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MDUtil {
	
	/**
	 * md5加密
	 * @param message
	 * @return
	 */
	public static String md5Encode(String message) {
		StringBuffer hexValue = new StringBuffer();
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			byte[] array = message.getBytes("UTF-8");
			byte[] md5Bytes = md5.digest(array);

			for (int i = 0; i < md5Bytes.length; i++) {
				int val = ((int) md5Bytes[i]) & 0xff;
				if (val < 16) {
					hexValue.append("o");
				}
				hexValue.append(Integer.toHexString(val));
			}

		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "";
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return hexValue.toString();
	}

	/***
	 * SHA加密 生成40位SHA码
	 * 
	 * @param 待加密字符串
	 * @return 返回40位SHA码
	 */
	public static String shaEncode(String message) {
		MessageDigest sha = null;
		StringBuffer hexValue = new StringBuffer();
		try {
			sha = MessageDigest.getInstance("SHA");
			byte[] byteArray = message.getBytes("UTF-8");
			byte[] md5Bytes = sha.digest(byteArray);
			
			for (int i = 0; i < md5Bytes.length; i++) {
				int val = ((int) md5Bytes[i]) & 0xff;
				if (val < 16) {
					hexValue.append("0");
				}
				hexValue.append(Integer.toHexString(val));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}

		
		return hexValue.toString();
	}
	
	/*
	 * public static void main(String[] args) { // TODO Auto-generated method
	 * stub String str = new String("1234ufo"); System.out.println("原始：" + str);
	 * System.out.println("MD5后：" + md5Encode(str)); }
	 */

}
