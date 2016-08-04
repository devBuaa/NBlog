package com.nblog.dao;

import com.nblog.bean.Resources;
import java.util.List;
import com.nblog.util.Page;
/**
 * @author hsu
 * @version 1.0
 */
public interface ResourcesMapper extends BaseMapper{
	//通过主键删除对象Resources
	int deleteByPrimaryKey(Integer id);
	//插入一个对象Resources
    int insert(Resources resources);
    //通过主键获取对象Resources
    Resources selectByPrimaryKey(Integer id);
    //获取所有对象<一般不建议使用>
    List<Resources> selectAll();
    //通过主键更新对象Resources
    int updateByPrimaryKey(Resources resources);	
    //分页获取对象
    @SuppressWarnings("rawtypes")
    List<Resources> selectByPage(Page page);
	//删除一个对象Resources
	int delete(Resources resources);
	//通过where条件查找
	Resources selectByWhere(Resources resources);
	//通过UserNo查找菜单
	List<Resources> selectByUserNo(String userno);
}
