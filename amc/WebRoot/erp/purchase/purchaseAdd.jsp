<%@page import="com.amc.util.DateUtils"%>
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

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">


<link rel="stylesheet" href="<%=basePath%>css/table.css" type="text/css" />

<link rel="stylesheet" href="<%=basePath%>css/form_content.css"
	type="text/css"></link>
<link rel="stylesheet" href="<%=basePath%>css/sweetalert/sweetalert.css"
	type="text/css"></link>

<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/purchaseadd.js"></script>

<!-- 修改采购数量 -->
<script type="text/javascript">
$(document).ready(function() { 
	document.getElementById("totalMoney").value=getTotalMoney();
}); 

function modifyPurchase(number) {
	var id = "purchaseTotalAmount" + number;
	var purchaseTotalAmount = document.getElementById(id);
	var minId = "purchaseMinAmount" + number;
	var purchaseMinAmount = document.getElementById(minId);
	var price = "price" + number;
	var purchasePrice = document.getElementById(price);
	var totalPrice = "purchaseTotalPrice" + number;
	var purchaseTotalPrice = document.getElementById(totalPrice);
	
	var totalMoney = document.getElementById("totalMoney"); 
	
	swal({title: "采购订单",  
	     text: "请输入采购数量",   
	     type: "input",   
	     showCancelButton: true,   
	     closeOnConfirm: false,   
	     confirmButtonText: "确认",
	     cancelButtonText:"取消",
	     animation: "slide-from-top",   
	     inputPlaceholder: "最小采购量" + purchaseMinAmount.value, 
	 }, 
	     
	 function(inputValue){  
	    	 if (inputValue == false) {
	    		 return false;
	    	 }
	         if (inputValue == "") {    
	        	 swal.showInputError("采购量不能为0");
	        	 return false;  
	         }
	               
	         if(eval(inputValue) <= eval(purchaseMinAmount.value)){
	             swal.showInputError("最小采购量为" + purchaseMinAmount.value);
	             return false;
	         }                 
	         purchaseTotalAmount.innerHTML = inputValue;
	         purchaseTotalPrice.innerHTML = purchasePrice.innerHTML * purchaseTotalAmount.innerHTML;        
	         totalMoney.value = getTotalMoney();	
	         swal.close();
	       
	 });
	
}</script>

</head>
<body>
	<div class="form_content_2">
		<fieldset>
			<legend>采购订单填写</legend>
			<div class="form-row">
				<div class="field-label">
					<label for="field1">供应商编号</label>
				</div>
				<div class="field-widget">
					<input class="detail" name="" id="sid" readonly="readonly"
						onclick="showSupplierDiv()" />
				</div>
				<div class="field-label">
					<label for="field1">下&nbsp;单&nbsp;人&nbsp;员</label>
				</div>
				<div class="field-widget">
					<input class="detail" name="" id="uname" readonly="readonly"
						value="${user.name}" />
				</div>
			</div>
			<div class="form-row">
				<div class="field-label">
					<label for="field1">供应商名称</label>
				</div>
				<div class="field-widget">
					<input class="required" name="" id="sname" readonly="readonly" />
				</div>


			</div>
			<div class="form-row">
				<div class="field-label">
					<label for="field1">下&nbsp;单&nbsp;时&nbsp;间</label>
				</div>
				<div class="field-widget">
					<input type="date" class="detail" name="" id="ctime"
						value="<%=DateUtils.getCurrentDate("yyyy-MM-dd")%>" />
				</div>
				<div class="field-label">
					<label for="field1">订&nbsp;单&nbsp;金&nbsp;额</label>
				</div>
				<div class="field-widget">
					<input class="detail" name="" id="totalMoney" readonly="readonly"
						value="0.0" />
				</div>
			</div>

		</fieldset>
		<fieldset>
			<table class="bordered" id="purchaseDetailTable">
				<thead>

					<tr>
						<th>编号</th>
						<th>产品代码</th>
						<th>产品名称</th>
						<th>采购价格</th>
						<th>现有库存</th>
						<th>缺货数量</th>
						<th>安全库存</th>
						<th>采购数量</th>
						<th>价格总计</th>

					</tr>
					<c:forEach var="l" varStatus="i" items="${pods }">
						<tr>
							<td>${i.count}</td>
							<td>${l.amcProduct.pid}</td>
							<td>${l.amcProduct.pname}</td>
							<td><a id="price${i.count}">${l.purchaseprice}</a>
							</td>
							<td>${l.inventory}</td>
							<td>${l.stockamount}</td>
							<td>${l.safeamount}</td>
							<td><a id="purchaseTotalAmount${i.count}" type="text"
								style="text-decoration: underline;color: #f08300;cursor: pointer;"
								onclick="modifyPurchase(${i.count })">${l.totalamount}</a><input
								type="hidden" id="purchaseMinAmount${i.count}"
								value="${l.totalamount}">
							</td>
							<td><a id="purchaseTotalPrice${i.count}">${l.totalamount*l.purchaseprice}</a>
							</td>
						</tr>

					</c:forEach>


				</thead>

			</table>
		</fieldset>
		<input type="button" class="submit" value="提交"
			onclick="submitTableAndForm()" />
		<div style="height: 100px;"></div>

	</div>

	<!-- 准备显示的供应商表格  -->
	<div class="div_supplier" id="div_supplier"
		style="display: none;border-color: #D8DFEA;border-width: 1px;
		background-color: white;border-style: solid;top: 50px;left: 400px; 
		position: absolute; overflow: auto;height: 380px;width: 600px;">
		<table border="1" align="center" width="100%" height="100%"
			bordercolor="#ffeeaa" class="bordered">
			<!-- 显示所有供应商 -->
			<c:forEach var="c" items="${suppliers}">
				<tr ondblclick='setSupplier("${c.sid},${c.sname}")'>
					<td><a>${c.sid}</a>
					</td>
					<td><a>${c.sname}</a>
					</td>

				</tr>
			</c:forEach>



		</table>
	</div>


</body>
</html>