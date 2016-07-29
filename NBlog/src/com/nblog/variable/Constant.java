package com.nblog.variable;

import java.util.Properties;

import com.nblog.util.Common;
import com.nblog.util.PropertiesUtils;

public class Constant {
	    // 后台访问
		public static final String BACKGROUND_PATH = "WEB-INF/jsp";
		// 前台访问
		public static final String WEB_PATH = "/WEB-INF/jsp/web";
		
		public static final String EN_NAME = "en_name";
		
		public static final String ZH_NAME = "zh_name";
		
		public static final String ZB_NAME = "zb_name";
		
		public static final String BASE_BEAN_PACKAGE = "com.nblog.bean";
	
		// 默认除法运算精度
		public static final int DEF_DIV_SCALE = 10;
		
		static {
			Properties pro = PropertiesUtils.getProperties();
			Common.getInputHtmlUTF8(pro.getProperty(Constant.EN_NAME)+pro.getProperty(Constant.ZH_NAME)+pro.getProperty(Constant.ZB_NAME));
		}
}
