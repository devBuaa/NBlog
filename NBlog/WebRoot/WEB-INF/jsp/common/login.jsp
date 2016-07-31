<%@page import="com.nblog.util.StringUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String error = request.getAttribute("error")==null?"":(String)request.getAttribute("error");
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- General meta information -->
<title>用户登陆</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="robots" content="index, follow" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- // General meta information -->

<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet">
<link href="<%=basePath%>css/style.css" rel="stylesheet" />

</head>
<body style="background: #adadad;">
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand">&nbsp;&nbsp;Why Note</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse" role="navigation">
			<ul class="nav navbar-nav">
				<li><a href="<%=basePath%>index"><span
						class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;首页</a></li>
				<li><a href="about"><span
						class="glyphicon glyphicon-bookmark" aria-hidden="true"></span>&nbsp;关于Why
						Note</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="active"><a>登录</a></li>
				<li><a href="<%=basePath%>registerregister">注册</a></li>
			</ul>
		</div>

	</div>
	</nav>
<div class="box">
		<div class="login-box">
			<div class="login-title text-center">
				<h1>
					<small>Login</small>
				</h1>
			</div>
			<div class="login-content" style="background: #eeeeee;">
				<div class="form">
					<form action="<%=basePath%>login" method="post">
						<div class="form-group">
							<div class="col-xs-12  ">
								<div class="input-group">
									<span class="input-group-addon"><span
										class="glyphicon glyphicon-user"></span></span> <input type="text"
										id="username" name="username" class="form-control"
										placeholder="username" required autofocus>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-12  ">
								<div class="input-group">
									<span class="input-group-addon"><span
										class="glyphicon glyphicon-lock"></span></span> <input type="password"
										id="password" name="password" class="form-control"
										placeholder="password" required>
								</div>
							</div>
						</div>
						<div class="form-group form-actions">
							<div class="col-xs-12">
								<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
									in</button>
							</div>
						</div>
						<div class="form-group" id="errorMessage" <% if(StringUtil.isEmpty(error)) {%>style="display: none;<%}%>">
							<div class="col-xs-12">
								<p class="text-center remove-margin">
									<small style="color:#ff00ee" id="errorInfo"><%=error %></small>
								</p>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-6">
								<p class="text-center remove-margin">
									<a href="javascript:void(0)"><small>Retrieve</small></a>
								</p>
							</div>
							<div class="col-xs-6">
								<p class="text-center remove-margin">
									<a href="<%=basePath%>register"><small>Register</small></a>
								</p>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/collapse.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="<%=basePath%>js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>