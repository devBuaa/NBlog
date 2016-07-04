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
		<form id="addProduct"
			action="/amc/product.do?method=add" method="post">
			<fieldset>
				<legend>新增产品</legend>
				<div class="form-row">
					<div class="field-label">
						<label for="field1">产品编号</label>
					</div>
					<div class="field-widget">
						<input name="pid" id="pid" class="detail" title="请按照产品编码格式输入"
							value=""  />
					</div>
					<div class="field-label">
						<label for="field1">产品名称</label>
					</div>
					<div class="field-widget">
						<input name="pname" id="pname" class="detail"
							title="请输入产品名称" value="" />
					</div>
				</div>
				
				<div class="form-row">
					<div class="field-label">
						<label for="field1">产品规格</label>
					</div>
					<div class="field-widget">
						<input name="psize" id="psize" class="detail"
							title="请输入产品规格" value="" />
					</div>
					<div class="field-label">
						<label for="field1">产品重量</label>
					</div>
					<div class="field-widget">
						<input name="pweight" id="pweight" class="detail"
							title="请输入产品重量（Kg）" value="" />
					</div>
				</div>
				
				<div class="form-row">
					<div class="field-label">
						<label for="field1">销售价格</label>
					</div>
					<div class="field-widget">
						<input name="psaleprice" id="psaleprice" class="detail"
							title="请输入销售价格（元）" value="" />
					</div>
					<div class="field-label">
						<label for="field1">采购价格</label>
					</div>
					<div class="field-widget">
						<input name="ppurchaseprice" id="ppurchaseprice" class="detail"
							title="请输入采购价格（元）" value="" />
					</div>
				</div>
				
				<div class="form-row">
					<div class="field-label">
						<label for="field1">库&nbsp;&nbsp;存&nbsp;&nbsp;量</label>
					</div>
					<div class="field-widget">
						<input name="pinventoryamount" id="pinventoryamount"
							class="detail" title="请输入现有库存量"
							value="0" />
					</div>
					<div class="field-label">
						<label for="field1">安全库存</label>
					</div>
					<div class="field-widget">
						<input name="psafeamount" id="psafeamount" class="detail"
							title="请输入安全库存量" value="" />
					</div>
				</div>
				

			</fieldset>
			<input type="button" class="submit" value="提交" onclick="validateAdd()"/>
		</form>
	</div>
</body>
</html>