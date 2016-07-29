<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<!-- General meta information -->
	<title>用户注册</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta name="robots" content="index, follow" />
	<!-- // General meta information -->
	
	
	<!-- Load Javascript -->
	<script type="text/javascript" src="<%=basePath %>js/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/jquery.query-2.1.7.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/rainbows.js"></script>
	<!-- // Load Javascipt -->

	<!-- Load stylesheets -->
	<link type="text/css" rel="stylesheet" href="<%=basePath %>css/style.css" media="screen" />
	<!-- // Load stylesheets -->
	
<script>


	$(document).ready(function(){
 
	$("#submit1").hover(
	function() {
	$(this).animate({"opacity": "0"}, "slow");
	},
	function() {
	$(this).animate({"opacity": "1"}, "slow");
	});
 	});


</script>
	

</head>
<body>
	<form action="register" method="post">
	<div id="wrapper">
		<div id="wrappertop"></div>

		<div id="wrappermiddle">

			<h2>&nbsp;注册</h2>

			<div id="username_input">

				<div id="username_inputleft"></div>

				<div id="username_inputmiddle">
				
					<input type="text" name="UserName" id="url" value="用户名" onclick="this.value = ''">
					<img id="url_user" src="<%=basePath %>images/mailicon.png" alt="">
				
				</div>

				<div id="username_inputright"></div>

			</div>
			
			<div id="email_input">
				<div id="email_inputleft"></div>
				<div id="email_inputmiddle">
				
					<input type="text" name="Email" id="url" value="邮箱" onclick="this.value = ''">
					<img id="url_email" src="<%=basePath %>images/mailicon.png" alt="">
				
				</div>
				<div id="email_inputright"></div>


			</div>

			<div id="password_input">

				<div id="password_inputleft"></div>

				<div id="password_inputmiddle">
				
					<input type="password" name="Password" id="url" value="Password" onclick="this.value = ''">
					<img id="url_password" src="<%=basePath %>images/passicon.png" alt="">
				
				</div>

				<div id="password_inputright"></div>

			</div>
			<input type="hidden"  name="token"  value="${token}" />
			

			<div id="submit">
				
				<input type="image" src="<%=basePath %>images/submit_hover.png" id="submit1" value="Sign In">
				<input type="image" src="<%=basePath %>images/submit.png" id="submit2" value="Sign In">
				
			</div>


			<div id="links_right">

			<a href="#">手机注册</a>

			</div>
			


		</div>

		<div id="wrapperbottom"></div>
		
		<div id="powered">
		<p>Powered by NBlog</a></p>
		</div>
	</div>
	</form>

</body>
</html>