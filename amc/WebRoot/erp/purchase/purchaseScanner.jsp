<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			
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
			 title: "确认进行库存盘点？",  
			 text: "库存盘点预计约花10秒钟，请耐心等待", 
			 type: "info",  
			 animation: "slide-from-top",
			 showCancelButton: true,   
			 closeOnConfirm: false,
			 cancelButtonText:"否",  
			 confirmButtonText:"是",
			 showLoaderOnConfirm: true, 
			 }, function(){   
			$.ajax({ 
			type: "post",
			url: "/amc/task.do?", 
			dataType: "html", 
			async: true,
			beforeSend: function() { 
        		//请求前的处理 
        		//swal("正在扫描!","稍等","success");
   			 }, 
			success: function(data) {
				if(data==1){
					swal({   
						title: "盘点完成",      
						type: "success",   
						showCancelButton: false,   
						confirmButtonColor: "#DD6B55",   
						confirmButtonText: "ok",    
						closeOnConfirm: true,   		
						}, function(isConfirm){   
							if (isConfirm) {     
								// 关闭当前页
							    top.topManager.closePage();
							}   
						});				
				}	
					
			}, 			
			error: function() {
				
			}
		});	
		});
		
			
	});
</script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body></body>
</html>
