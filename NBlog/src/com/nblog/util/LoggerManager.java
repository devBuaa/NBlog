package com.nblog.util;

import org.apache.log4j.Logger;

public class LoggerManager {
	
	@SuppressWarnings("rawtypes")
	public static Logger getLogger(Class clazz){
		return Logger.getLogger(clazz);
	}
	
}
