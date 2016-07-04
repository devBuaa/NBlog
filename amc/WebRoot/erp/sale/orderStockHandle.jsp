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
	String soid = request.getParameter("soid");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=basePath%>css/form_content.css"
	type="text/css"></link>
<title></title>
</head>
<body>
	<div class="form_content_2">
		<form id="addStockOrder"
			action="/amc/stock.do?method=add&soid=<%=soid%>"
			method="post">
			<fieldset>
				<legend>备货单</legend>
				<div class="form-row">
					<div class="field-label">
						<label for="field1">订单编号</label>:
					</div>
					<div class="field-widget">
						<input class="detail" readonly="readonly" value="<%=soid%>" />
					</div>
				</div>
				<div class="form-row">
					<div class="field-label">
						<label for="field1">开单人员</label>:
					</div>
					<div class="field-widget">
						<input class="detail" readonly="readonly" value="${user.name}" />
					</div>
				</div>
				<div class="form-row">
					<div class="field-label">
						<label for="field1">开单时间</label>:
					</div>
					<div class="field-widget">
						<input class="detail" readonly="readonly"
							value="<%=DateUtils.getCurrentDate("yyyy-MM-dd")%>" />
					</div>
				</div>

			</fieldset>
			<input type="submit" class="submit" value="提交" />
		</form>
	</div>
</body>
</html>