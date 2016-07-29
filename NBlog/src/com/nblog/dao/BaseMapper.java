package com.nblog.dao;

import java.util.List;
import java.util.Map;

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
	public <T> List<T> findByAll(Map<String, Object> map);
	
	/**
	 * 根据表名，字段名的Map进行插入
	 * @param map
	 * @return int
	 */
	public int insertByMap(Map<String,Object> map);
	

	@SuppressWarnings("rawtypes")
	public void batchSave(List formMap) throws Exception;

	
	
}
