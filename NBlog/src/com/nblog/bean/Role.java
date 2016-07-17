package com.nblog.bean;

import com.nblog.annotation.TableSeg;
import com.nblog.util.FormMap;
/**
 * @author hsu
 *Role  角色类
 */
@TableSeg(tableName = "role",id = "Id")
public class Role extends FormMap<String, Object> {
	private static final long serialVersionUID = 1L;
}
