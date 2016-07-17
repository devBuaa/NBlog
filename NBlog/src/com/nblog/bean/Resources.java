package com.nblog.bean;

import com.nblog.annotation.TableSeg;
import com.nblog.util.FormMap;
/**
 * @author hsu
 * Resources 代表菜单类
 */
@TableSeg(tableName = "resources",id = "Id")
public class Resources extends FormMap<String, Object> {
	private static final long serialVersionUID = 1L;
}
