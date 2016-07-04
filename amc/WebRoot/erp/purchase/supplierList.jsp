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
			title : "确定删除编号为"+id+"的供应商吗?",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "确定",
			cancelButtonText : "取消",
			closeOnConfirm : false
		}, function(isConfirm) {
			if (isConfirm) {
				swal({   title: "正在删除!",   text: "请稍等",type:"success",    showConfirmButton: false });
				window.location.href="/amc/supplier.do?method=delete&sid="+id;
			} else {
			}
		});
	}
</script>
</head>
<body>
	<div class="form_content_2">
		<fieldset>
			<legend>供应商列表</legend>
			<table class="bordered">
				<thead>

					<tr>

						<th width="5%">编号</th>
						<th width="20%">供应商名称</th>
						<th width="30%">供应商地址</th>
						<th width="12%">联系电话</th>
						<th width="10%">电子邮件</th>
						<th width="10%">联系人</th>
						<th colspan="2" width="14%">操作</th>

					</tr>
				</thead>
				<c:forEach items="${supplierlist}" var="list">
					<tr>
						<td>${list.sid}</td>
						<td>${list.sname}</td>
						<td>${list.saddress}</td>
						<td>${list.sphone}</td>
						<td>${list.semail}</td>
						<td>${list.scontactPerson}</td>
						<td><a
							href="/amc/supplier.do?method=updateForward&sid=${list.sid}">更新</a>
						</td>
						<td><a style="cursor: pointer;"
							onclick="confirmDelete(${list.sid})">删除</a>
						</td>
					</tr>
				</c:forEach>



			</table>
			<section class="section_pager">
			<ul class="pager">
				<li id="first"><a
					href="/amc/supplier.do?method=list&pageNow=1&pageCount=${pageCount}">&laquo;
				</a>
				</li>
				<c:forEach var="i" begin="1" end="${pageCount}">
					<c:choose>
						<c:when test="${pageNow eq i}">
							<li id=""><a style="color: #f08300;"
								href="/amc/supplier.do?method=list&pageNow=${i}&pageCount=${pageCount}">${i}</a>
							</li>
						</c:when>
						<c:otherwise>
							<li id=""><a
								href="/amc/supplier.do?method=list&pageNow=${i}&pageCount=${pageCount}">${i}</a>
							</li>
						</c:otherwise>
					</c:choose>

				</c:forEach>
				<li id="last"><a
					href="/amc/supplier.do?method=list&pageNow=${pageCount}&pageCount=${pageCount}">
						&raquo;</a>
				</li>
			</ul>
			</section>
		</fieldset>
	</div>

</body>
</html>