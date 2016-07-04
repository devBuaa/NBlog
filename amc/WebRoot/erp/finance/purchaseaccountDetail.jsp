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
			<legend>采购业务账详情</legend>
			<div class="form-row">
				<div class="field-label">
					<label for="field1">账款编号</label>
				</div>
				<div class="shortfield-widget">
					<input class="shortdetail" readonly="readonly" value="${rc.paid }" />
				</div>
				
				<div class="field-label">
					<label for="field1">订单金额</label>
				</div>
				<div class="field-widget">
					<input class="detail" readonly="readonly" value="${rc.patotalaccount }" />
				</div>
			</div>
			<div class="form-row">
				<div class="field-label">
					<label for="field1">订单编号</label>
				</div>
				<div class="shortfield-widget">
					<input class="shortdetail" readonly="readonly"
						value="${rc.amcPayable.amcPurchaseorder.poid }" />
				</div>
				<div class="field-label">
					<label for="field1">付款日期</label>
				</div>
				<div class="field-widget">
					<input class="detail" readonly="readonly"
						value="<fmt:formatDate value='${rc.pactime}' pattern='yyyy-MM-dd'/>" />
				</div>
			</div>
		</fieldset>

		<fieldset>
			<legend>账款清单</legend>
			<table class="bordered" id="purchaseDetail">
				<thead>

					<tr>
						<th>序号</th>
						<th>产品编号</th>
						<th>产品名称</th>
						<th>采购单价</th>
						<th>采购数量</th>
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
		<div style="height: 100px;"></div>
	</div>
</body>
</html>
