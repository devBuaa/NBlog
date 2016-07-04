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
<script type="text/javascript">
	function deleteOrder() {
		//确认是否删除，是跳转到window.location.href = '/amc/salesOrder.do?method=delete&soid=${salesorder.soid}';

	}
	function openWantSlipPage(id) {
		top.topManager.openPage({
			id : 'wantslip'+id,
			href : '/amc/want.do?method=showDetailBySo&soid='+id,
			isClose : true,
			title : '缺货单填写'
		});
	}
	function openDispatchPage(id){
		top.topManager.openPage({
			id : 'dispatchOrder'+id,
			href : '/amc/dispatchOrder.do?method=addForward&soid='+id,
			isClose : true,
			title : '发货单填写'
		});
	}
</script>

</head>
<body>
	<div class="form_content_3">
		<fieldset>
			<legend>备货单详情</legend>
			<div class="form-row">
				<div class="field-label">
					<label for="field1">备货单编号</label>
				</div>
				<div class="shortfield-widget">
					<input class="shortdetail" readonly="readonly"
						value="${sto.stoid }" />
				</div>
				<div class="field-label">
					<label for="field1">开单人员</label>
				</div>
				<div class="field-widget">
					<input class="detail" readonly="readonly"
						value="${sto.amcUser.name }" />
				</div>
				<div class="field-label">
					<label for="field1">处理状态</label>
				</div>
				<div class="shortfield-widget">
					<c:choose>
					<c:when test="${sto.stostate eq 2}">
						<input class="shortdetail" readonly="readonly"
						value="未处理" />
					</c:when>
					<c:when test="${sto.stostate eq 1}">
						<input class="shortdetail" readonly="readonly" style="color: #f08300;"
						value="正在处理" />
					</c:when>
					<c:otherwise>
						<input class="shortdetail" readonly="readonly"
						value="已处理" />
					</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="form-row">
			    <div class="field-label">
					<label for="field1">订单编号</label>:
				</div>
				<div class="shortfield-widget">
					<input class="shortdetail" readonly="readonly" value="${sto.amcSalesorder.soid }" />
				</div>
				
				<div class="field-label">
					<label for="field1">开单日期</label>:
				</div>
				<div class="field-widget">					
					<input class="detail" readonly="readonly"
						value="<fmt:formatDate value='${sto.stoctime}' pattern='yyyy-MM-dd'/>" />
				</div>
				
			</div>
						
		</fieldset>
		<fieldset>
			<legend>备货清单</legend>
			<table class="bordered">
				<thead>

					<tr>
						<th>序号</th>
						<th>产品编号</th>
						<th>产品名称</th>
						<th>备货数量</th>
						<c:if test="${sto.stostate eq 1}">
						<th>产品库存</th>						
						<th>状态</th>
						</c:if>
						
					</tr>
					<c:forEach items="${sod}" var="sod" varStatus="index">
						<tr>
							<td>${index.count}</td>
							<td>${sod.amcProduct.pid}</td>
							<td>${sod.amcProduct.pname}</td>
							<td>${sod.sodamount}</td>
							<c:if test="${sto.stostate eq 1}">
							<td>${sod.amcProduct.pinventoryamount}</td>							
							<c:choose>
							<c:when test="${sod.sodamount gt  sod.amcProduct.pinventoryamount}">
							<td><a style="color: #f08300;">缺货</a></td>
							</c:when>						
							<c:otherwise>
							<td>充足</td>
							</c:otherwise>
							</c:choose>
							</c:if>
						</tr>
					</c:forEach>
				</thead>
			</table>
		</fieldset>
		<c:if test="${sto.stostate eq 1 }">
			<fieldset>
				<legend>备货单处理</legend>
				<c:choose>
				<c:when test="${isShort eq true and hasWantSlip eq false}">
				<input type="button" value="开缺货通知单" class="button1"
					onclick="openWantSlipPage(${sto.amcSalesorder.soid })" />
				</c:when>
				<c:when test="${isShort eq true and hasWantSlip eq true}">
				<a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;缺货通知单已提交，正等待处理</a>
				</c:when>
				<c:otherwise>
					<input type="button" value="填写发货单"
					class="button1" onclick="openDispatchPage(${sto.amcSalesorder.soid })" />
				</c:otherwise>
				</c:choose>
			</fieldset>

		</c:if>
	</div>
	
</body>
</html>