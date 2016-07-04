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
	function openAccountDetailPage(id){
		top.topManager.openPage({
			id : 'showSaleAccountDetail'+id,
			href : '/amc/receivable.do?method=showAccountDetail&rid='+id,
			title : '详情'
		});
	}
</script>
</head>
<body>
	<div class="form_content_2">
		<fieldset>
			<legend>销售业务账列表</legend>

			<table class="bordered">
				<thead>

					<tr>
						<th>账款编号</th>
						<th>订单编号</th>
						<th>总金额</th>
						<th>创建时间</th>				
						<th>操作</th>
					</tr>
					<c:forEach items="${saleaccounts}" var="rl">
						<tr>
							<td>${rl.said}</td>
							<td>${rl.amcReceivable.amcSalesorder.soid}</td>
							<td>${rl.satotalaccount}</td>
							<td><fmt:formatDate value="${rl.sactime}"
									pattern="yyyy-MM-dd" />
							</td>																						
							<td><a onclick="openAccountDetailPage(${rl.said})"
								style="cursor: pointer;">查看</a>
							</td>
						</tr>
					</c:forEach>



				</thead>




			</table>
			<section class="section_pager">
			<ul class="pager">
				<li id="first"><a
					href="/amc/receivable.do?method=listaccount&pageNow=1&pageCount=${pageCount}">&laquo;
				</a></li>
				<c:forEach var="i" begin="1" end="${pageCount}">
					<c:choose>
						<c:when test="${pageNow eq i }">
							<li id=""><a style="color: #f08300;"
								href="/amc/receivable.do?method=listaccount&pageNow=${i}&pageCount=${pageCount}">${i}</a>
							</li>
						</c:when>
						<c:otherwise>
							<li id=""><a
								href="/amc/receivable.do?method=listaccount&pageNow=${i}&pageCount=${pageCount}">${i}</a>
							</li>
						</c:otherwise>
					</c:choose>

				</c:forEach>
				<li id="last"><a
					href="/amc/receivable.do?method=listaccount&pageNow=${pageCount}&pageCount=${pageCount}">
						&raquo;</a></li>
			</ul>
			</section>
		</fieldset>
	</div>

</body>
</html>