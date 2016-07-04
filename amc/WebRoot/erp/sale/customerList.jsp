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
				 swal({   
				title: "正在删除!",   
				text: "稍等...",
				type:"success",    
				showConfirmButton: false
				});
				window.location.href="/amc/customer.do?method=delete&cid="+id;
			} else {
			}
		});
	}
</script>
</head>
<body>
	<div class="form_content_2">
		<fieldset>
			<legend>顾客列表</legend>
			<table class="bordered">
				<thead>

					<tr>
						<th>顾客编号</th>
						<th>顾客名</th>
						<th>联系方式</th>
						<th>顾客地址</th>
						<th>信誉等级</th>
						<th colspan="2">操作</th>
					</tr>
				</thead>
				<c:forEach items="${customerlist}" var="list">
					<tr>
						<td>${list.cid}</td>
						<td>${list.cname}</td>
						<td>${list.cphone}</td>
						<td>${list.caddress}</td>
						<td>${list.ccredit}</td>
						<td><a
							href="/amc/customer.do?method=updateForward&cid=${list.cid}">更新</a>
						</td>
						<td><a style="cursor: pointer;"
							onclick="confirmDelete(${list.cid});">删除</a>
						</td>
					</tr>
				</c:forEach>



			</table>
			<section class="section_pager">
			<ul class="pager">
				<li id="first"><a
					href="/amc/customer.do?method=list&pageNow=1&pageCount=${pageCount}">&laquo;
				</a>
				</li>
				<c:forEach var="i" begin="1" end="${pageCount}">
					<c:choose>
						<c:when test="${pageNow eq i }">
							<li id=""><a style="color: #f08300;"
								href="/amc/customer.do?method=list&pageNow=${i}&pageCount=${pageCount}">${i}</a>
							</li>
						</c:when>
						<c:otherwise>
							<li id=""><a
								href="/amc/customer.do?method=list&pageNow=${i}&pageCount=${pageCount}">${i}</a>
							</li>
						</c:otherwise>
					</c:choose>

				</c:forEach>
				<li id="last"><a
					href="/amc/customer.do?method=list&pageNow=${pageCount}&pageCount=${pageCount}">
						&raquo;</a>
				</li>
			</ul>
			</section>
		</fieldset>
	</div>

</body>
</html>