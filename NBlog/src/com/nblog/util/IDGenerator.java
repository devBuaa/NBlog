package com.nblog.util;

import java.text.DecimalFormat;
import java.util.Random;

/**
 * 使用单例模式生成唯一ID
 * @author hsu
 *
 */
public class IDGenerator {
	private static IDGenerator instance;
	
	private IDGenerator(){}
	private Random random=new Random();
	
	public static IDGenerator getInstance(){
		if(instance == null){
			synchronized (IDGenerator.class) {
				if(instance == null){
					instance = new IDGenerator();
				}
			}
		}
		return instance;
	}
	
	public String getID(){	
	    String id=DateUtil.getTimestamp()+new DecimalFormat("0000").format(random.nextInt(10000));
		return id;
	}
	public static void main(String[] args) {
		System.out.println(IDGenerator.getInstance().getID());
	}
	
}
