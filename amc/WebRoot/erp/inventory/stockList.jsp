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
<title></title>
<link rel="stylesheet" href="<%=basePath%>css/form_content.css"
	type="text/css"></link>
<link rel="stylesheet" href="<%=basePath%>css/table.css" type="text/css"></link>
<link rel="stylesheet" href="<%=basePath%>css/pager.css" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>css/sweetalert/sweetalert.css"
	type="text/css"></link>
<script type="text/javascript" src="<%=basePath%>js/prefixfree.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
	function openStockDetailPage(id){
		top.topManager.openPage({
			id : 'showStockDetail'+id,
			href : '/amc/stock.do?method=showDetail&stoid='+id,
			title : '备货单详情'
		});
	}
</script>
</head>
<body>
	<div class="form_content_2">
		<fieldset>
			<legend>备货单列表</legend>
			<table class="bordered">
				<thead>

					<tr>
						<th>备货单编号</th>
						<th>订单编号</th>
						<th>创建日期</th>
						<th>处理人员</th>
						<th>处理状态</th>
						<th colspan="1">操作</th>
					</tr>
				</thead>
				<c:forEach items="${stockList}" var="list">
					<tr>
						<td>${list.stoid}</td>
						<td>${list.amcSalesorder.soid}</td>
						<td><fmt:formatDate value="${list.stoctime}"
								pattern="yyyy-MM-dd" /></td>
						<td>${list.amcUser.name}</td>
						<td><c:choose>
								<c:when test="${list.stostate eq 0}">已处理</c:when>
								<c:when test="${list.stostate eq 1}"><a style="color: #f08300;">正在处理</a></c:when>
								<c:otherwise>未处理</c:otherwise>
							</c:choose></td>
						<td><a onclick="openStockDetailPage(${list.stoid});"
							style="cursor: pointer;">查看</a></td>

					</tr>
				</c:forEach>



			</table>
			<section class="section_pager">
			<ul class="pager">
				<li id="first"><a
					href="/amc/stock.do?method=list&pageNow=1&pageCount=${pageCount}">&laquo;
						</a></li>
				<c:forEach var="i" begin="1" end="${pageCount}">
					<c:choose>
						<c:when test="${pageNow eq i }">
							<li id=""><a style="color: #f08300;"
								href="/amc/stock.do?method=list&pageNow=${i}&pageCount=${pageCount}">${i}</a>
							</li>
						</c:when>
						<c:otherwise>
							<li id=""><a
								href="/amc/stock.do?method=list&pageNow=${i}&pageCount=${pageCount}">${i}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<li id="last"><a
					href="/amc/stock.do?method=list&pageNow=${pageCount}&pageCount=${pageCount}">
						&raquo;</a></li>
			</ul>
			</section>
		</fieldset>
	</div>

</body>
</html>