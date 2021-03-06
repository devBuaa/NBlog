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
	function validate(){
		 cname=document.getElementById("cname").value;
		 cphone=document.getElementById("cphone").value;
		 caddress=document.getElementById("caddress").value;
		 ccredit=document.getElementById("ccredit").value;
		 if(isNull(cname)){
		 	swal("请输入有效的顾客名!","","warning");
		 	return false;
		 }
		  if(isNull(cphone) || !checkTel(cphone)){
		 	swal("请输入有效的手机号码!","","warning");
		 	return false;
		 }
		 if(isNull(caddress)){
		 	swal("请输入地址!","","warning");
		 	return false;
		 }
		   swal({   
				title: "正在更新!",   
				text: "稍等...",
				type:"success",    
				showConfirmButton: false
			});
		 return true;
		
	}
</script>

</head>
<body>
	<div class="form_content">
		<form id="updateCustomer"
			action="/amc/customer.do?method=update&cid=${updateCustomer.cid}"
			method="post" onsubmit="return validate();">
			<fieldset>
				<legend>更新顾客信息</legend>
				<div class="form-row">
					<div class="field-label">
						<label for="field1">顾客名</label>
					</div>
					<div class="field-widget">
						<input name="cname" id="cname" class="shortrequired" title="姓名"
							value="${updateCustomer.cname}" />
					</div>
				</div>
				<div class="form-row">
					<div class="field-label">
						<label for="field1">联系方式</label>
					</div>
					<div class="field-widget">
						<input name="cphone" id="cphone" class="shortrequired"
							title="Enter phone" value="${updateCustomer.cphone}" />
					</div>
				</div>
				<div class="form-row">
					<div class="field-label">
						<label for="field1">顾客地址</label>
					</div>
					<div class="shortfield-widget">
						<input name="caddress" id="caddress" class="shortrequired"
							title="Enter address" value="${updateCustomer.caddress}" />
					</div>
				</div>
				<div class="form-row">
					<div class="field-label">
						<label for="field2">信誉等级</label>
					</div>
					<div class="field-widget">
						<select id="ccredit" name="ccredit" class="validate-selection"
							title="Choose credit">
							<c:forEach begin="1" end="5" var="i">
								<c:choose>
									<c:when test="${i eq updateCustomer.ccredit}">
										<option value="${i}" selected="selected">${i}</option>
									</c:when>
									<c:otherwise>
										<option value="${i}">${i}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
				</div>
			</fieldset>
			<input type="submit" class="submit" value="提交" />
		</form>
	</div>
</body>
</html>