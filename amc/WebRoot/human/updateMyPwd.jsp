<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" href="<%=basePath %>css/form_content.css" type="text/css"></link>

<link rel="stylesheet" href="<%=basePath%>css/sweetalert/sweetalert.css"
	type="text/css"></link>
<script type="text/javascript" src="<%=basePath%>js/valiBasic.js"/>
<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
	function validate(){
		 upwd=document.getElementById("unowpassword").value;
		 pwd=document.getElementById("unewpassword").value;
		 pwd_c=document.getElementById("unewpassword_conform").value;
		 if(isNull(upwd)){
			swal("原密码不能为空","","warning");
		 	return false;
		 }
		 if(!validatePwd(pwd)){
		 	return false;
		 }
		 		swal({   
					title: "正在修改!",   
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
    <form id="updatePwd" action="/amc/myInfo.do?method=updatePassword" method="post" onsubmit="return validate();">
    <fieldset>
        <legend>修改密码</legend>
        <div class="form-row">
            <div class="field-label"><label for="field1">现密码</label></div>
            <div class="field-widget"><input name="unowpassword" id="unowpassword" class="detail" title="Enter your password" type="password"/></div>
        </div>
         <div class="form-row">
            <div class="field-label"><label for="field1">新密码</label></div>
            <div class="field-widget"><input name="unewpassword" id="unewpassword" class="detail" title="Enter your password" type="password"/></div>
        </div>
         <div class="form-row">
            <div class="field-label"><label for="field1">确认新密码</label></div>
            <div class="field-widget"><input id="unewpassword_conform" class="detail" title="Enter your password" type="password"/></div>
        </div>
        
             
      
    </fieldset>  
    <input type="submit" class="submit" value="提交" />
    </form>
    </div>
</body>
</html>