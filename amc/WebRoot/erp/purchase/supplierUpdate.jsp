<%@page import="com.amc.domain.AmcUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" href="<%=basePath%>css/form_content.css"
	type="text/css"></link>
<link rel="stylesheet" href="<%=basePath%>css/sweetalert/sweetalert.css"
	type="text/css"></link>
<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/valiBasic.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">	
	function validateSupplier(){
	 sname=document.getElementById("sname").value;
	 sphone=document.getElementById("sphone").value;
	 saddress=document.getElementById("saddress").value;
	 scontactPerson=document.getElementById("scontactPerson").value;
	 semail=document.getElementById("semail").value;
	 if(isNull(sname)){
	 	swal("请输入供应商名称!","","warning");
	 	return false;
	 }
	  if(isNull(sphone) || !checkTel(sphone)){
	 	swal("请输入有效的手机号码!","","warning");
	 	return false;
	 }
	 if(isNull(saddress)){
	 	swal("请输入地址!","","warning");
	 	return false;
	 }
	 if(isNull(scontactPerson)){
	 	swal("联系人不可为空!","","warning");
	 	return false;
	 }
	  if(!isNull(semail) && !checkEmail(semail)){
	 	swal("请输入有效的邮箱地址!","","warning");
	 	return false;
	 }
	 swal({   title: "正在添加!",   text: "请稍等",type:"success",    showConfirmButton: false });
	 return true;
	
}
</script>

</head>
<body>
	<div class="form_content_3">
		<form id="addCustomer"
			action="/amc/supplier.do?method=update"
			method="post" onsubmit="return validateSupplier();">
			<fieldset>
				<legend>更新供应商信息</legend>
				<div class="form-row">
					<div class="field-label">
						<label for="field1">供应商编号</label>
					</div>
					<div class="field-widget">
						<input name="sid" id="sid" class="detail" title="" readonly="readonly"
							value="${updateSupplier.sid}"/>
					</div>
					<div class="field-label">
						<label for="field1">联&nbsp;&nbsp;&nbsp;系&nbsp;&nbsp;&nbsp;人</label>
					</div>
					<div class="field-widget">
						<input name="scontactPerson" id="scontactPerson" class="detail"
							title="联系人" value="${updateSupplier.scontactPerson}"/>
					</div>
				</div>
				<div class="form-row">
					<div class="field-label">
						<label for="field1">联&nbsp;系&nbsp;电&nbsp;话</label>
					</div>
					<div class="field-widget">
						<input name="sphone" id="sphone" class="detail"
							title="电话" value="${updateSupplier.sphone}"/>
					</div>
					<div class="field-label">
						<label for="field1">电&nbsp;子&nbsp;邮&nbsp;箱</label>
					</div>
					<div class="field-widget">
						<input name="semail" id="semail" class="detail"
							title="邮箱" value="${updateSupplier.semail}"/>
					</div>
				</div>
				<div class="form-row">
					<div class="field-label">
						<label for="field1">供应商名称</label>
					</div>
					<div class="field-widget">
						<input name="sname" id="sname" class="required" title="供应商名称"
							value="${updateSupplier.sname}"/>
					</div>
				</div>
				<div class="form-row">
					<div class="field-label">
						<label for="field1">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址</label>
					</div>
					<div class="field-widget">
						<input name="saddress" id="saddress" class="required"
							title="供应商地址" value="${updateSupplier.saddress}"/>
					</div>
				</div>
				
				
				
			</fieldset>
			<input type="submit" class="submit" value="提交" />
		</form>
	</div>
</body>
</html>