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
	
	int deleteByPrimaryKey(${table.pkColumn.simpleJavaType} ${table.pkColumn.columnNameFirstLower});

    int insert(${className} ${table.classNameFirstLower});

    ${className} selectByPrimaryKey(${table.pkColumn.simpleJavaType} ${table.pkColumn.columnNameFirstLower});

    List<${className}> selectAll();

    int updateByPrimaryKey(${className} ${table.classNameFirstLower});	
    
    @SuppressWarnings("rawtypes")
    List<${className}> selectByPage(Page page);
	
	int deleteByPrimaryKeys(<#list table.compositeIdColumns as column>${column.simpleJavaType} ${column.columnNameFirstLower} <#if column_has_next>,</#if></#list>);
	
	int updateByPrimaryKeys(<#list table.compositeIdColumns as column>${column.simpleJavaType} ${column.columnNameFirstLower} <#if column_has_next>,</#if></#list>);
	
	int delete(${className} ${table.classNameFirstLower});
	
	${className} selectByWhere(${className} ${table.classNameFirstLower});
	
	<#list table.columns as column>
	<#if column.unique && !column.pk>
	${className} selectBy${column.columnName}(${column.simpleJavaType} ${column.columnNameFirstLower});
	</#if>
	</#list>

}
