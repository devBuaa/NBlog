package com.nblog.util;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;



/**
 * 用于根据Excel格式的数据字典生产SQL脚本
 * 只能支持Excel2000-2003格式
 */
public class GenSqlFromExcel {
    private final static String XLS = "xls";  


    public static void main(String [] args){
        String filePath = "C:\\Users\\hsu\\Desktop\\DB.xls";
        genarate(filePath);
    }

    @SuppressWarnings({ "resource", "deprecation" })
    public static void genarate(String filePath){
        try {
            HSSFWorkbook workbook = null;
            HSSFSheet sheet=null;
            
            File excelFile=new File(filePath);
            FileInputStream excelFileStream = new FileInputStream(excelFile);
            
            String extension= excelFile.getName()==null?"":excelFile.getName().split("\\.")[1];
            
            if (extension.equalsIgnoreCase(XLS)) {
                workbook = new HSSFWorkbook(excelFileStream);  
            } else {
                throw new Exception("只能支持扩展名为.xls格式的Excel文件");
            }
            String sqlFileName=excelFile.getName().split("\\.")[0]+".sql";
            
            excelFileStream.close();
            
            List<MysqlTable> mysqlTableList = new ArrayList<MysqlTable>();
            
            for(int sheetIndex=0;sheetIndex<workbook.getNumberOfSheets();sheetIndex++){
                
                sheet=workbook.getSheetAt(sheetIndex);
                int columnNameIndex=9999999;
                
                MysqlTable mysqlTable=new MysqlTable();
                String tableName="";
                String tableDescription="";
                List<String> primaryKeyList =new ArrayList<String>();
                List<String> uniqueIndexList =new ArrayList<String>();
                List<String> normalIndexList =new ArrayList<String>();
                List<String[]> columnList =new ArrayList<String []>();
                
                for(int rowIndex=sheet.getFirstRowNum();rowIndex<=sheet.getLastRowNum();rowIndex++){
                    
                    HSSFRow row = sheet.getRow(rowIndex);

                    String[] columns = new String[4];
                    
                    if (row==null) {
                        continue;
                    }
                    
                    for(short cellIndex=row.getFirstCellNum();cellIndex<row.getLastCellNum();cellIndex++){
                        
                        HSSFCell cell = row.getCell(cellIndex);
                        
                        if (cell==null) {
                            continue;
                        }
                        
                        String cellValueKey;
                        if (cell.getCellType() == HSSFCell.CELL_TYPE_STRING) {
                            cellValueKey=cell.getStringCellValue();
                        } else if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                            cellValueKey=String.valueOf(Double.doubleToLongBits(cell.getNumericCellValue()));
                        } else {
                            cell.setCellType(HSSFCell.CELL_TYPE_STRING);
                            cellValueKey=cell.getStringCellValue()==null?"":cell.getStringCellValue();
                        }
                        cellValueKey=StringUtil.trim(cellValueKey);

                        String cellValue ;
                        
                        if (cellValueKey.equalsIgnoreCase("Table Name")) {
                            cell=row.getCell((short)(cellIndex+1));
                            tableName= StringUtil.trim(cell.getStringCellValue());
                            replaceChineseCharacter(tableName);
                            cellIndex=(short) row.getLastCellNum();
                            continue;
                        }
                        
                        if (cellValueKey.equalsIgnoreCase("Table Description")) {
                            cell=row.getCell((short)(cellIndex+1));
                            tableDescription= StringUtil.trim(cell.getStringCellValue());
                            replaceChineseCharacter(tableDescription);
                            cellIndex=(short) row.getLastCellNum();
                            continue;
                        }
                        
                        if (cellValueKey.equalsIgnoreCase("Column Name")) {
                            columnNameIndex=rowIndex;
                            cellIndex=(short) row.getLastCellNum();
                            continue;
                        }
                        
                        
                        if (rowIndex<columnNameIndex) {
                            // 主键只能出现在Column Name行以前
                            if (cellValueKey.toUpperCase().contains("PRIMARY KEY")){
                                replaceChineseCharacter(cellValueKey);
                                primaryKeyList.add(StringUtil.trim(cellValueKey.substring(cellValueKey.indexOf("("))));
                            }

                            if (cellValueKey.toUpperCase().contains("UNIQUE")){
                                replaceChineseCharacter(cellValueKey);
                                uniqueIndexList.add(StringUtil.trim(cellValueKey.substring(cellValueKey.indexOf("("))));
                            }
                                    
                            if (cellValueKey.toUpperCase().contains("INDEX")){
                                replaceChineseCharacter(cellValueKey);
                                normalIndexList.add(StringUtil.trim(cellValueKey.substring(cellValueKey.indexOf("("))));
                            }
                        } else {
                             // 出现Column Name行以后的行为表中字段行
                            if (cellIndex<4) {
                                cell=row.getCell(cellIndex);
                                if (cell.getCellType() == HSSFCell.CELL_TYPE_STRING) {
                                    cellValue=cell.getStringCellValue();
                                } else if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
                                    cellValue=String.valueOf(Math.round(cell.getNumericCellValue()));
                                } else {
                                    cell.setCellType(HSSFCell.CELL_TYPE_STRING);
                                    cellValue=cell.getStringCellValue()==null?"":cell.getStringCellValue();
                                }
                                cellValue= StringUtil.trim(cellValue);
                                replaceChineseCharacter(cellValue);
                                
                                if (cellValue.equalsIgnoreCase("PRIMARY KEY")) {
                                    cellValue="NOT NULL";
                                }
                                
                                columns[cellIndex] = cellValue;
                            }
                        }
                    }
                    
                    if (StringUtil.isNotEmpty(columns[0]) && StringUtil.isNotEmpty(columns[1])) {
                        columnList.add(columns);
                    }
                }
                
                if (StringUtil.isNotEmpty(tableName) && columnList.size()>0) {
                    mysqlTable.setTableName(tableName);
                    mysqlTable.setTableDescription(tableDescription);
                    mysqlTable.setPrimaryKeyList(primaryKeyList);
                    mysqlTable.setUniqueIndexList(uniqueIndexList);
                    mysqlTable.setNormalIndexList(normalIndexList);
                    mysqlTable.setColumnList(columnList);
                    
                    mysqlTableList.add(mysqlTable);
                }
            }
            
            String sqlPath=excelFile.getParent()+"\\"+sqlFileName;
            File sqlFile=new File(sqlPath);
            sqlFile.delete();
            String createTableSql = genCreateSql(mysqlTableList);
            FileOutputStream out =new FileOutputStream(sqlPath);
            byte [] outBytes=createTableSql.toString().getBytes(StringUtil.DEFAULT_CHARSET);
            IoUtil.write(out,outBytes,1024);
            out.close();
            System.out.println("sql is created.");
            
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    
    public static String genCreateSql(List<MysqlTable> mysqlTableList){
        StringBuffer createSql= new StringBuffer();
        
        for (int tableIndex = 0; tableIndex < mysqlTableList.size(); tableIndex++) {
            StringBuffer createTable= new StringBuffer();
            MysqlTable mysqlTable = mysqlTableList.get(tableIndex);
            if (StringUtil.isNotEmpty(mysqlTable.getTableName())) {
                
                createTable.append("\r\n");
                createTable.append("-- ");
                createTable.append(mysqlTable.getTableDescription());
                createTable.append("\r\n");
                createTable.append("CREATE TABLE ");
                createTable.append(mysqlTable.getTableName());
                createTable.append("(");
                createTable.append("\r\n");
                
                for (int columnIndex=0; columnIndex< mysqlTable.getColumnList().size(); columnIndex++) {
                    
                    StringBuffer sqlLine= new StringBuffer();
                    String [] columns = mysqlTable.getColumnList().get(columnIndex);
                    
                    if (StringUtil.isNotEmpty(columns[0]) && StringUtil.isNotEmpty(columns[1])) {
                        sqlLine.append(genBlankSpace(4));
                        sqlLine.append(columns[0]);
                        
                        sqlLine.append(genBlankSpace((16-sqlLine.length())<=0?1:(16-sqlLine.length())));
                        sqlLine.append(columns[1]);
                        
                        if (StringUtil.isNotEmpty(columns[3])) {
                            sqlLine.append(genBlankSpace((32-sqlLine.length())<=0?1:(32-sqlLine.length())));
                            
                            if (columns[1].toUpperCase().contains("INT") || columns[1].toUpperCase().contains("DECIMAL") || columns[1].toUpperCase().contains("TIMESTAMP")) {
                                sqlLine.append("DEFAULT " + columns[3]);
                            } else {
                                sqlLine.append("DEFAULT '" + columns[3] + "'");
                            }
                        }
                        
                        if (StringUtil.isNotEmpty(columns[2])) {
                            sqlLine.append(genBlankSpace((32-sqlLine.length())<=0?1:(32-sqlLine.length())));
                            sqlLine.append(columns[2]);
                        }
                    }
                    
                    
                    sqlLine.append(genBlankSpace((32-sqlLine.length())<=0?0:(32-sqlLine.length())));
                    sqlLine.append(",");
                    
                    
                    
                    createTable.append(sqlLine);
                    createTable.append("\r\n");
                }
                if (mysqlTable.getPrimaryKeyList().size()>0) {
                    for (int primaryIndex = 0; primaryIndex < mysqlTable.getPrimaryKeyList().size(); primaryIndex++) {
                        String primary = mysqlTable.getPrimaryKeyList().get(primaryIndex);
                        if (StringUtil.isNotEmpty(primary)) {
                            createTable.append(genBlankSpace(4));
                            createTable.append("CONSTRAINT PK_" + mysqlTable.getTableName()+ (primaryIndex==0?"":String.valueOf(primaryIndex+1)) + " PRIMARY KEY" + primary );
                        }
                    }
                }
                
                if (mysqlTable.getUniqueIndexList().size()>0) {
                    createTable.append(",");
                    createTable.append("\r\n");
                    for (int uniqueIndex = 0; uniqueIndex < mysqlTable.getUniqueIndexList().size(); uniqueIndex++) {
                        String unique = mysqlTable.getUniqueIndexList().get(uniqueIndex);
                        if (StringUtil.isNotEmpty(unique)) {
                            createTable.append(genBlankSpace(4));
                            createTable.append("CONSTRAINT U_" + mysqlTable.getTableName() + (uniqueIndex==0?"":String.valueOf(uniqueIndex+1)) + " UNIQUE"+  unique );
                        }
                    }
                }
                
                if (mysqlTable.getNormalIndexList().size()>0) {
                    for (int normalIndex = 0; normalIndex < mysqlTable.getNormalIndexList().size(); normalIndex++) {
                        createTable.append(",");
                        createTable.append("\r\n"); 
                        String normal = mysqlTable.getNormalIndexList().get(normalIndex);
                        if (StringUtil.isNotEmpty(normal)) {
                            createTable.append(genBlankSpace(4));
                            createTable.append("CONSTRAINT I_" + mysqlTable.getTableName() + (normalIndex==0?"":String.valueOf(normalIndex+1)) + " INDEX"  +  normal );
                        }
                    }
                }
                
                    
                createTable.append("\r\n");
                createTable.append(")ENGINE=InnoDB DEFAULT CHARSET=utf8;");
                createTable.append("\r\n");
                
                
                
                
            }
            
            createSql.append(createTable);
        }
        
        return createSql.toString();
    }
    
    public static String genBlankSpace(int num){
        StringBuffer blankSpace=new StringBuffer();
        
        for (int i = 0; i < num; i++) {
            blankSpace.append(" ");
        }
        
        return blankSpace.toString();
    }
    
    public static void replaceChineseCharacter (String cellValue){
        cellValue.replaceAll("（", "(");
        cellValue.replaceAll("）", ")");
        cellValue.replaceAll("，", ",");
    }

}
