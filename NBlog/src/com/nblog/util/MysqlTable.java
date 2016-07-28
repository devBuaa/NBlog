package com.nblog.util;
import java.util.List;

public class MysqlTable {
    
    String tableName="";
    
    String tableDescription="";
    
    List<String> primaryKeyList;
    
    List<String> uniqueIndexList;
    
    List<String> normalIndexList;
    
    List<String[]> columnList;
    

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getTableDescription() {
        return tableDescription;
    }

    public void setTableDescription(String tableDescription) {
        this.tableDescription = tableDescription;
    }

    public List<String> getPrimaryKeyList() {
        return primaryKeyList;
    }

    public void setPrimaryKeyList(List<String> primaryKeyList) {
        this.primaryKeyList = primaryKeyList;
    }

    public List<String> getUniqueIndexList() {
        return uniqueIndexList;
    }

    public void setUniqueIndexList(List<String> uniqueIndexList) {
        this.uniqueIndexList = uniqueIndexList;
    }

    public List<String> getNormalIndexList() {
        return normalIndexList;
    }

    public void setNormalIndexList(List<String> normalIndexList) {
        this.normalIndexList = normalIndexList;
    }

    public List<String[]> getColumnList() {
        return columnList;
    }

    public void setColumnList(List<String[]> columnList) {
        this.columnList = columnList;
    }
    
}
