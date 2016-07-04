<%@page import="com.amc.domain.AmcUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" href="<%=basePath%>css/form_content.css"
	type="text/css"></link>
<link rel="stylesheet" href="<%=basePath%>css/sweetalert/sweetalert.css"
	type="text/css"></link>
<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/validateProduct.js"></script>

</head>
<body>
	<div class="form_content_2">
		<form id="updateCustomer"
			action="/amc/product.do?method=update" method="post"
			onsubmit="return validate();">
			<fieldset>
				<legend>更新产品信息</legend>
				<div class="form-row">
					<div class="field-label">
						<label for="field1">产品编号</label>
					</div>
					<div class="field-widget">
						<input name="pid" id="pid" class="detail" title="产品编号"
							value="${updateProduct.pid}" readonly="readonly" />
					</div>
					<div class="field-label">
						<label for="field1">产品名称</label>
					</div>
					<div class="field-widget">
						<input name="pname" id="pname" class="detail"
							title="产品名称" value="${updateProduct.pname}" />
					</div>
				</div>
				<div class="form-row">
					<div class="field-label">
						<label for="field1">产品规格</label>
					</div>
					<div class="shortfield-widget">
						<input name="psize" id="psize" class="shortdetail"
							title="产品规格" value="${updateProduct.psize}" />
					</div>
					<div class="field-label">
						<label for="field1">销售价格</label>
					</div>
					<div class="shortfield-widget">
						<input name="psaleprice" id="psaleprice" class="shortdetail"
							title="销售价格" value="${updateProduct.psaleprice}" />
					</div>
					<div class="field-label">
						<label for="field1">库&nbsp;存&nbsp;量</label>
					</div>
					<div class="shortfield-widget">
						<input name="pinventoryamount" id="pinventoryamount"
							class="shortdetail" title="库存量"
							value="${updateProduct.pinventoryamount}" />
					</div>
				</div>
				<div class="form-row">
					<div class="field-label">
						<label for="field1">产品重量</label>
					</div>
					<div class="shortfield-widget">
						<input name="pweight" id="pweight" class="shortdetail"
							title="产品重量" value="${updateProduct.pweight}" />
					</div>
					<div class="field-label">
						<label for="field1">采购价格</label>
					</div>
					<div class="shortfield-widget">
						<input name="ppurchaseprice" id="ppurchaseprice" class="shortdetail"
							title="采购价格" value="${updateProduct.ppurchaseprice}" />
					</div>
					<div class="field-label">
						<label for="field1">安全库存</label>
					</div>
					<div class="shortfield-widget">
						<input name="psafeamount" id="psafeamount" class="shortdetail"
							title="安全库存" value="${updateProduct.psafeamount}" />
					</div>
				</div>

				

			</fieldset>
			<input type="submit" class="submit" value="提交" />
		</form>
		<div style="height: 100px;"></div>
	</div>
</body>
</html>