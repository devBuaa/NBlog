<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.amc.domain.AmcUser"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	AmcUser user = (AmcUser) session.getAttribute("user");
	if (user == null) {
		response.sendRedirect(basePath + "login.jsp");
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'QualityAnalysis.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
     <!--Step:1 Prepare a dom for ECharts which (must) has size (width & hight)-->  
    <!--Step:1 为ECharts准备一个具备大小（宽高）的Dom-->  
     <div id="mainMap" style="height:450px;border:1px solid #ccc;padding:10px;"></div> 
      
    <!--Step:2 Import echarts.js-->  
    <!--Step:2 引入echarts.js-->  
    <script src="js/echarts.js"></script>  
      
    <script type="text/javascript">  
    // Step:3 conifg ECharts's path, link to echarts.js from current page.  
    // Step:3 为模块加载器配置echarts的路径，从当前页面链接到echarts.js，定义所需图表路径  
    require.config({  
        paths: {  
            echarts: './js'  
        }  
    });  
      
    // Step:4 require echarts and use it in the callback.  
    // Step:4 动态加载echarts然后在回调函数中开始使用，注意保持按需加载结构定义图表路径  
    require(  
        [  
            //这里的'echarts'相当于'./js'  
            'echarts',  
            'echarts/chart/map'  
        ],  
        //创建ECharts图表方法  
        function (ec) {  
            // --- 地图 ---  
                //基于准备好的dom,初始化echart图表  
            var myChart = ec.init(document.getElementById('mainMap'));  
            //定义图表option  
            var option = {  
                //标题，每个图表最多仅有一个标题控件，每个标题控件可设主副标题  
                title: {  
                    //主标题文本，'\n'指定换行  
                    text: '消费品质量分析',
                    //副标题文本，'\n'指定换行  
            

                    x: 'center',  
                    //垂直安放位置，默认为全图顶端，可选为：'top' | 'bottom' | 'center' | {number}（y坐标，单位px）  
                    y: 'top'  
                },  
                //图例，每个图表最多仅有一个图例  
                tooltip : {  
                    //触发类型，默认（'item'）数据触发，可选为：'item' | 'axis'  
                    trigger: 'item'  
                },  
                //图例，每个图表最多仅有一个图例  
                legend: {  
                    //布局方式，默认为水平布局(即horizontal)，可选为：'horizontal' | 'vertical'  
                    orient: 'vertical',  
                    //水平安放位置，默认为全图居中，可选为：'center' | 'left' | 'right' | {number}（x坐标，单位px）  
                    x: 'left',  
                    //垂直安放位置，默认为全图顶端，可选为：'top' | 'bottom' | 'center' | {number}（y坐标，单位px）  
                    y: 'top',  
                    //legend的data: 用于设置图例，data内的字符串数组需要与sereis数组内每一个series的name值对应  
                    data:['消费者投诉','网络舆情','召回预警','监督抽查','检测数据']
                },  
                //值域选择，每个图表最多仅有一个值域控件  
                dataRange: {  
                    //布局方式，默认为垂直布局('vertical')，可选为：'horizontal' | 'vertical'  
                    orient: 'vertical',  
                    //指定的最小值，eg: 0，默认无(null)，必须参数  
                    min: 0,  
                    //指定的最大值，eg: 100，默认无(null)，必须参数  
                    max: 2500,  
                    //水平安放位置，默认为全图左对齐('left')，可选为：'center' | 'left' | 'right' | {number}（x坐标，单位px）  
                    x: 'left',  
                    //垂直安放位置，默认为全图底部('bottom')，可选为：'top' | 'bottom' | 'center' | {number}（y坐标，单位px）  
                    y: 'bottom',  
                    //值域文字显示，默认为数值文本  
                    text: ['高','低'],             
                    //是否启用值域漫游，默认为关闭(false)，启用后无视splitNumber，值域显示为线性渐变  
                    calculable: true  
                },  
                //工具箱，每个图表最多仅有一个工具箱  
                toolbox: {  
                    //显示策略，可选为：true（显示） | false（隐藏），默认值为false  
                    show: true,  
                    //布局方式，默认为水平布局('horizontal')，可选为：'horizontal' | 'vertical'  
                    orient: 'vertical',  
                    //水平安放位置，默认为全图右对齐('right')，可选为：'center' | 'left' | 'right' | {number}（x坐标，单位px）  
                    x: 'right',  
                    //垂直安放位置，默认为全图顶端，可选为：'top' | 'bottom' | 'center' | {number}（y坐标，单位px）  
                    y: 'center',  
                    //启用功能，目前支持feature，工具箱自定义功能回调处理  
                    
                },  
                //缩放漫游组件，仅对地图有效  
                roamController: {  
                    //显示策略，默认为显示(true),可选为：true（显示） | false（隐藏）。  
                    show: true,  
                    //水平安放位置，默认为左侧('letf')，可选为：'center' | 'left' | 'right' | {number}（x坐标，单位px）  
                    x: 'right',  
                    //垂直安放位置，默认为全图顶端，可选为：'top' | 'bottom' | 'center' | {number}（y坐标，单位px）  
                    y: 'top',  
                    //必须，默认无(null),指定漫游组件可控地图类型，如：{ china: true }  
                    mapTypeControl: {  
                        //指定地图类型  
                        'china': true  
                    }  
                },  
                //series(地图),驱动图表生成的数据内容数组，数组中每一项为一个系列的选项及数据  
                series : [  
                    {  
                        //系列名称，如果启用legend，该值将被legend.data索引相关  
                        name: '消费者投诉',
                        //图表类型，必要参数！如为空或不支持类型，则该系列数据不被显示  
                        type: 'map',  
                        //地图类型，支持world，china及全国34个省市自治区。省市自治区的mapType直接使用简体中文：如'广东'  
                        mapType: 'china',  
                        //是否开启滚轮缩放和拖拽漫游，默认为false（关闭），其他有效输入为true（开启），'scale'（仅开启滚轮缩放），'move'（仅开启拖拽漫游）  
                        roam: 'scale',  
                        //图形样式，可设置图表内图形的默认样式和强调样式（悬浮时样式）  
                        itemStyle:{  
                            //正常时的样式  
                            normal:{  
                                //边框线宽，单位px  
                                borderWidth: 2,  
                                //边框颜色  
                                borderColor: 'lightgreen',  
                                //标签，饼图默认显示在外部，离饼图距离由labelLine.length决定，地图标签不可指定位置   
                                label: {show:true}  
                            },  
                            //鼠标经过时的样式  
                             emphasis: {  
                                //边框线宽，单位px  
                                borderWidth:2,  
                                //边框颜色  
                                borderColor:'#fff',  
                                //鼠标经过时区域的颜色  
                                color: '#32cd32',  
                                //标签  
                                label: {  
                                    show: true,  
                                    //文本样式  
                                    textStyle: {  
                                        //文本字体颜色  
                                        color: '#fff'  
                                    }  
                                }  
                            }  
                        },  
                        //当图表类型为地图时，需要说明每部分数据对应的省份，可设置选中状态，如 :{name: '北京',value: 1234,selected: true},  
                        data:[  
                            {name: '北京',value: Math.round(Math.random()*1000)},  
                            {name: '天津',value: Math.round(Math.random()*1000)},  
                            {name: '上海',value: Math.round(Math.random()*1000)},  
                            {name: '重庆',value: Math.round(Math.random()*1000)},  
                            {name: '河北',value: Math.round(Math.random()*1000)},  
                            {name: '河南',value: Math.round(Math.random()*1000)},  
                            {name: '云南',value: Math.round(Math.random()*1000)},  
                            {name: '辽宁',value: Math.round(Math.random()*1000)},  
                            {name: '黑龙江',value: Math.round(Math.random()*1000)},  
                            {name: '湖南',value: Math.round(Math.random()*1000)},  
                            {name: '安徽',value: Math.round(Math.random()*1000)},  
                            {name: '山东',value: Math.round(Math.random()*1000)},  
                            {name: '新疆',value: Math.round(Math.random()*1000)},  
                            {name: '江苏',value: Math.round(Math.random()*1000)},  
                            {name: '浙江',value: Math.round(Math.random()*1000)},  
                            {name: '江西',value: Math.round(Math.random()*1000)},  
                            {name: '湖北',value: Math.round(Math.random()*1000)},  
                            {name: '广西',value: Math.round(Math.random()*1000)},  
                            {name: '甘肃',value: Math.round(Math.random()*1000)},  
                            {name: '山西',value: Math.round(Math.random()*1000)},  
                            {name: '内蒙古',value: Math.round(Math.random()*1000)},  
                            {name: '陕西',value: Math.round(Math.random()*1000)},  
                            {name: '吉林',value: Math.round(Math.random()*1000)},  
                            {name: '福建',value: Math.round(Math.random()*1000)},  
                            {name: '贵州',value: Math.round(Math.random()*1000)},  
                            {name: '广东',value: Math.round(Math.random()*1000)},  
                            {name: '青海',value: Math.round(Math.random()*1000)},  
                            {name: '西藏',value: Math.round(Math.random()*1000)},  
                            {name: '四川',value: Math.round(Math.random()*1000)},  
                            {name: '宁夏',value: Math.round(Math.random()*1000)},  
                            {name: '海南',value: Math.round(Math.random()*1000)},  
                            {name: '台湾',value: Math.round(Math.random()*1000)},  
                            {name: '香港',value: Math.round(Math.random()*1000)},  
                            {name: '澳门',value: Math.round(Math.random()*1000)}  
                        ],  
                    },  
                    {  
                        //系列名称，如果启用legend，该值将被legend.data索引相关  
                        name: '网络舆情',
                        //图表类型，必要参数！如为空或不支持类型，则该系列数据不被显示  
                        type: 'map',  
                        //地图类型，支持world，china及全国34个省市自治区。省市自治区的mapType直接使用简体中文：如'广东'  
                        mapType: 'china',  
                        //是否开启滚轮缩放和拖拽漫游，默认为false（关闭），其他有效输入为true（开启），'scale'（仅开启滚轮缩放），'move'（仅开启拖拽漫游）  
                        roam: 'scale',  
                        //图形样式，可设置图表内图形的默认样式和强调样式（悬浮时样式）  
                        itemStyle:{  
                            //正常时的样式  
                            normal:{  
                                //边框线宽，单位px  
                                borderWidth: 2,  
                                //边框颜色  
                                borderColor: 'lightgreen',  
                                //标签，饼图默认显示在外部，离饼图距离由labelLine.length决定，地图标签不可指定位置   
                                label: {show:true}  
                            },  
                            //鼠标经过时的样式  
                             emphasis: {  
                                //边框线宽，单位px  
                                borderWidth:2,  
                                //边框颜色  
                                borderColor:'#fff',  
                                //鼠标经过时区域的颜色  
                                color: '#32cd32',  
                                //标签  
                                label: {  
                                    show: true,  
                                    //文本样式  
                                    textStyle: {  
                                        //文本字体颜色  
                                        color: '#fff'  
                                    }  
                                }  
                            }  
                        },  
                        data:[  
                            {name: '北京',value: Math.round(Math.random()*1000)},  
                            {name: '天津',value: Math.round(Math.random()*1000)},  
                            {name: '上海',value: Math.round(Math.random()*1000)},  
                            {name: '重庆',value: Math.round(Math.random()*1000)},  
                            {name: '河北',value: Math.round(Math.random()*1000)},  
                            {name: '安徽',value: Math.round(Math.random()*1000)},  
                            {name: '新疆',value: Math.round(Math.random()*1000)},  
                            {name: '浙江',value: Math.round(Math.random()*1000)},  
                            {name: '江西',value: Math.round(Math.random()*1000)},  
                            {name: '山西',value: Math.round(Math.random()*1000)},  
                            {name: '内蒙古',value: Math.round(Math.random()*1000)},  
                            {name: '吉林',value: Math.round(Math.random()*1000)},  
                            {name: '福建',value: Math.round(Math.random()*1000)},  
                            {name: '广东',value: Math.round(Math.random()*1000)},  
                            {name: '西藏',value: Math.round(Math.random()*1000)},  
                            {name: '四川',value: Math.round(Math.random()*1000)},  
                            {name: '宁夏',value: Math.round(Math.random()*1000)},  
                            {name: '香港',value: Math.round(Math.random()*1000)},  
                            {name: '澳门',value: Math.round(Math.random()*1000)}  
                        ]  
                    },  
                    {  
                        //系列名称，如果启用legend，该值将被legend.data索引相关  
                        name: '监督抽查',
                        //图表类型，必要参数！如为空或不支持类型，则该系列数据不被显示  
                        type: 'map',  
                        //地图类型，支持world，china及全国34个省市自治区。省市自治区的mapType直接使用简体中文：如'广东'  
                        mapType: 'china',  
                        //是否开启滚轮缩放和拖拽漫游，默认为false（关闭），其他有效输入为true（开启），'scale'（仅开启滚轮缩放），'move'（仅开启拖拽漫游）  
                        roam: 'scale',  
                        //图形样式，可设置图表内图形的默认样式和强调样式（悬浮时样式）  
                        itemStyle:{  
                            //正常时的样式  
                            normal:{  
                                //边框线宽，单位px  
                                borderWidth: 2,  
                                //边框颜色  
                                borderColor: 'lightgreen',  
                                //标签，饼图默认显示在外部，离饼图距离由labelLine.length决定，地图标签不可指定位置   
                                label: {show:true}  
                            },  
                            //鼠标经过时的样式  
                             emphasis: {  
                                //边框线宽，单位px  
                                borderWidth:2,  
                                //边框颜色  
                                borderColor:'#fff',  
                                //鼠标经过时区域的颜色  
                                color: '#32cd32',  
                                //标签  
                                label: {  
                                    show: true,  
                                    //文本样式  
                                    textStyle: {  
                                        //文本字体颜色  
                                        color: '#fff'  
                                    }  
                                }  
                            }  
                        },  
                        data:[  
                            {name: '北京',value: Math.round(Math.random()*1000)},  
                            {name: '天津',value: Math.round(Math.random()*1000)},  
                            {name: '上海',value: Math.round(Math.random()*1000)},  
                            {name: '广东',value: Math.round(Math.random()*1000)},  
                            {name: '台湾',value: Math.round(Math.random()*1000)},  
                            {name: '香港',value: Math.round(Math.random()*1000)},  
                            {name: '澳门',value: Math.round(Math.random()*1000)}  
                        ]  
                    }  ,
                          {
                          //系列名称，如果启用legend，该值将被legend.data索引相关
                          name: '网络舆情',
                          //图表类型，必要参数！如为空或不支持类型，则该系列数据不被显示
                          type: 'map',
                          //地图类型，支持world，china及全国34个省市自治区。省市自治区的mapType直接使用简体中文：如'广东'
                          mapType: 'china',
                          //是否开启滚轮缩放和拖拽漫游，默认为false（关闭），其他有效输入为true（开启），'scale'（仅开启滚轮缩放），'move'（仅开启拖拽漫游）
                          roam: 'scale',
                          //图形样式，可设置图表内图形的默认样式和强调样式（悬浮时样式）
                          itemStyle:{
                          //正常时的样式
                          normal:{
                          //边框线宽，单位px
                          borderWidth: 2,
                          //边框颜色
                          borderColor: 'lightgreen',
                          //标签，饼图默认显示在外部，离饼图距离由labelLine.length决定，地图标签不可指定位置
                          label: {show:true}
                          },
                          //鼠标经过时的样式
                          emphasis: {
                          //边框线宽，单位px
                          borderWidth:2,
                          //边框颜色
                          borderColor:'#fff',
                          //鼠标经过时区域的颜色
                          color: '#32cd32',
                          //标签
                          label: {
                          show: true,
                          //文本样式
                          textStyle: {
                          //文本字体颜色
                          color: '#fff'
                          }
                          }
                          }
                          },
                          data:[
                                {name: '北京',value: Math.round(Math.random()*1000)},
                                {name: '天津',value: Math.round(Math.random()*1000)},
                                {name: '上海',value: Math.round(Math.random()*1000)},
                                {name: '重庆',value: Math.round(Math.random()*1000)},
                                {name: '河北',value: Math.round(Math.random()*1000)},
                                {name: '安徽',value: Math.round(Math.random()*1000)},
                                {name: '新疆',value: Math.round(Math.random()*1000)},
                                {name: '浙江',value: Math.round(Math.random()*1000)},
                                {name: '江西',value: Math.round(Math.random()*1000)},
                                {name: '山西',value: Math.round(Math.random()*1000)},
                                {name: '内蒙古',value: Math.round(Math.random()*1000)},
                                {name: '吉林',value: Math.round(Math.random()*1000)},
                                {name: '福建',value: Math.round(Math.random()*1000)},
                                {name: '广东',value: Math.round(Math.random()*1000)},
                                {name: '西藏',value: Math.round(Math.random()*1000)},
                                {name: '四川',value: Math.round(Math.random()*1000)},
                                {name: '宁夏',value: Math.round(Math.random()*1000)},
                                {name: '香港',value: Math.round(Math.random()*1000)},
                                {name: '澳门',value: Math.round(Math.random()*1000)}
                                ]
                          },
                          {
                          //系列名称，如果启用legend，该值将被legend.data索引相关
                          name: '检测数据',
                          //图表类型，必要参数！如为空或不支持类型，则该系列数据不被显示
                          type: 'map',
                          //地图类型，支持world，china及全国34个省市自治区。省市自治区的mapType直接使用简体中文：如'广东'
                          mapType: 'china',
                          //是否开启滚轮缩放和拖拽漫游，默认为false（关闭），其他有效输入为true（开启），'scale'（仅开启滚轮缩放），'move'（仅开启拖拽漫游）
                          roam: 'scale',
                          //图形样式，可设置图表内图形的默认样式和强调样式（悬浮时样式）
                          itemStyle:{
                          //正常时的样式
                          normal:{
                          //边框线宽，单位px
                          borderWidth: 2,
                          //边框颜色
                          borderColor: 'lightgreen',
                          //标签，饼图默认显示在外部，离饼图距离由labelLine.length决定，地图标签不可指定位置
                          label: {show:true}
                          },
                          //鼠标经过时的样式
                          emphasis: {
                          //边框线宽，单位px
                          borderWidth:2,
                          //边框颜色
                          borderColor:'#fff',
                          //鼠标经过时区域的颜色
                          color: '#32cd32',
                          //标签
                          label: {
                          show: true,
                          //文本样式
                          textStyle: {
                          //文本字体颜色
                          color: '#fff'
                          }
                          }
                          }
                          },
                          data:[
                                {name: '北京',value: Math.round(Math.random()*1000)},
                                {name: '天津',value: Math.round(Math.random()*1000)},
                                {name: '上海',value: Math.round(Math.random()*1000)},
                                {name: '重庆',value: Math.round(Math.random()*1000)},
                                {name: '河北',value: Math.round(Math.random()*1000)},
                                {name: '安徽',value: Math.round(Math.random()*1000)},
                                {name: '新疆',value: Math.round(Math.random()*1000)},
                                {name: '浙江',value: Math.round(Math.random()*1000)},
                                {name: '江西',value: Math.round(Math.random()*1000)},
                                {name: '山西',value: Math.round(Math.random()*1000)},
                                {name: '内蒙古',value: Math.round(Math.random()*1000)},
                                {name: '吉林',value: Math.round(Math.random()*1000)},
                                {name: '福建',value: Math.round(Math.random()*1000)},
                                {name: '广东',value: Math.round(Math.random()*1000)},
                                {name: '西藏',value: Math.round(Math.random()*1000)},
                                {name: '四川',value: Math.round(Math.random()*1000)},
                                {name: '宁夏',value: Math.round(Math.random()*1000)},
                                {name: '香港',value: Math.round(Math.random()*1000)},
                                {name: '澳门',value: Math.round(Math.random()*1000)}
                                ]
                          },
                          ]
            };
            //为echarts对象加载数据
            myChart.setOption(option);  
        }  
    );  
    </script>
  </body>
</html>
