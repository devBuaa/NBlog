package com.nblog.util;

import java.util.HashMap;
import java.util.Map;

import com.nblog.annotation.TableSeg;

/**
 * sql构造方法
 * @author hsu
 *
 */
public class SqlUtil {
	
	
	/**
	 * 生成插入xml动态sql所需的map
	 * 包含：tableName-->表名
	 * 		 K       --> 插入的字段
	 * 		 V       --> 插入的值
	 * @param map
	 * @return Map<String,Object>
	 */
	public static Map<String,Object> buildInsertMap(Object map){
		Map<String,Object> insertMap = new HashMap<String, Object>();
		Class<?> mapClass = map.getClass();
		insertMap.putAll(getTableNameMap(mapClass));
		insertMap.putAll(ClassUtil.convertBeanToKVMap(map));
		return insertMap;
	}
	
	
	/**
	 * 得到表名对应的Map("tableName",tableName)
	 * @param clazz
	 * @return
	 */
	@SuppressWarnings({ "rawtypes" })
	public static FormMap<String, Object> getTableNameMap(Class clazz){
		FormMap<String, Object> map = new  FormMap<String, Object>();
		String tableName=getTableName(clazz);
		if(tableName!=null){
			map.put("tableName", tableName);
		}
		return map;
		
	}
	/**
	 * 得到表名
	 * @param clazz
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static String getTableName(Class clazz){
		// 某个类是不是存在TableSeg注解
		boolean flag = clazz.isAnnotationPresent(TableSeg.class); 
		//存在
		if (flag) {
			TableSeg table = (TableSeg) clazz.getAnnotation(TableSeg.class);
			return table.tableName();
		} 
		return null;
		
	}
	
	/**
	 * 得到所有字段名
	 * @param clazz
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked"})
	public static FormMap<String, Object> getFields(Class clazz){
		FormMap<String, Object> map=(FormMap<String, Object>) EhcacheUtils.get(getTableName(clazz));
		return map;
		
	}
	
	
	
}
