<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%
	String error = (String) request.getParameter("error");
%>

<title>登陆界面</title>
<link rel="shortcut icon" href="favicon.ico" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/bootstrap/bootstrap-social.css"
	type="text/css" />
<link rel="stylesheet" href="css/bootstrap/bootstrap-theme.min.css"
	type="text/css" />
<link rel="stylesheet" href="css/bootstrap/bootstrap.min.css"
	type="text/css" />
<link rel="stylesheet" href="css/login.css" type="text/css" />
<link rel="stylesheet" href="css/bootstrap/font-awesome.min.css"
	type="text/css" />
<link rel="stylesheet" href="css/sweetalert/sweetalert.css"
	type="text/css"/>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="js/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
	function reloadImage() {
		document.getElementById("identity_img").src = document
				.getElementById("identity_img").src
				+ "?nocache=" + new Date().getTime();
	}
	$(document).ready(function(){
		if(window != top){
			top.location.href=location.href;
		}
  		var error=$("#error_message").val();
  		
  		if(error==="pwd"){
  			swal("用户名或密码错误","","error");
  			
  		}else if(error==="code"){
  			swal("验证码错误","","error");
  			
  		}
  		
	});
</script>

</head>
<body class="amc-bg-image-1">
	<div class="container">
		<div class="col-md-12">
			<form class="form-horizontal amc-login-form-2" role="form"
				action="/amc/login.do?method=login" method="post">
				<div class="row">
					<div class="col-md-12">
						<h1>用户登录</h1>
					</div>
				</div>
				<div class="row">
					<div class="amc-one-signin col-md-12">
						<div class="form-group">
							<div class="col-md-12">
								<label for="username" class="control-label">用户名</label>
								<div class="amc-input-icon-container">
									<i class="fa fa-user"></i> <input type="text"
										class="form-control" id="username" name="username"
										placeholder="请输入用户名">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12">
								<label for="password" class="control-label">密码</label>
								<div class="amc-input-icon-container">
									<i class="fa fa-lock"></i> <input type="password"
										class="form-control" id="password" name="password"
										placeholder="请输入密码">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12">
								<label for="password" class="control-label">验证码</label>
								<div>
									<div class="amc-input-icon-container"
										style="width: 50%;float: left;margin-right: 10px;">
										<i class="fa fa-check"></i> <input type="text"
											class="form-control" id="identity" name="identity"
											placeholder="请输入验证码">
									</div>
									<img style="margin-top: 2px;margin-right: 10px;"
										src="getIdentity" id="identity_img" /> <i
										onclick="reloadImage();" class="fa fa-undo"></i>
								</div>





							</div>
						</div>
						<div class="form-group">
							<div class="col-md-8">
								<div class="checkbox">
									<label> <input type="checkbox"> 记住密码 </label>
								</div>

							</div>
							<div class="col-md-4">
								<a class="text-right" style="cursor: pointer;">忘记密码?</a>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12">
								<input type="submit" value="登  陆" class="btn btn-warning">
							</div>
						</div>

					</div>

				</div>
			</form>
		</div>
	</div>
	<input type="hidden" id="error_message" value="<%=error%>"/>
	<jsp:include page="foot.jsp"/>
</body>
</html>
