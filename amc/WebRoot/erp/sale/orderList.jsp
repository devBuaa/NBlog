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
<link rel="stylesheet" href="<%=basePath%>css/table.css"
	type="text/css"></link>
<link rel="stylesheet" href="<%=basePath%>css/pager.css" type="text/css" />
<script type="text/javascript" src="<%=basePath%>js/prefixfree.min.js"></script>
<script type="text/javascript">
	function openOrderDetailPage(id){
		top.topManager.openPage({
			id : 'showSalesOrderDetail'+id,
			href : '/amc/salesOrder.do?method=showDetail&soid='+id,
			title : '订单详情'
		});
	}
</script>
</head>
<body>
	<div class="form_content_2">
		<fieldset>
			<legend>订单列表</legend>

			<table class="bordered">
				<thead>

					<tr>
						<th>订单编号</th>
						<th>顾客姓名</th>
						<th>下单时间</th>
						<th>下单人员</th>
						<th>订单状态</th>
						<th colspan="1">操作</th>
					</tr>
					<c:forEach items="${salesorders}" var="order">
						<tr>
							<td>${order.soid}</td>
							<td>${order.amcCustomer.cname}</td>
							<td><fmt:formatDate value="${order.soctime}"
									pattern="yyyy-MM-dd" />
							</td>
							<td>${order.amcUser.name}</td>
							<td><c:choose>
									<c:when test="${order.sostate eq 0}">已处理</c:when>
									<c:when test="${order.sostate eq 1}">正在处理</c:when>
									<c:otherwise><a style="color: #f08300;">未处理</a></c:otherwise>
								</c:choose></td>
							<td><a onclick="openOrderDetailPage(${order.soid});"
								style="cursor: pointer;">查看</a>
							</td>
						</tr>
					</c:forEach>



				</thead>




			</table>
			<section class="section_pager">
			<ul class="pager">
				<li id="first"><a
					href="/amc/salesOrder.do?method=list&pageNow=1&pageCount=${pageCount}">&laquo;
						</a></li>
				<c:forEach var="i" begin="1" end="${pageCount}">
					<c:choose>
						<c:when test="${pageNow eq i }">
							<li id=""><a style="color: #f08300;"
								href="/amc/salesOrder.do?method=list&pageNow=${i}&pageCount=${pageCount}">${i}</a>
							</li>
						</c:when>
						<c:otherwise>
							<li id=""><a
								href="/amc/salesOrder.do?method=list&pageNow=${i}&pageCount=${pageCount}">${i}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<li id="last"><a
					href="/amc/salesOrder.do?method=list&pageNow=${pageCount}&pageCount=${pageCount}">
						&raquo;</a></li>
			</ul>
			</section>
		</fieldset>
	</div>

</body>
</html>