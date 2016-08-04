<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
package ${basepackage}.bean;

import com.nblog.annotation.TableSeg;

@TableSeg(tableName="${className}",id="${table.pkColumn.columnNameFirstLower}")
public class ${className}{
	<#list table.columns as column>
	private ${column.simpleJavaType} ${column.columnNameLower};
	</#list>
	
<@generateJavaColumns/>

	public String toString() {
		return new StringBuilder()
		    .append("${className}[")
		<#list table.columns as column>
		    .append("${column.columnName} = "+${column.columnNameLower})
		    <#if column_has_next>
		    .append(",")
		    </#if>
		</#list>
		    .append("]").toString();
	}	
}
<#macro generateJavaColumns>
	<#list table.columns as column>
		<#if column.isDateTimeColumn>
	public String get${column.columnName}String() {
		return DateConvertUtils.format(get${column.columnName}(), FORMAT_${column.constantName});
	}
	public void set${column.columnName}String(String ${column.columnNameLower}) {
		set${column.columnName}(DateConvertUtils.parse(${column.columnNameLower}, FORMAT_${column.constantName},${column.simpleJavaType}.class));
	}
	
		</#if>	
	public void set${column.columnName}(${column.simpleJavaType} ${column.columnNameLower}) {
		this.${column.columnNameLower} = ${column.columnNameLower};
	}
	
	public ${column.simpleJavaType} get${column.columnName}() {
		return this.${column.columnNameLower};
	}
	</#list>
</#macro>

