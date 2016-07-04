<%@page import="com.amc.domain.AmcUser"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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


<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">


<link rel="stylesheet" href="<%=basePath%>css/table.css" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>css/pager.css" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>css/form_content.css"
	type="text/css"></link>
<link rel="stylesheet" href="<%=basePath%>css/sweetalert/sweetalert.css"
	type="text/css"></link>
<script type="text/javascript" src="<%=basePath%>js/prefixfree.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
	function confirmDelete(id) {
		if(id=="1"){
		    swal("不能删除admin","你想干嘛？","error");
		    return;
		}
		swal({
			title : "确定删除编号为"+id+"的用户?",
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
				window.location.href="/amc/user.do?method=delete&uid="+id;
			} else {
			}
		});
	}
</script>
</head>
<body>
	<div class="form_content_2">
		<fieldset>
			<legend>用户列表</legend>
			<table class="bordered">
				<thead>

					<tr>
						<th>用户编号</th>
						<th>用户名</th>
						<th>用户角色</th>
						<th>所在部门</th>
						<th colspan="2">操作</th>
					</tr>
				</thead>
				<c:forEach items="${userlist}" var="list">
					<tr>
						<td>${list.id}</td>
						<td>${list.name}</td>
						<td>${list.amcRole.name}</td>
						<td>${list.amcDepartment.name}</td>
						<td><a
							href="/amc/user.do?method=updateForward&uid=${list.id}">修改</a></td>
						<td><a style="cursor: pointer;"
							onclick="confirmDelete(${list.id});">删除</a></td>
					</tr>
				</c:forEach>



			</table>
			<section class="section_pager">
			<ul class="pager">
				<li id="first"><a
					href="/amc/user.do?method=list&pageNow=1&pageCount=${pageCount}">&laquo;
				</a></li>
				<c:forEach var="i" begin="1" end="${pageCount}">
					<c:choose>
						<c:when test="${pageNow eq i}">
							<li><a style="color: #f08300;"
								href="/amc/user.do?method=list&pageNow=${i}&pageCount=${pageCount}">${i}</a>
							</li>
						</c:when>
						<c:otherwise>
							<li><a
								href="/amc/user.do?method=list&pageNow=${i}&pageCount=${pageCount}">${i}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<li id="last"><a
					href="/amc/user.do?method=list&pageNow=${pageCount}&pageCount=${pageCount}">
						&raquo;</a></li>
			</ul>
			</section>
		</fieldset>
	</div>
</body>
</html>
