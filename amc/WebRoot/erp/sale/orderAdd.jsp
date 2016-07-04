<%@page import="com.amc.util.DateUtils"%>
<%@page import="com.amc.domain.AmcUser"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">


<link rel="stylesheet" href="<%=basePath%>css/table.css" type="text/css" />

<link rel="stylesheet" href="<%=basePath%>css/form_content.css"
	type="text/css"></link>
<link rel="stylesheet" href="<%=basePath%>css/sweetalert/sweetalert.css"
	type="text/css"></link>

<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/salesorderadd.js"></script>
<script>
  var value = [];
  <c:forEach items="${products}" var="p">
     value.push("${p.pid}&${p.pname}&${p.psaleprice}"); 
  </c:forEach>

</script>
</head>
<body>
	<div class="form_content_2">
		<fieldset>
			<legend>订单填写</legend>
			<div class="form-row">
				<div class="field-label">
					<label for="field1">顾客编号</label>
				</div>
				<div class="field-widget">
					<input class="detail" name="" id="cid" readonly="readonly"
						onclick="showCustomerDiv()" />
				</div>
				<div class="field-label">
					<label for="field1">顾客名称</label>
				</div>
				<div class="field-widget">
					<input class="detail" name="" id="cname" readonly="readonly" />
				</div>
			</div>
			<div class="form-row">
				<div class="field-label">
					<label for="field1">收货地址</label>
				</div>
				<div class="field-widget">
					<input class="detail" name="" id="caddress" readonly="readonly"/>
				</div>

				<div class="field-label">
					<label for="field1">收&nbsp;&nbsp;货&nbsp;&nbsp;人</label>
				</div>
				<div class="field-widget">
					<input class="detail" name="" id="creceiver" />
				</div>
			</div>
			<div class="form-row">
				<div class="field-label">
					<label for="field1">联系电话</label>
				</div>
				<div class="field-widget">
					<input class="detail" name="" id="cphone" readonly="readonly"/>
				</div>

				<div class="field-label">
					<label for="field1">下单时间</label>
				</div>
				<div class="field-widget">
					<input type="date" class="detail" name="" id="ctime"
						value="<%=DateUtils.getCurrentDate("yyyy-MM-dd")%>" />
				</div>
			</div>
			<div class="form-row">
				<div class="field-label">
					<label for="field1">销&nbsp;&nbsp;售&nbsp;&nbsp;员</label>
				</div>
				<div class="field-widget">
					<input class="detail" name="" id="cuser" value="${user.name }" readonly="readonly"/>
				</div>
				<div class="field-label">
					<label for="field1">订单金额</label>
				</div>
				<div class="field-widget">
					<input class="detail" name="" id="ctotalMoney" readonly="readonly" value="0.0"/>
				</div>
			</div>

		</fieldset>
		<fieldset>
			<table class="bordered" id="productDetailTable">
				<thead>

					<tr>
						<th>产品代码</th>
						<th>产品名称</th>
						<th>订购数量</th>
						<th>价格</th>
						<th>总计</th>
						<th><img id="add_product_img" src="<%=basePath%>images/add.png" title="添加该产品"
							onclick="showProduct()" />
						</th>
					</tr>

				</thead>

			</table>
		</fieldset>
		<input type="button" class="submit" value="提交" onclick="submitTableAndForm()"/>
		<div style="height: 100px;"></div>

	</div>

	<!-- 准备显示的顾客表格  -->
	<div class="div_customer" id="div_customer"
		style="display: none;border-color: #D8DFEA;border-width: 1px;
		background-color: white;border-style: solid;top: 50px;left: 400px; 
		position: absolute; overflow: auto;height: 380px;width: 600px;">
		<table border="1" align="center" width="100%" height="100%"
			bordercolor="#ffeeaa" class="bordered">
			<!-- 显示所有顾客 -->
			<c:forEach var="c" items="${customers}">
				<tr
					ondblclick='setCustomer("${c.cid},${c.cname},${c.caddress},${c.cphone}")'>
					<td><a>${c.cid}</a></td>
					<td><a>${c.cname}</a></td>
					<td><a>${c.caddress}</a></td>
					<td><a>${c.cphone}</a></td>

				</tr>
			</c:forEach>



		</table>
	</div>
	<!-- 准备显示的添加产品的表单 -->
	<div class="form_content_3" id="productDIv"
		style="display: none;border-color: #D8DFEA;border-width: 1px;position: absolute;
		background-color: white;border-style: solid;top: 50px;left: 400px;  overflow: auto;height: 280px;width:300px;">
		<div> 
		 <fieldset>
			产品编号： <select id="pid" onchange="changeProductById(this)" >
			<option value="0">--请选择--</option>
				<c:forEach var="p" items="${products}">
					<option value="${p.pid}">${p.pid}</option>
				</c:forEach>
			</select>
			<a id="validatePid" style="display:none;">*请选择产品编号！</a>
		</fieldset>
		</div>
		<fieldset>
			产品名称： <select id="pname" onchange="changeProductByName(this)">
			<option value="0">--请选择--</option>
				<c:forEach var="p" items="${products}">
					<option value="${p.pname}">${p.pname}</option>
				</c:forEach>
			</select> 
			<a id="validatePname" style="display: none;">
			
			</a>
		</fieldset> 
		<fieldset>
			订购数量： <input size="3" id="pnumber"/>
			<a id="validatePnum" style="display: none;">*请填写订购数量！</a>
		</fieldset>
		<fieldset>
			产品价格： <input size="3" readonly="readonly" id="pprice"/>
			<a id="validatePprice" style="display: none;">*</a>
		</fieldset>
		<input type="button" class="yes" value="确定" onclick="addProduct()"/>
		
	</div>
	
</body>
</html>