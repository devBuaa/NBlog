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
<link rel="stylesheet" href="<%=basePath%>css/pop.css" type="text/css"></link>
<script type="text/javascript" src="<%=basePath%>js/prefixfree.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
	function updateState(id) {
			$.ajax({ 
			type: "post",
			url: "/amc/purchase.do?method=updateState&poid="+id, 
			dataType: "html", 
			async: true,
			beforeSend: function() { 
        		//请求前的处理 
				swal({   
					title: "正在更新!",   
					text: "稍等...",
					type:"success",    
					showConfirmButton: false
				});
   			 }, 		
			success: function(data) {
				if(data==1){					
					// 刷新当前页
					top.topManager.reloadPage();									
				}
			}, 			
			error: function() {
				
			}
		});	
	}
	function openPurchaseDetailPage(id) {
		top.topManager.openPage({
			id : 'purchasedetail'+id,
			href : '/amc/purchase.do?method=showDetail&poid='+id,
			title : '采购单明细'
		});
	}
</script>
</head>
<body>
	<div class="form_content_2">
		<fieldset>
			<legend>采购订单列表</legend>
			<table class="bordered">
				<thead>

					<tr>
						<th>订单编号</th>
						<th>供应商名称</th>
						<th>创建日期</th>						
						<th>开单人员</th>
						<th>采购状态</th>
						<th colspan="2">操作</th>
					</tr>
				</thead>
				<c:forEach items="${polist}" var="list">
					<tr>
						<td>${list.poid}</td>
						<td>${list.amcSupplier.sname}</td>
						<td><fmt:formatDate value="${list.poctime}"
									pattern="yyyy-MM-dd" /></td>
						<td>${list.amcUser.name}</td>
						<c:choose>
						<c:when test="${list.postate eq 2}">
						<td><a style="color: #f08300;">未发货</a></td>
						<td>
							<a style="cursor: pointer;"
							onclick="openPurchaseDetailPage(${list.poid})">查看</a>
						</td>
						<td>
							<a style="cursor: pointer;"
							onclick="updateState(${list.poid})">更新</a>
						</td>
						</c:when>
						<c:when test="${list.postate eq 1}">
						<td>发货中</td>
						<td colspan="2">
							<a style="cursor: pointer;" 
							onclick="openPurchaseDetailPage(${list.poid})">查看</a>
						</td>
						
						</c:when>
						<c:otherwise>
						<td>已收货</td>
						<td colspan="2">
							<a style="cursor: pointer;" 
							onclick="openPurchaseDetailPage(${list.poid})">查看</a>
						</td>
						
						</c:otherwise>
						</c:choose>
						
					</tr>
				</c:forEach>



			</table>
			<section class="section_pager">
			<ul class="pager">
				<li id="first"><a
					href="/amc/purchase.do?method=list&pageNow=1&pageCount=${pageCount}">&laquo;
				</a>
				</li>
				<c:forEach var="i" begin="1" end="${pageCount}">
					<c:choose>
						<c:when test="${pageNow eq i}">
							<li id=""><a style="color: #f08300;"
								href="/amc/purchase.do?method=list&pageNow=${i}&pageCount=${pageCount}">${i}</a>
							</li>
						</c:when>
						<c:otherwise>
							<li id=""><a
								href="/amc/purchase.do?method=list&pageNow=${i}&pageCount=${pageCount}">${i}</a>
							</li>
						</c:otherwise>
					</c:choose>

				</c:forEach>
				<li id="last"><a
					href="/amc/purchase.do?method=list&pageNow=${pageCount}&pageCount=${pageCount}">
						&raquo;</a>
				</li>
			</ul>
			</section>
		</fieldset>
		
	</div>
</body>
</html>