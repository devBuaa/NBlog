<%@page import="com.amc.util.DateUtils"%>
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

<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="<%=basePath%>css/form_content.css"
	type="text/css"></link>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<body>
	<legend2>销售状况统计</legend2>
    <div>&nbsp;</div>
    <div>
       	<label for="field1">开始时间</label>		
		<input type="date" class="detail" name="" id="ctime" 
						value="<%=DateUtils.getDateStringByOffset(new Date(), -7, "yyyy-MM-dd")%>" />
						
		<label for="field1">结束时间</label>		
		<input type="date" class="detail" name="" id="etime"
						value="<%=DateUtils.getCurrentDate("yyyy-MM-dd")%>" />
		<input type="button" value="查询" class="button3" onclick="getChartDataWithDate()"/>
    </div>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="main" style="height:400px;border:0px solid #ccc;padding:10px;"></div>
	<script src="js/echarts.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
</head>

<script type="text/javascript">
	var myChart;
	var eCharts;
	var dom = document.getElementById('main');
	init();
	function init(){
			// 路径配置
	require.config({
		paths : {
			echarts : './js'
		}
	});

	// 使用
	require([ 'echarts', 'echarts/chart/line'
	// 使用柱状图就加载line模块，按需加载
	], function(ec) {
		// 基于准备好的dom，初始化echarts图表
		myChart = ec.init(dom);
		myChart.showLoading({  
                    text: '正在努力加载中...'  
        });  
		option = {
			tooltip : {
				trigger : 'axis'
			},
			legend : {
				data : [ '应收账款', '销售业务账', '销售额' ]
			},

			calculable : true,
			xAxis : [ {
				type : 'category',
				boundaryGap : false,
				data : [ 1, 2, 3, 4, 5, 6, 7 ]
			} ],
			yAxis : [ {
				type : 'value'
			} ],
			series : [ {
				name : '应收账款',
				type : 'line',
				stack : '总量',
				data : [ 120, 132, 101, 134, 90, 230, 210 ]
			}, {
				name : '销售业务账',
				type : 'line',
				stack : '总量',
				data : [ 220, 182, 191, 234, 290, 330, 310 ]
			}, {
				name : '销售额',
				type : 'line',
				stack : '总量',
				data : [ 150, 232, 201, 154, 190, 330, 410 ]
			} ]
		};

		// 为echarts对象加载数据 
		myChart.setOption(option);
		myChart.hideLoading();
		getChartData();//ajax后台交互   
	});
		
	}

	$(document).ready(function() {

	});
	function getChartData() {
		//获得图表的options对象  
		var options = myChart.getOption();
		$.ajax({
			type : "post",
			async : false, //同步执行  
			url : "/amc/ba.do?method=salesChartData",
			data : {},
			dataType : "json", //返回数据形式为json  
			success : function(result) {
				var json = eval(result);
				var category = json.category;
				var legend = json.legend;
				var series = json.series;
				if (legend != "") {
					alert(0);
					options.legend.data = legend;
				}
				if (category != "") {
					options.xAxis[0].data = category;
					var temp = 0;
					var receive = [];
					var account = [];
					var total = [];
					var money_1 = 0.0;//总销售额
					var money_2 = 0.0;//应付账款
					var money_0 = 0.0;//业务账
					for ( var index = 0; index < category.length; index++) {
						for ( var i = temp; i < series.length + 1; i++) {

							if (i < series.length
									&& series[i].time == category[index]) {
								if (series[i].state == "0") {
									money_0 += eval(series[i].account);
								} else {
									money_2 += eval(series[i].account);
								}
								money_1 += eval(series[i].account);
							} else {
								temp = i;
								receive.push(money_2);
								account.push(money_0);
								total.push(money_1);
								money_1 = 0.0;
								money_2 = 0.0;
								money_0 = 0.0;

								break;
							}

						}
					}
					options.series[0].data = receive;
					options.series[1].data = account;
					options.series[2].data = total;
				}

				myChart.hideLoading();
				myChart.setOption(options);

			},
			error : function(errorMsg) {
				alert("不好意思，大爷，图表请求数据失败啦!");
				myChart.hideLoading();
			}
		});

	}
	function getChartDataWithDate() {
		//获得图表的options对象  
		var options = myChart.getOption();
		$.ajax({
			type : "post",
			async : false, //同步执行  
			url : "/amc/ba.do?method=salesChartData&v="+new Date().getTime(),
			data : {"cdate":$('#ctime').val(),"edate":$('#etime').val()},
			dataType : "json", //返回数据形式为json  
			success : function(result) {
				var json = eval(result);
				var category = json.category;
				var legend = json.legend;
				var series = json.series;
				if (legend != "") {
					options.legend.data = legend;
				}
				if (category != "") {
					options.xAxis[0].data = category;
					var temp = 0;
					var receive = [];
					var account = [];
					var total = [];
					var money_1 = 0.0;//总销售额
					var money_2 = 0.0;//应付账款
					var money_0 = 0.0;//业务账
					for ( var index = 0; index < category.length; index++) {
						for ( var i = temp; i < series.length + 1; i++) {

							if (i < series.length
									&& series[i].time == category[index]) {
								if (series[i].state == "0") {
									money_0 += eval(series[i].account);
								} else {
									money_2 += eval(series[i].account);
								}
								money_1 += eval(series[i].account);
							} else {
								temp = i;
								receive.push(money_2);
								account.push(money_0);
								total.push(money_1);
								money_1 = 0.0;
								money_2 = 0.0;
								money_0 = 0.0;

								break;
							}

						}
					}
					options.series[0].data = receive;
					options.series[1].data = account;
					options.series[2].data = total;
				}

				myChart.hideLoading();
				myChart.setOption(options,true);

			},
			error : function(errorMsg) {
				alert("不好意思，大爷，图表请求数据失败啦!");
				myChart.hideLoading();
			}
		});

	}
</script>
</body>
</html>
