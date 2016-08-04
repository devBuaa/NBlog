package com.nblog.dao;

import com.nblog.bean.RoleResources;
import java.util.List;
import com.nblog.util.Page;
/**
 * @author hsu
 * @version 1.0
 */
public interface RoleResourcesMapper extends BaseMapper{
	//通过主键删除对象RoleResources
	int deleteByPrimaryKey(Integer roleId);
	//插入一个对象RoleResources
    int insert(RoleResources roleResources);
    //通过主键获取对象RoleResources
    RoleResources selectByPrimaryKey(Integer roleId);
    //获取所有对象<一般不建议使用>
    List<RoleResources> selectAll();
    //通过主键更新对象RoleResources
    int updateByPrimaryKey(RoleResources roleResources);	
    //分页获取对象
    @SuppressWarnings("rawtypes")
    List<RoleResources> selectByPage(Page page);
    //通过联合主键删除对象RoleResources
	int deleteByPrimaryKeys(Integer roleId,Integer resId);
	//通过联合主键更新对象RoleResources
	int updateByPrimaryKeys(Integer roleId,Integer resId);
	//删除一个对象RoleResources
	int delete(RoleResources roleResources);
	//通过where条件查找
	RoleResources selectByWhere(RoleResources roleResources);
	

}
