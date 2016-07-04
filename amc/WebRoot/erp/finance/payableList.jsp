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

<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/prefixfree.min.js"></script>
<script type="text/javascript">
	function openPayableDetailPage(id){
		top.topManager.openPage({
			id : 'showPayableDetail'+id,
			href : '/amc/payable.do?method=showDetail&pid='+id,
			title : '应付账款详情'
		});
	}
</script>

<script type="text/javascript">
    function confirmPay(id){
    
			swal({   
			title: "确认付款？",   
			text: "此操作无法撤销 请确认收到货物后确认!",   
			type: "warning",   
			showCancelButton: true,   
			confirmButtonColor: "#DD6B55",   
			confirmButtonText: "是",   
			cancelButtonText: "否",   
			closeOnConfirm: false,   
			closeOnCancel: true 
			}, function(isConfirm){   
			if (isConfirm) {     
			window.location.href="/amc/payable.do?method=updateState&pid="+id;   
  			 swal({   
				title: "正在更新!",   
				text: "稍等...",
				type:"success",    
				showConfirmButton: false
			});
			}
			 });
	}
</script>

</head>
<body>
	<div class="form_content_2">
		<fieldset>
			<legend>应付账款列表</legend>

			<table class="bordered">
				<thead>

					<tr>
						<th>账款编号</th>
						<th>订单编号</th>
						<th>总金额</th>			
						<th>创建时间</th>
						<th>付款期限</th>
						<th>状态</th>
						<th colspan="2">操作</th>
					</tr>
					<c:forEach items="${plist}" var="rl">
						<tr>
							<td>${rl.payid}</td>
							<td>${rl.amcPurchaseorder.poid}</td>
							<td>${rl.paytotalaccount}</td>
							<td><fmt:formatDate value="${rl.payctime}"
									pattern="yyyy-MM-dd" />
							</td>
							<td><fmt:formatDate value="${rl.paydate}"
									pattern="yyyy-MM-dd" />
							</td>												
							<c:choose>												
							<c:when test="${rl.paystate eq 1 }">						
							<td><a style="color: #f08300;">未付款</a></td>
							<td><a style="cursor: pointer;" onclick="confirmPay(${rl.payid})";>付款</a>
							</td>
							</c:when>
							<c:otherwise>							
							<td>已付款</td>
							<td><a></a>
							</td>
							</c:otherwise>
							</c:choose>							
							<td><a onclick="openPayableDetailPage(${rl.payid})"
								style="cursor: pointer;">查看</a>
							</td>
						</tr>
					</c:forEach>



				</thead>




			</table>
			<section class="section_pager">
			<ul class="pager">
				<li id="first"><a
					href="/amc/payable.do?method=list&pageNow=1&pageCount=${pageCount}">&laquo;
				</a></li>
				<c:forEach var="i" begin="1" end="${pageCount}">
					<c:choose>
						<c:when test="${pageNow eq i }">
							<li id=""><a style="color: #f08300;"
								href="/amc/payable.do?method=list&pageNow=${i}&pageCount=${pageCount}">${i}</a>
							</li>
						</c:when>
						<c:otherwise>
							<li id=""><a
								href="/amc/payable.do?method=list&pageNow=${i}&pageCount=${pageCount}">${i}</a>
							</li>
						</c:otherwise>
					</c:choose>

				</c:forEach>
				<li id="last"><a
					href="/amc/payable.do?method=list&pageNow=${pageCount}&pageCount=${pageCount}">
						&raquo;</a></li>
			</ul>
			</section>
		</fieldset>
	</div>

</body>
</html>