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
<link rel="stylesheet" href="<%=basePath%>css/pop.css" type="text/css"></link>
<title></title>
<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/pop.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/sweetalert/sweetalert.min.js"></script>

</head>

<body>
	<div class="form_content_3">

		<fieldset>
			<legend>发货单详情</legend>
			<div class="form-row">
				<div class="field-label">
					<label for="field1">订单编号</label>:
				</div>
				<div class="field-widget">
					<input class="detail" readonly="readonly" value="${so.soid }" />
				</div>
				<div class="field-label">
					<label for="field1">发货时间</label>:
				</div>
				<div class="field-widget">
					<input class="detail" readonly="readonly"
						value="<%=DateUtils.getCurrentDate("yyyy-MM-dd")%>" />
				</div>


			</div>
			<div class="form-row">
				<div class="field-label">
					<label for="field1">收货人</label>:
				</div>
				<div class="field-widget">
					<input class="detail" readonly="readonly"
						value="${so.soReceivePerson }" />
				</div>
				<div class="field-label">
					<label for="field1">收货地址</label>:
				</div>
				<div class="field-widget">
					<input class="detail" readonly="readonly"
						value="  ${so.soaddress }  " />
				</div>

			</div>
		</fieldset>
		<fieldset>
			<legend>发货清单</legend>
			<table class="bordered" id="dispatchdetailAdd">
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
							<td><fmt:formatNumber type="number"
									value="${sod.sodamount*sod.amcProduct.psize}"
									maxFractionDigits="0" />
							</td>
							<td><fmt:formatNumber type="number"
									value="${sod.sodamount*sod.amcProduct.pweight}"
									maxFractionDigits="0" />
							</td>
						</tr>
					</c:forEach>
				</thead>
			</table>
		</fieldset>

		<input type="button" class="submit" value="提交"
			onclick="popup()" />
	</div>
	<div id="dialog-overlay"></div>
	<div id="dialog-box">
		<div class="dialog-content">
			订单编号：<a id="ddbh">${so.soid }</a><br/>
			发货日期：<a id="fhrq"><%=DateUtils.getCurrentDate("yyyy-MM-dd")%></a><br/>
			收货地址：<a id="shdz">${so.soaddress }</a><br/>
			收货人：<a id="shr">${so.soReceivePerson }</a><br/>
			总体积：<a id="ztj"></a><br/>
			总质量：<a id="zzl"></a><br/>
			发货员：<a id="uname">${user.name }</a><br/>
			<br/>
			<table id="dispatchdetail2" style="width: 100%" width="100%" border="1" cellpadding="2" cellspacing="1">
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
							<td><fmt:formatNumber type="number"
									value="${sod.sodamount*sod.amcProduct.psize}"
									maxFractionDigits="0" />
							</td>
							<td><fmt:formatNumber type="number"
									value="${sod.sodamount*sod.amcProduct.pweight}"
									maxFractionDigits="0" />
							</td>
						</tr>
					</c:forEach>
				</thead>
			</table>
			<a id="btn-submit" class="button" onclick="submitDispatchOrder()">确定</a>
		</div>
	</div>
	<div style="height: 100px;"></div>
	</div>


</body>
</html>
