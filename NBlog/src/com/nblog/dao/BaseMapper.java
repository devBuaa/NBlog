package com.nblog.dao;

import java.util.List;
import java.util.Map;

import com.nblog.util.FormMap;

/**
 * 已经实现民基本的 增,删,改,查接口,不需要重复写
 * 所有Dao都继承这个BaseDao
 */
public interface BaseMapper {
	
	/**
	 * 初始化表字段
	 * @param formMap
	 * @return
	 */
	public <T> List<T> initTableField(T formMap);

	/**
	 * 根据数据分页查询
	 * @param map（包含：表名，页码，过滤的条件）
	 * @return List<T>
	 */
	public <T> List<T> findByPage(FormMap<String, Object> map);
	/**
	 * 根据where语句查询
	 * @param map（包含：表名，where语句）
	 * @return List<T>
	 */
	public <T> List<T> findByWhere(Map<String, Object> map);
	/**
	 * 根据表名查询所有的数据项
	 * @param map（包含：表名）
	 * @return
	 */
	public <T> List<T> findByAll(FormMap<String, Object> map);
	
	/**
	 * 根据表名，字段名的Map进行插入
	 * @param map
	 * @return int
	 */
	public int insertByMap(Map<String,Object> map);
	
	/**
	 * 根据多个
	 * @param formMap
	 * @return
	 */
	public <T> List<T> findByNames(T formMap);

	public <T> List<T> findByAttribute(String key, String value, Class<T> clazz);
	
	/**
	 * 更新对象
	 * @param formMap
	 * @throws Exception
	 */
	public void update(Object formMap) throws Exception;
	
	

	@SuppressWarnings("rawtypes")
	public void deleteByAttribute(String key, String value, Class clazz) throws Exception;

	public void addEntity(Object formMap) throws Exception;
	
	@SuppressWarnings("rawtypes")
	public void batchSave(List formMap) throws Exception;

	public void deleteByNames(Object formMap) throws Exception;
	
	public <T> T findbyFrist(String key,String value,Class<T> clazz);
	
	
	
}
