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
	String id = "";
	
	String iden = (String) request.getParameter("id");
	if (iden.equals("adduser")) {
		id = "userlist";
	}
	else if(iden.equals("addStockOK")){
		id = "orderList";
		
	}
	else if(iden.equals("addCustomerOK")){
		id = "customerList";
	}
	else if(iden.equals("addSupplierOK")){
		id = "supplierList";
	}
	else if(iden.equals("addProductOK")){
		id = "productList";
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<link rel="stylesheet" href="<%=basePath%>css/sweetalert/sweetalert.css"
	type="text/css"></link>

<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
		// 刷新
		jQuery(document).ready( function () { 
			swal({
			   title: "添加成功!", 
			   type:"success",   
			   animation: "slide-from-top",
			   showConfirmButton: true }, 
			   function(){
			      setTimeout(function(){     
			      top.topManager.closePage();
				  top.topManager.reloadPage('<%=id%>');  
			      }, 100);});
			
	});
</script>


</head>

<body></body>
</html>
