<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>   
package ${basepackage}.dao;

import ${basepackage}.bean.${className};
import java.util.List;
import com.nblog.util.Page;
/**
 * @author hsu
 * @version 1.0
 */
public interface ${className}Mapper extends BaseMapper{
	//通过主键删除对象${className}
	int deleteByPrimaryKey(${table.pkColumn.simpleJavaType} ${table.pkColumn.columnNameFirstLower});
	//插入一个对象${className}
    int insert(${className} ${table.classNameFirstLower});
    //通过主键获取对象${className}
    ${className} selectByPrimaryKey(${table.pkColumn.simpleJavaType} ${table.pkColumn.columnNameFirstLower});
    //获取所有对象<一般不建议使用>
    List<${className}> selectAll();
    //通过主键更新对象${className}
    int updateByPrimaryKey(${className} ${table.classNameFirstLower});	
    //分页获取对象
    @SuppressWarnings("rawtypes")
    List<${className}> selectByPage(Page page);
    <#if table.compositeId>
    //通过联合主键删除对象${className}
	int deleteByPrimaryKeys(<#list table.compositeIdColumns as column>${column.simpleJavaType} ${column.columnNameFirstLower}<#if column_has_next>,</#if></#list>);
	//通过联合主键更新对象${className}
	int updateByPrimaryKeys(<#list table.compositeIdColumns as column>${column.simpleJavaType} ${column.columnNameFirstLower}<#if column_has_next>,</#if></#list>);
	</#if>
	//删除一个对象${className}
	int delete(${className} ${table.classNameFirstLower});
	//通过where条件查找
	${className} selectByWhere(${className} ${table.classNameFirstLower});
	<#list table.columns as column>
	<#if column.unique && !column.pk>
	//通过${column.columnName}获取对象
	${className} selectBy${column.columnName}(${column.simpleJavaType} ${column.columnNameFirstLower});
	</#if>
	<#if column.indexed && !column.pk && !column.unique && !column.nullable>
	//通过${column.columnName}获取对象
	${className} selectBy${column.columnName}(${column.simpleJavaType} ${column.columnNameFirstLower});
	</#if>
	</#list>
	

}
