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
<script type="text/javascript" src="<%=basePath%>js/jquery-1.11.3.min.js"/>
<script type="text/javascript">
	
</script>


</head>
  
  <body>
    <div class="form_content_3">
		<fieldset>
			<legend>发货单详情</legend>
			<div class="form-row">
				<div class="field-label">
					<label for="field1">发货编号</label>
				</div>
				<div class="shortfield-widget">
					<input class="shortdetail" readonly="readonly"
						value="${disp.dsid }" />
				</div>
				
				<div class="field-label">
					<label for="field1">订单日期</label>
				</div>
				<div class="shortfield-widget">					
					<input class="shortdetail" readonly="readonly"
						value="<fmt:formatDate value='${disp.amcSalesorder.soctime}' pattern='yyyy-MM-dd'/>" />
				</div>
				<div class="field-label">
					<label for="field1">体积总计</label>
				</div>
				<div class="shortfield-widget">
					<input class="shortdetail" readonly="readonly" value="${disp.dstsize}"/>
				</div>
			</div>
			<div class="form-row">
			    <div class="field-label">
					<label for="field1">订单编号</label>
				</div>
				<div class="shortfield-widget">
					<input class="shortdetail" readonly="readonly" value="${disp.amcSalesorder.soid }" />
				</div>
				<div class="field-label">
					<label for="field1">发货日期</label>
				</div>
				<div class="shortfield-widget">					
					<input class="shortdetail" readonly="readonly"
						value="<fmt:formatDate value='${disp.dsdate}' pattern='yyyy-MM-dd'/>" />
				</div>
				<div class="field-label">
					<label for="field1">质量总计</label>
				</div>
				<div class="shortfield-widget">
					<input class="shortdetail" readonly="readonly" value="${disp.dstweight}"/>
				</div>
				
				
			</div>
			<div class="form-row">
			    <div class="field-label">
					<label for="field1">收&nbsp;&nbsp;货&nbsp;&nbsp;人</label>
				</div>
				<div class="shortfield-widget">
					<input class="shortdetail" readonly="readonly"
						value="${disp.amcSalesorder.soReceivePerson}" />
				</div>
				<div class="field-label">
					<label for="field1">收货地址</label>
				</div>
				<div class="field-widget">
					<input class="shortrequired" readonly="readonly" value="${disp.amcSalesorder.soaddress}" />
				</div>
			</div>
			
		</fieldset>
		
		<fieldset>
			<legend>发货清单</legend>
			<table class="bordered" id="dispatchDetail">
				<thead>

					<tr>
						<th>序号</th>
						<th>产品编号</th>
						<th>产品名称</th>
						<th>产品体积</th>
						<th>产品重量</th>
						<th>发货数量</th>
						<th>体积合计</th>
						<th>重量合计</th>					
						
					</tr>
					<c:forEach items="${sod}" var="sod" varStatus="index">
						<tr>
							<td>${index.count}</td>
							<td>${sod.amcProduct.pid}</td>
							<td>${sod.amcProduct.pname}</td>
							<td>${sod.amcProduct.psize}</td>
							<td>${sod.amcProduct.pweight}</td>
							<td>${sod.sodamount}</td>
							<td>
	                        <fmt:formatNumber type="number" value="${sod.sodamount*sod.amcProduct.psize}" maxFractionDigits="0"/>
							</td>
							<td>
							<fmt:formatNumber type="number" value="${sod.sodamount*sod.amcProduct.pweight}" maxFractionDigits="0"/>
						    </td>
						</tr>
					</c:forEach>
				</thead>
			</table>
		</fieldset>
	</div>
  </body>
</html>
