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
		 uname=document.getElementById("uname").value;
		 pwd=document.getElementById("upassword").value;
		 pwd_c=document.getElementById("upassword_conform").value;
		 if(isNull(uname)){
		 	swal("用户名不能为空","","warning");
		 	return false;
		 }
		 if(!validatePwd(pwd)){
		 	return false;
		 }
		 swal({   
				title: "正在添加!",   
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
    <form id="addUser" action="/amc/user.do?method=add" method="post" onsubmit="return validate();">
    <fieldset>
        <legend>添加用户</legend>
        <div class="form-row">
            <div class="field-label"><label for="field1">用&nbsp&nbsp户&nbsp&nbsp名</label></div>
            <div class="field-widget"><input name="uname" id="uname" class="detail" title="Enter your name" /></div>
        </div>
         <div class="form-row">
            <div class="field-label"><label for="field1">用户密码</label></div>
            <div class="field-widget"><input name="upassword" id="upassword" class="detail" title="Enter your password" type="password"/></div>
        </div>
         <div class="form-row">
            <div class="field-label"><label for="field1">确认密码</label></div>
            <div class="field-widget"><input id="upassword_conform" class="detail" title="Enter your password" type="password"/></div>
        </div>
        <div class="form-row">
            <div class="field-label"><label for="field2">用户角色</label></div>
            <div class="field-widget">
                <select id="urole" name="urole" class="validate-selection" title="Choose your role">
                   <c:forEach items="${roles}" var="roles">                  
                  	 <option value="${roles.id}">${roles.name}</option>                                           
                   </c:forEach>                                   
                </select>
            </div>
        </div>
        <div class="form-row">
            <div class="field-label"><label for="field2">所在部门</label></div>
            <div class="field-widget">
                <select id="udepartment" name="udepartment" class="validate-selection" title="Choose your department">
                    <c:forEach items="${departments}" var="dpt">
                  	 <option value="${dpt.id}">${dpt.name}</option>                                
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