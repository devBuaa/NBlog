1.用的数据库是MySQL，MySQL配置文件需设置表名区分大小写：lower_case_table_names = 0 
2.执行resource下的db.sql即可。表结构设计不合理可以提.
3.数据字典使用DB.xls，表创建完毕指定路径直接执行GenSqlFromExcel即可生成sql语句
4.生成的sql脚本需加入db.sql中
5.在MySQL创建完表后，可以执行generator.nblog.Generator来创建bean，dao， mapping 具体模板指定在template中
6.具体编程规范参照编程规范（1.0）.docx


