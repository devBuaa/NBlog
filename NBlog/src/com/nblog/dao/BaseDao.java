package com.nblog.dao;

import java.util.HashMap;
import java.util.List;

import com.nblog.annotation.TableSeg;
import com.nblog.util.FormMap;

/**
 * 已经实现民基本的 增,删,改,查接口,不需要重复写
 * 所有D都继承这个BaseDao
 */
public interface BaseDao {

	public <T> List<T> findByPage(FormMap<String, Object> map);
	//public <T> List<T> findByWhere(FormMap<String, Object> map);
	public <T> List<T> findByAll(FormMap<String, Object> map);
	public void updateBean(Object formMap) throws Exception;
	
	public <T> List<T> findByNames(T formMap);

	public <T> List<T> findByAttribute(String key, String value, Class<T> clazz);

	@SuppressWarnings("rawtypes")
	public void deleteByAttribute(String key, String value, Class clazz) throws Exception;

	public void addEntity(Object formMap) throws Exception;
	
	@SuppressWarnings("rawtypes")
	public void batchSave(List formMap) throws Exception;

	public void deleteByNames(Object formMap) throws Exception;
	
	public <T> T findbyFrist(String key,String value,Class<T> clazz);
	
	public <T> List<T> initTableField(T formMap);
	
}
