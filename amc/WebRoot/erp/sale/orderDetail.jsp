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
<link rel="stylesheet" href="<%=basePath%>css/form_content.css"
	type="text/css"></link>
<link rel="stylesheet" href="<%=basePath%>css/table.css" type="text/css"></link>
<link rel="stylesheet" href="<%=basePath%>css/sweetalert/sweetalert.css"
	type="text/css"></link>

<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/sweetalert/sweetalert.min.js"></script>
<title></title>
<script type="text/javascript">
 var totalPrice = 0.0;
  <c:forEach items="${salesOrderDetail}" var="sod">
     totalPrice=totalPrice+eval("${sod.sodamount}")*eval("${sod.amcProduct.psaleprice}");
     
  </c:forEach>
	 
  $(document).ready(function(){
    $("#totalProductPrice").val(totalPrice);
  });
	function deleteOrder() {
		//确认是否删除，是跳转到window.location.href = '/amc/salesOrder.do?method=delete&soid=${salesorder.soid}';
		swal({
			title : "确定删除该订单?",
			type : "warning",
			showCancelButton : true,
			confirmButtonColor : "#DD6B55",
			confirmButtonText : "确定",
			cancelButtonText : "取消",
			closeOnConfirm : false
		}, function(isConfirm) {
			if (isConfirm) {
				swal({   title: "正在删除!",   text: "请稍等",type:"success",    showConfirmButton: false });
				submitDelete();
			} else {
			}
		});
	}
	function openStockPage(id) {
		
		top.topManager.openPage({
			id : 'orderStockHandle'+id,
			isClose : true,
			href : 'erp/sale/orderStockHandle.jsp?soid='+id,
			title : '备货单填写'
		});
	}
	function submitDelete() {
		$.ajax({ 
			type: "post",
			url: "/amc/salesOrder.do?method=delete&soid=${salesorder.soid}", 
			dataType: "html", 
			async: true,
			 beforeSend: function() { 
        		//请求前的处理 
        		swal("正在删除!","稍等","warning");
   			 }, 
			success: function(date) {
				if(date==-1){
					swal("订单已完成!","无法删除","error");
				}else if(date==1){
					top.topManager.reloadPage('orderList');
					top.topManager.closePage();					
				} 
			}, 			
			error: function() {
				
			}
		});

    }
</script>

</head>
<body>
	<div class="form_content_2">
		<fieldset>
			<legend>订单详情</legend>
			<div class="form-row">
				<div class="field-label">
					<label for="field1">订单编号</label>
				</div>
				<div class="shortfield-widget">
					<input class="shortdetail" readonly="readonly"
						value="${salesorder.soid}" />
				</div>
				<div class="field-label">
					<label for="field1">销&nbsp;&nbsp;售&nbsp;&nbsp;员</label>
				</div>
				<div class="shortfield-widget">
					<input class="shortdetail" readonly="readonly"
						value="${salesorder.amcUser.name}" />
				</div>
				<div class="field-label">
					<label for="field1">订单金额</label>
				</div>
				<div class="shortfield-widget">
					<input class="shortdetail" readonly="readonly" value="" id="totalProductPrice" />
				</div>
			</div>
			<div class="form-row">
				<div class="field-label">
					<label for="field1">顾客编号</label>
				</div>
				<div class="shortfield-widget">
					<input class="shortdetail" readonly="readonly"
						value="${salesorder.amcCustomer.cid}" />
				</div>
				<div class="field-label">
					<label for="field1">顾客名称</label>
				</div>
				<div class="shortfield-widget">
					<input class="shortdetail" readonly="readonly"
						value="${salesorder.amcCustomer.cname}" />
				</div>
				<div class="field-label">
					<label for="field1">下单时间</label>
				</div>
				<div class="shortfield-widget">
					<input class="shortdetail" readonly="readonly"
						value="<fmt:formatDate value='${salesorder.soctime}' pattern='yyyy-MM-dd'/>" />
				</div>
				
			</div>
			<div class="form-row">
				<div class="field-label">
					<label for="field1">收&nbsp;&nbsp;货&nbsp;&nbsp;人</label>
				</div>
				<div class="shortfield-widget">
					<input class="shortdetail" readonly="readonly"
						value="${salesorder.soReceivePerson}" />
				</div>
				<div class="field-label">
					<label for="field1">联系电话</label>
				</div>
				<div class="shortfield-widget">
					<input class="shortdetail" readonly="readonly"
						value="${salesorder.amcCustomer.cphone}" />
				</div>
				
                <div class="field-label">
					<label for="field1">备用电话</label>
				</div>
				<div class="shortfield-widget">
					<input class="shortdetail" readonly="readonly"
						value="${salesorder.amcCustomer.cphone}" />
				</div>
				
			</div>
			<div class="form-row">
				<div class="field-label">
					<label for="field1">收货地址</label>
				</div>
				<div class="field-widget">
					<input class="shortrequired" readonly="readonly"
						value="${salesorder.soaddress}" />
				</div>
			</div>
			
		</fieldset>
		<fieldset>
			<legend>销售清单</legend>
			<table class="bordered">
				<thead>

					<tr>
						<th>产品代码</th>
						<th>产品名称</th>
						<th>订购数量</th>
						<th>价格</th>
						<th>总计</th>
					</tr>
					<c:forEach items="${salesOrderDetail}" var="sod">
						<tr>
							<td>${sod.amcProduct.pid}</td>
							<td>${sod.amcProduct.pname}</td>
							<td>${sod.sodamount}</td>
							<td>${sod.amcProduct.psaleprice}</td>
							<td>${sod.sodamount*sod.amcProduct.psaleprice}</td>
						</tr>
					</c:forEach>
				</thead>
			</table>
		</fieldset>
		<c:if test="${salesorder.sostate ne 0}">
			<fieldset>
				<legend>订单处理</legend>
	 			<input type="button" value="删除订单" class="button1"
					onclick="deleteOrder();" />
				<c:if test="${salesorder.sostate eq 2}">
					<input type="button" value="填写备货单" class="button2"
						onclick="openStockPage(${salesorder.soid});" />
				</c:if>

			</fieldset>

		</c:if>
		
	</div>
</body>
</html>