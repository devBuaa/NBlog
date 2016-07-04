<%@page import="com.amc.domain.AmcUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% AmcUser user=(AmcUser)session.getAttribute("user");
	if(user==null){
		response.sendRedirect(basePath+"login.jsp");
	}
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
		 if(isNull(uname)){
		 	swal("用户名不能为空","","warning");
		 	return false;
		 }
		 if(uname.length>18){
		 	swal("用户名过长","","warning");
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
    <form id="updateUser" action="/amc/user.do?method=update&uid=${updateUser.id}" method="post" onsubmit="return validate();">
    <fieldset>
        <legend>更新用户信息</legend>
        <div class="form-row">
            <div class="field-label"><label for="field1">用户名</label></div>
            <div class="field-widget"><input name="uname" id="uname" class="detail" title="Enter your name" value="${updateUser.name}"/></div>
        </div>
        <div class="form-row">
            <div class="field-label"><label for="field2">用户角色</label></div>
            <div class="field-widget">
                <select id="urole" name="urole" class="validate-selection" title="Choose your role">
                   <c:forEach items="${roles}" var="roles">
                   <c:choose>
                   <c:when test="${roles.id eq updateUser.amcRole.id}">
                   	<option value="${roles.id}" selected="selected">${roles.name}</option>
                   </c:when>
                   <c:otherwise>
                  	 <option value="${roles.id}">${roles.name}</option>
                   </c:otherwise>
                   
                   </c:choose>
                   	 
                   	  
                   </c:forEach>
                 
                    
                </select>
            </div>
        </div>
        <div class="form-row">
            <div class="field-label"><label for="field2">所在部门</label></div>
            <div class="field-widget">
                <select id="udepartment" name="udepartment" class="validate-selection" title="Choose your department">
                    <c:forEach items="${departments}" var="dpt">
                   <c:choose>
                   <c:when test="${dpt.id eq updateUser.amcDepartment.id}">
                   	<option value="${dpt.id}" selected="selected">${dpt.name}</option>
                   </c:when>
                   <c:otherwise>
                  	 <option value="${dpt.id}">${dpt.name}</option>
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