<%@page import="com.amc.domain.AmcUser"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="shortcut icon" href="favicon.ico" />
<title>AMC管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
<link href="assets/css/bui-min.css" rel="stylesheet" type="text/css" />
<link href="assets/css/main-min.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="header">

		<div class="dl-title">

			<span class="dl-title-text">AMC管理系统</span>
			</a>
		</div>

		<div class="dl-log">
			欢迎您，<span class="dl-log-user">${user.name}</span><a
				href="<%=basePath%>index.jsp" title="退出系统" class="dl-log-quit">退出</a>
		</div>
	</div>
	<div class="content">
		<div class="dl-main-nav">
			<div class="dl-inform">
				<div class="dl-inform-title">
					贴心小秘书<s class="dl-inform-icon dl-up"></s>
				</div>
			</div>
			<ul id="J_Nav" class="nav-list ks-clear">
				<li class="nav-item dl-selected"><div
						class="nav-item-inner nav-home">首页</div></li>
				<li class="nav-item"><div class="nav-item-inner nav-supplier">采购管理</div></li>
				<li class="nav-item"><div class="nav-item-inner nav-inventory">库存管理</div></li>
				<li class="nav-item"><div class="nav-item-inner nav-order">销售管理</div></li>
				<li class="nav-item"><div class="nav-item-inner nav-cost">财务管理</div></li>
				<li class="nav-item"><div class="nav-item-inner nav-user">人事管理</div></li>
				<li class="nav-item"><div class="nav-item-inner nav-permission">信息维护</div></li>
				<li class="nav-item"><div class="nav-item-inner nav-marketing">商务分析</div></li>
			</ul>
		</div>
		<ul id="J_NavContent" class="dl-tab-conten">

		</ul>
	</div>
	<script type="text/javascript" src="assets/js/jquery-1.8.1.min.js"></script>
	<script type="text/javascript" src="./assets/js/bui.js"></script>
	<script type="text/javascript" src="./assets/js/config.js"></script>

	 <script>
		BUI.use('common/main', function() {
			var config = [ {
				id : 'menu',
				homePage : 'introduce',
				menu : [ {
					text : '首页内容',
					items : [ {
						id : 'introduce',
						text : '公司简介',
						href : 'main/introduce.jsp',
						closeable : true
					}, {
						id : 'service',
						text : '服务对象',
						href : 'main/service.jsp'
					}, {
						id : 'idea',
						text : '理念宗旨',
						href : 'main/idea.jsp'
					}, {
						id : 'information',
						text : '公司信息',
						href : 'main/information.jsp'
					} ]
				},  ]
			}, {
				id : 'purchase',
				menu : [ {
					text : '供应商管理',
					items : [ {
						id : 'supplierList',
						text : '供应商列表',
						href : '/amc/supplier.do?method=list'
					}, {
						id : 'supplierAdd',
						text : '添加供应商',
						href : 'erp/purchase/supplierAdd.jsp'
					} ]
				}, {
					text : '缺货库存盘点',
					items : [ {
						id : 'wantslipList',
						text : '缺货单列表',
						href : '/amc/want.do?method=list'
					}, {
						id : 'scanner',
						text : '缺货库存盘点',
						href : 'erp/purchase/purchaseScanner.jsp'
					} ]
				},
				{
					text : '采购管理',
					items : [ {
						id : 'purchaseorderList',
						text : '采购订单列表',
						href : '/amc/purchase.do?method=list'
					}, {
						id : 'purchaseorderAdd',
						text : '新建采购订单',
						href : '/amc/purchase.do?method=addForward'
					} ]
				} ]
			}, {
				id : 'inventory',
				menu : [ {
					text : '出库作业',
					items : [ {
						id : 'stockList',
						text : '备货单列表',
						href : '/amc/stock.do?method=list'
					}, {
						id : 'dispatchList',
						text : '发货单列表',
						href : '/amc/dispatchOrder.do?method=list'
					} ]
				}, {
					text : '入库作业',
					items : [ {
						id : 'replenishList',
						text : '到货单列表',
						href : '/amc/replenish.do?method=list'
					} ]
				}, {
					text : '产品管理',
					items : [ {
						id : 'productList',
						text : '产品列表',
						href : '/amc/product.do?method=list'
					}, {
						id : 'productAdd',
						text : '添加产品',
						href : 'erp/inventory/productAdd.jsp'
					}

					]
				} ]
			}, {
				id : 'sale',
				menu : [ {
					text : '订单管理',
					items : [ {
						id : 'orderList',
						text : '订单列表',
						href : '/amc/salesOrder.do?method=list'
					}, {
						id : 'orderAdd',
						text : '添加订单',
						href : '/amc/salesOrder.do?method=addForword'
					} ]
				}, {
					text : '顾客管理',
					items : [ {
						id : 'customerList',
						text : '顾客列表',
						href : '/amc/customer.do?method=list'
					}, {
						id : 'customerAdd',
						text : '添加新顾客',
						href : 'erp/sale/customerAdd.jsp'
					} ]

				} ]
			}, {
				id : 'finance',
				menu : [ {
					text : '销售账单管理',
					items : [ {
						id : 'receivableList',
						text : '应收账款列表',
						href : '/amc/receivable.do?method=list'
					}, {
						id : 'saleAccount',
						text : '销售业务账',
						href : '/amc/receivable.do?method=listaccount'
					} ]
				}, {
					text : '采购账单管理',
					items : [ {
						id : 'customerList',
						text : '应付账款列表',
						href : '/amc/payable.do?method=list'
					}, {
						id : 'customerAdd',
						text : '采购业务账',
						href : '/amc/payable.do?method=listaccount'
					} ]

				} ]
			}, {
				id : 'human',
				menu : [ {
					text : '人事管理',
					items : [ {
						id : 'userlist',
						text : '用户管理',
						href : '/amc/user.do?method=list'
					}, {
						id : 'adduser',
						text : '添加用户',
						href : '/amc/user.do?method=addForword'
					} ]
				} ]
			}, {
				id : 'myinfo',
				menu : [ {
					text : '信息维护',
					items : [ {
						id : 'updatepwd',
						text : '修改密码',
						href : 'human/updateMyPwd.jsp'
					} ]
				} ]
			},
			 {
				id : 'bi',
				menu : [ {
					text : '商务分析',
					items : [ {
						id : 'saleAnalysis',
						text : '销售分析',
						href : 'BI/SaleAnalysis.jsp'
					} ,{
					
						id : 'purchaseAnalysis',
						text : '采购分析',
						href : 'BI/PurchaseAnalysis.jsp'
					
					},{
					   id : 'QualityAnalysis',
						text : '质量分析',
						href : 'BI/QualityAnalysis.jsp'
					
					   }]
				} ]
			} ];
			new PageUtil.MainPage({
				modulesConfig : config
			});
		});
	</script>
	<div style="text-align:center;">
		<jsp:include page="foot.jsp" />
	</div>

</body>
</html>
