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
	function openReplenishDetailPage(id) {
		top.topManager.openPage({
			id : 'showReplenishDetail' + id,
			href : '/amc/replenish.do?method=showDetail&rid=' + id,
			title : '到货单详情'
		});
	}
	function confirmReplenish(id) {
		swal({
			title : "确定收到货物?",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "确定",
			cancelButtonText : "取消",
			closeOnConfirm : false
		}, function(isConfirm) {
			if (isConfirm) {
			
				//swal("正在处理","请稍等","success");
				swal({   title: "正在处理!",   text: "请稍等...",type:"success",    showConfirmButton: false });
				
				window.location.href="/amc/replenish.do?method=complete&rid="+id;
			} else {
			}
		});
	}
</script>
</head>
<body>
	<div class="form_content_2">
		<fieldset>
			<legend>到货单列表</legend>
			<table class="bordered">
				<thead>

					<tr>
						<th>到货单编号</th>
						<th>到达日期</th>
						<th>处理状态</th>
						<th colspan="2">操作</th>
					</tr>
				</thead>
				<c:forEach items="${rlist}" var="list">
					<tr>
						<td>${list.rid}</td>
						<td><fmt:formatDate value="${list.rarrivaltime}"
								pattern="yyyy-MM-dd" /></td>
						<c:choose>
							<c:when test="${list.rstate eq 0}">

								<td>已处理</td>
								<td colspan="2" style="cursor: pointer;" onclick="openReplenishDetailPage(${list.rid})">查看</td>

							</c:when>
							<c:otherwise>
								<td><a style="color: #f08300;">未处理</a></td>
								<td style="cursor: pointer;" onclick="openReplenishDetailPage(${list.rid})">查看</td>
								<td style="cursor: pointer;" onclick="confirmReplenish(${list.rid})"><a style="color: #f08300;">确认收货</a></td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</table>
			<section class="section_pager">
			<ul class="pager">
				<li id="first"><a
					href="/amc/replenish.do?method=list&pageNow=1&pageCount=${pageCount}">&laquo;
				</a>
				</li>
				<c:forEach var="i" begin="1" end="${pageCount}">
					<c:choose>
						<c:when test="${pageNow eq i }">
							<li id=""><a style="color: #f08300;"
								href="/amc/replenish.do?method=list&pageNow=${i}&pageCount=${pageCount}">${i}</a>
							</li>
						</c:when>
						<c:otherwise>
							<li id=""><a
								href="/amc/replenish.do?method=list&pageNow=${i}&pageCount=${pageCount}">${i}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<li id="last"><a
					href="/amc/replenish.do?method=list&pageNow=${pageCount}&pageCount=${pageCount}">
						&raquo;</a>
				</li>
			</ul>
			</section>
		</fieldset>
	</div>
	

</body>
</html>