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


</head>
<body>
	<div class="form_content_3">
		<fieldset>
			<legend>采购单详情</legend>
			<div class="form-row">
				<div class="field-label">
					<label for="field1">采购编号</label>
				</div>
				<div class="shortfield-widget">
					<input class="shortdetail" readonly="readonly" id="poid"
						value="${po.poid}" />
				</div>
				<div class="field-label">
					<label for="field1">联&nbsp系&nbsp人</label>
				</div>
				<div class="shortfield-widget">
					<input id="" class="shortdetail" readonly="readonly" value="${po.amcSupplier.scontactPerson}" />
				</div>
				<div class="field-label">
					<label for="field1">联系电话</label>
				</div>
				<div class="field-widget">
					<input id="" class="detail" readonly="readonly" value="${po.amcSupplier.sphone}" />
				</div>
				
				
			</div>
			<div class="form-row">
				<div class="field-label">
					<label for="field1">开单人员</label>
				</div>
				<div class="shortfield-widget">
					<input id="pouser" class="shortdetail" readonly="readonly" value="${po.amcUser.name}" />
				</div>
				<div class="field-label">
					<label for="field1">开单日期</label>
				</div>
				<div class="shortfield-widget">
					<input class="shortdetail" readonly="readonly" id="poctime"
						value="<fmt:formatDate value='${po.poctime}' pattern='yyyy-MM-dd'/>" />
				</div>
				<div class="field-label">
					<label for="field1">供应商名称</label>
				</div>
				<div class="field-widget">
					<input id="" class="detail" readonly="readonly" value="${po.amcSupplier.sname}" />
				</div>
				
				
				
			</div>
	</fieldset>
	<fieldset>
		<legend>采购清单</legend>
		<table class="bordered" id="pdetails">
			<thead>

				<tr>
					<th>序号</th>
					<th>产品编号</th>
					<th>产品名称</th>				
					<th>采购数量</th>
					<th>采购单价</th>
					<th>总计</th>
				</tr>
			</thead>
				<c:forEach items="${pod}" var="pod" varStatus="index">
			
				<tr>
							<td>${index.count}</td>
							<td>${pod.amcProduct.pid}</td>
							<td>${pod.amcProduct.pname}</td>					
							<td>${pod.podamount}</td>
							<td>${pod.amcProduct.ppurchaseprice}</td>
							<td>${pod.amcProduct.ppurchaseprice*pod.podamount}</td>
							
				</tr>
										
					</c:forEach>
			
		</table>
	</fieldset>
	</div>
	</div>

</body>
</html>