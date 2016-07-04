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
	function openaccountDetailPage(id){
		top.topManager.openPage({
			id : 'showaccountDetail'+id,
			href : '/amc/payable.do?method=showAccountDetail&pid='+id,
			title : '采购业务账详情'
		});
	}
</script>
</head>
<body>
	<div class="form_content_2">
		<fieldset>
			<legend>应收账款列表</legend>

			<table class="bordered">
				<thead>

					<tr>
						<th>账款编号</th>
						<th>订单编号</th>
						<th>总金额</th>
						<th>创建时间</th>								
						<th>操作</th>
					</tr>
					<c:forEach items="${accounts}" var="rl">
						<tr>
							<td>${rl.paid}</td>
							<td>${rl.amcPayable.amcPurchaseorder.poid}</td>
							<td>${rl.patotalaccount}</td>
							<td><fmt:formatDate value="${rl.pactime}"
									pattern="yyyy-MM-dd" />
							</td>																								
							<td><a onclick="openaccountDetailPage(${rl.paid})"
								style="cursor: pointer;">查看</a>
							</td>
						</tr>
					</c:forEach>



				</thead>




			</table>
			<section class="section_pager">
			<ul class="pager">
				<li id="first"><a
					href="/amc/payable.do?method=listaccount&pageNow=1&pageCount=${pageCount}">&laquo;
				</a></li>
				<c:forEach var="i" begin="1" end="${pageCount}">
					<c:choose>
						<c:when test="${pageNow eq i }">
							<li id=""><a style="color: #f08300;"
								href="/amc/payable.do?method=listaccount&pageNow=${i}&pageCount=${pageCount}">${i}</a>
							</li>
						</c:when>
						<c:otherwise>
							<li id=""><a
								href="/amc/payable.do?method=listaccount&pageNow=${i}&pageCount=${pageCount}">${i}</a>
							</li>
						</c:otherwise>
					</c:choose>

				</c:forEach>
				<li id="last"><a
					href="/amc/payable.do?method=listaccount&pageNow=${pageCount}&pageCount=${pageCount}">
						&raquo;</a></li>
			</ul>
			</section>
		</fieldset>
	</div>

</body>
</html>