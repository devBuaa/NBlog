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
<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.11.3.min.js" />
<script type="text/javascript">
	
</script>


</head>

<body>
	<div class="form_content_2">
		<fieldset>
			<legend>应付账款详情</legend>
			<div class="form-row">
				<div class="field-label">
					<label for="field1">应付账编号</label>
				</div>
				<div class="shortfield-widget">
					<input class="shortdetail" readonly="readonly" value="${rc.payid }" />
				</div>
				<div class="field-label">
					<label for="field1">收货日期</label>
				</div>
				<div class="shortfield-widget">
					<input class="shortdetail" readonly="readonly"
						value="<fmt:formatDate value='${rc.payctime}' pattern='yyyy-MM-dd'/>" />
				</div>
				<div class="field-label">
					<label for="field1">订单金额</label>
				</div>
				<div class="field-widget">
					<input class="detail" readonly="readonly" value="${rc.paytotalaccount }" />
				</div>
			</div>
			<div class="form-row">
				<div class="field-label">
					<label for="field1">订单编号</label>
				</div>
				<div class="shortfield-widget">
					<input class="shortdetail" readonly="readonly"
						value="${rc.amcPurchaseorder.poid }" />
				</div>
								
				<div class="field-label">
					<label for="field1">付款期限</label>
				</div>
				<div class="shortfield-widget">
					<input class="shortdetail" readonly="readonly"
						value="<fmt:formatDate value='${rc.paydate}' pattern='yyyy-MM-dd'/>" />
				</div>
			</div>
		</fieldset>

		<fieldset>
			<legend>应付账款清单</legend>
			<table class="bordered" id="dispatchDetail">
				<thead>

					<tr>
						<th>序号</th>
						<th>产品编号</th>
						<th>产品名称</th>
						<th>销售单价</th>
						<th>销售数量</th>
						<th>合计</th>

					</tr>
					<c:forEach items="${rcd}" var="rcd" varStatus="index">
						<tr>
							<td>${index.count}</td>
							<td>${rcd.amcProduct.pid}</td>
							<td>${rcd.amcProduct.pname}</td>
							<td>${rcd.paydprice}</td>
							<td>${rcd.paydamount}</td>
							<td>${rcd.paydsum}</td>
						</tr>
					</c:forEach>
				</thead>
			</table>
		</fieldset>
	</div>
</body>
</html>
