package com.nblog.bean;

import com.nblog.annotation.TableSeg;
import com.nblog.util.FormMap;
/**
 *@descript
 *@author xsx
 *@date 2016年7月16日
 *@version 1.0
 */
@TableSeg(tableName = "user",id = "UserNo")
public class User extends FormMap<String,Object>{
	private static final long serialVersionUID = 1L;
}