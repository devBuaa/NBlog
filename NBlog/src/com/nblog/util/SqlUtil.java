package com.nblog.util;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
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
		insertMap.putAll(convertBeanToKVMap(map));
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
	
	
	 /**
	  * 将对象转成键值对Map
	 * @param object
	 * @return
	 */
	public static Map<String, Object> convertBeanToMap(Object object) 
	 {  
	  
	        if(object == null){  
	            return null;  
	        }          
	        Map<String, Object> map = new HashMap<String, Object>();  
	        try {  
	            BeanInfo beanInfo = Introspector.getBeanInfo(object.getClass());  
	            PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();  
	            for (PropertyDescriptor property : propertyDescriptors) {  
	            	//表字段首字母统一大写
	                String key = StringUtil.initCap(property.getName());  
	                if (!key.equals("Class") && !key.equals("Empty")) {  
	                    Method getter = property.getReadMethod();  
	                    Object value = getter.invoke(object);  
	                    map.put(key, value);  
	                }  
	            }  
	        } catch (Exception e) {  
	        	LoggerManager.getLogger(SqlUtil.class).error("convert BeanToMap Error : "+ e);  
	        	 return null;
	        }  
	        return map;  
	}  
	 
	 
	 /**
	  * 将对象转成可以传入xml的Map对象
	  * 格式：
	  * 	K =  字段名，字段名，字段名...
	  * 	V =  '值'，'值'，'值'...
	 * @param object
	 * @return
	 */
	public static Map<String, Object> convertBeanToKVMap(Object object){
		 if(object == null){  
	            return null;  
	     }
		 Map<String, Object> map = new HashMap<String, Object>();  
		 StringBuffer keys=new StringBuffer();
		 StringBuffer values=new StringBuffer();
		 try {  
	            BeanInfo beanInfo = Introspector.getBeanInfo(object.getClass());  
	            PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();  
	            for (PropertyDescriptor property : propertyDescriptors) {  
	            	//表字段首字母统一大写
	                String key = StringUtil.initCap(property.getName());  
	                if (!key.equals("Class") && !key.equals("Empty")) {  
	                    Method getter = property.getReadMethod();  
	                    Object value = getter.invoke(object);
	                    if(value instanceof String){
	                    	if(StringUtil.isNotEmpty((String)value)){
		                    	keys.append(key).append(",");
		                    	//一定需要加引号表示字符串
		                    	values.append("'"+value+"'").append(",");
		                    } 	   
	                    }else if((value instanceof Integer)|| 
	                    		  (value instanceof Double) || 
	                    		  (value instanceof Float)  ||
	                    		  (value instanceof Long)){
	                    	if(StringUtil.isNotEmpty(value+"")){
		                    	keys.append(key).append(",");
		                    	//非字符串不能加引号
		                    	values.append(value).append(",");
		                    } 	   
	                    }
	                                   
	                }  
	            }
	            keys.deleteCharAt(keys.length()-1);
	            values.deleteCharAt(values.length()-1);
	            map.put("K",keys.toString());
           	map.put("V",values.toString() );
           	return map;
	        } catch (Exception e) {  
	        	LoggerManager.getLogger(SqlUtil.class).error("convert BeanToKVMap Error : "+ e.getMessage() +"---"+e);  
	        	return null;
	        }  
	 }
	
	
}
