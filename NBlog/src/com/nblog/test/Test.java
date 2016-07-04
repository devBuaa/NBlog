package com.nblog.test;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.nblog.bean.User;
import com.nblog.service.UserService;


public class Test {
	
	@Resource  
    private static UserService userService = null;  

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext ac=new ClassPathXmlApplicationContext("config/spring.xml");
		PropertyConfigurator.configure( "src/config/log4j.properties");
		userService=(UserService) ac.getBean("userService");
		
		
		
		
		Logger logger=Logger.getLogger(Test.class);
		User user2=userService.getUserById(6);
		
		logger.info(user2.toString());
		
		
	}

}
