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
	<title>用户登陆</title>
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


	

</script>
	

</head>
<body>
	<form action="login" method="post">
	<div id="wrapper">
		<div id="wrappertop"></div>

		<div id="wrappermiddle_login">

			<h2>&nbsp;登陆</h2>

			<div id="username_input">

				<div id="username_inputleft"></div>

				<div id="username_inputmiddle">
				
					<input type="text" name="username" id="url" value="用户名" onclick="this.value = ''">
					<img id="url_user" src="<%=basePath %>images/mailicon.png" alt="">
				
				</div>

				<div id="username_inputright"></div>

			</div>
				
			<div id="password_input_login">

				<div id="password_inputleft"></div>

				<div id="password_inputmiddle">
				
					<input type="password" name="password" id="url" value="" onclick="this.value = ''">
					<img id="url_password" src="<%=basePath %>images/passicon.png" alt="">
				
				</div>

				<div id="password_inputright"></div>

			</div>

			<div id="submit_login">
				
				<input type="image" src="<%=basePath %>images/submit_hover.png" id="submit1" value="Sign In">
				<input type="image" src="<%=basePath %>images/submit.png" id="submit2" value="Sign In">
				
			</div>
			
			<div id="links_left">

			<a href="#">忘记密码?</a>

			</div>


			<div id="links_right">

			<a href="#">新用户注册</a>

			</div>
			


		</div>

		<div id="wrapperbottom"></div>
		
		<div id="powered">
		<p>Powered by NBlog</p>
		</div>
	</div>
	</form>
		<script type="text/javascript">
		if ("${error}" != "") {
			alert("${error}");
		};
	</script>

</body>
</html>