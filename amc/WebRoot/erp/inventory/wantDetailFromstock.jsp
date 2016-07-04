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
<link rel="stylesheet" href="<%=basePath%>css/form_content.css"
	type="text/css"></link>
	<link rel="stylesheet" href="<%=basePath%>css/sweetalert/sweetalert.css"
	type="text/css"></link>
<link rel="stylesheet" href="<%=basePath%>css/table.css" type="text/css"></link>
<title></title>
<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/wantSlip.js"></script>


</head>
<body>
	<div class="form_content_3">
		<fieldset>
			<legend>缺货单填写</legend>
			<div class="form-row">
				<div class="field-label">
					<label for="field1">开单人员</label>
				</div>
				<div class="shortfield-widget">
					<input id="wuser" class="shortdetail" readonly="readonly" value="${user.name}" />
					<input id="wuid" type="hidden" value="${user.id}" />
				</div>
				<div class="field-label">
					<label for="field1">开单日期</label>
				</div>
				<div class="shortfield-widget">
					<input class="shortdetail" readonly="readonly" id="wctime"
						value="<%=DateUtils.getCurrentDate("yyyy-MM-dd")%>" />
				</div>
				<div class="field-label">
					<label for="field1">收货期限</label>
				</div>
				<div class="field-widget">
					<input class="detail" type="date" id="wetime"
					 value="<%=DateUtils.getDateStringByOffset(new Date(), 10, "yyyy-MM-dd")%>"/>
				</div>
			</div>
	</fieldset>
	<fieldset>
		<legend>缺货清单</legend>
		<table class="bordered" id="wantsilpdetail">
			<thead>

				<tr>
					<th>序号</th>
					<th>产品编号</th>
					<th>产品名称</th>
					<th>库存量</th>
					<th>订单需求量</th>	
					<th>缺货数量</th>
				</tr>
			</thead>
				<c:forEach items="${sod}" var="sod" varStatus="index">
				<c:if test="${sod.sodamount gt  sod.amcProduct.pinventoryamount}">
				<tr>
							<td>${index.count}</td>
							<td>${sod.amcProduct.pid}</td>
							<td>${sod.amcProduct.pname}</td>
							<td>${sod.amcProduct.pinventoryamount}</td>		
							<td>${sod.sodamount}</td>
							<td>${sod.amcProduct.pshortamount-sod.sodamount>0?sod.sodamount:sod.amcProduct.pshortamount}</td>
				</tr>
				</c:if>												
					</c:forEach>
			
		</table>
	</fieldset>
	<input type="button" class="submit" value="提交" onclick="submitWantSilp(${soid})"/>
	</div>
	<div style="height: 100px;"></div>
	</div>

</body>
</html>