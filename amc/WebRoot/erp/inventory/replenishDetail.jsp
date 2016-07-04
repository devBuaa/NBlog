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
<link rel="stylesheet" href="<%=basePath%>css/table.css" type="text/css"></link>
<title></title>
</head>
<body>
	<div class="form_content_3">
		<fieldset>
			<legend>到货单详情</legend>
			<div class="form-row">
				<div class="field-label">
					<label for="field1">到货单编号</label>
				</div>
				<div class="field-widget">
					<input class="shortdetail" readonly="readonly"
						value="${rs.rid}" />
				</div>
				<div class="field-label">
					<label for="field1">收货人员</label>
				</div>
				<div class="field-widget">
				<c:choose>
				<c:when test="${rs.rstate eq 1}">
				<input class="detail" readonly="readonly"
						value="无" />
				</c:when>
				<c:otherwise>
				<input class="detail" readonly="readonly"
						value="${rs.amcUser.name}" />
				</c:otherwise>
				</c:choose>
					
				</div>
			</div>
			<div class="form-row">
			    <div class="field-label">
					<label for="field1">采购单编号</label>
				</div>
				<div class="field-widget">
					<input class="shortdetail" readonly="readonly" value="${rs.amcPurchaseorder.poid }" />
				</div>
				
				<div class="field-label">
					<label for="field1">到货日期</label>
				</div>
				<div class="field-widget">					
					<input class="detail" readonly="readonly"
						value="<fmt:formatDate value='${rs.rarrivaltime}' pattern='yyyy-MM-dd'/>" />
				</div>
			</div>
					
		</fieldset>
		<fieldset>
			<legend>到货清单</legend>
			<table class="bordered">
				<thead>

					<tr>
						<th>序号</th>
						<th>产品编号</th>
						<th>产品名称</th>
						<th>到货数量</th>														
					</tr>
					<c:forEach items="${rslist}" var="rl" varStatus="index">
						<tr>
							<td>${index.count}</td>
							<td>${rl.amcProduct.pid}</td>
							<td>${rl.amcProduct.pname}</td>
							<td>${rl.rdamount}</td>							
						</tr>
					</c:forEach>
				</thead>
			</table>
		</fieldset>
	</div>
	
</body>
</html>