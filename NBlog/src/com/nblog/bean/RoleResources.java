package com.nblog.bean;

import com.nblog.annotation.TableSeg;
import com.nblog.util.FormMap;
/**
 * @author hsu
 * 角色与菜单关系对应类
 */
@TableSeg(tableName = "roleresources", id="RoleId")
public class RoleResources extends FormMap<String, Object>{
	private static final long serialVersionUID = 1L;
}
