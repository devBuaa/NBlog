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
	function confirmDelete(id) {
		swal({
			title : "确定删除编号为"+id+"的顾客?",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "确定",
			cancelButtonText : "取消",
			closeOnConfirm : false
		}, function(isConfirm) {
			if (isConfirm) {
				swal("正在删除!", "请稍后", "success");
				window.location.href="/amc/customer.do?method=delete&cid="+id;
			} else {
			}
		});
	}
	function openWantSlipDetailPage(id) {
		top.topManager.openPage({
			id : 'wantslipdetail'+id,
			href : '/amc/want.do?method=showDetail&wsid='+id,
			title : '缺货单填写'
		});
	}
</script>
</head>
<body>
	<div class="form_content_2">
		<fieldset>
			<legend>缺货单列表</legend>
			<table class="bordered">
				<thead>

					<tr>
						<th>缺货单编号</th>
						<th>订单编号</th>
						<th>创建时间</th>
						<th>截止日期</th>
						<th>处理人员</th>
						<th>处理状态</th>
						<th colspan="1">操作</th>
					</tr>
				</thead>
				<c:forEach items="${wantlist}" var="list">
					<tr>
						<td>${list.wsid}</td>
						<td>${list.amcSalesorder.soid}</td>
						<td><fmt:formatDate value="${list.wsctime}"
								pattern="yyyy-MM-dd" /></td>
						<td><fmt:formatDate value="${list.wsetime}"
								pattern="yyyy-MM-dd" /></td>
						<td>${list.amcUser.name}</td>
						<c:choose>
							<c:when test="${list.wsstate eq 2}">
								<td><a style="color: #f08300;">未采购</a></td>
							</c:when>
							<c:when test="${list.wsstate eq 1}">
								<td>采购中</td>
							</c:when>
							<c:otherwise>
								<td>已完成</td>
							</c:otherwise>
						</c:choose>

						<td><a style="cursor: pointer;"
							onclick="openWantSlipDetailPage(${list.wsid})">查看</a></td>
					</tr>
				</c:forEach>



			</table>
			<section class="section_pager">
			<ul class="pager">
				<li id="first"><a
					href="/amc/want.do?method=list&pageNow=1&pageCount=${pageCount}">&laquo;
						</a></li>
				<c:forEach var="i" begin="1" end="${pageCount}">
					<c:choose>
						<c:when test="${pageNow eq i }">
							<li id=""><a style="color: #f08300;"
								href="/amc/want.do?method=list&pageNow=${i}&pageCount=${pageCount}">${i}</a>
							</li>
						</c:when>
						<c:otherwise>
							<li id=""><a
								href="/amc/want.do?method=list&pageNow=${i}&pageCount=${pageCount}">${i}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<li id="last"><a
					href="/amc/want.do?method=list&pageNow=${pageCount}&pageCount=${pageCount}">
						&raquo;</a></li>
			</ul>
			</section>
		</fieldset>
	</div>

</body>
</html>