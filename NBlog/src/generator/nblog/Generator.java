package generator.nblog;

import cn.org.rapid_framework.generator.GeneratorFacade;

public class Generator {

    public static void main(String[] args) throws Exception {
        // TODO Auto-generated method stub
        GeneratorFacade g = new GeneratorFacade();
        //g.generateByTable("Resources","template");
        //通过数据库表生成文件,template为模板的根目录
        g.generateByAllTable("template");
        //自动搜索数据库中的所有表并生成文件,template为模板的根目录
        //g.generateByClass(Blog.class,"template_clazz");
        //  g.deleteByTable("table_name", "template");
        //删除生成的文件
    }

}
