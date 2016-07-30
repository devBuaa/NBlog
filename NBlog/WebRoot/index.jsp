<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="">

<title>NBlog---带你装逼带你飞</title>

<!-- Bootstrap core CSS -->
<link href="<%=basePath%>css/bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<%=basePath%>css/navbar.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="<%=basePath%>js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="<%=basePath%>js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="<%=basePath%>js/html5shiv.min.js"></script>
      <script src="<%=basePath%>js/respond.min.js"></script>
    <![endif]-->
</head>

<body>
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
			<a class="navbar-brand">&nbsp;&nbsp;NBlog</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse" role="navigation">
			<ul class="nav navbar-nav">
				<li class="active"><a><span
						class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;首页</a></li>
				<li><a href="about"><span
						class="glyphicon glyphicon-bookmark" aria-hidden="true"></span>&nbsp;关于NBlog</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="active"><a>游客，欢迎您 <span class="sr-only">(current)</span></a></li>
				<li><a href="login">登录</a></li>
				<li><a href="register">注册</a></li>
			</ul>
		</div>

	</div>
	</nav>

	 <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">
        <h2>NB日志--简洁直观的记事本!</h2>
        <p>NB日志主要受iPhone原生的记事本的启发，在实现日志记录功能的基础上将简介大气的风格呈现在web界面上。同时NB日志拥有非常完善的权限管理，一键轻松绑定日志的权限。除此之外，NB日志也是志趣相投者的天堂。在NB日志你不仅可以吹牛逼，还能结识五湖四海的朋友。  </p>
        <p><a class="btn btn-primary btn-default" href="about" role="button">了解更多 &raquo;</a></p>
      </div>
    </div>

    <div class="container">
      <!-- Example row of columns -->
      <div class="row">
        <div class="col-md-4">
          <h2>后端框架</h2>
          <p>NB日志采用了Spring 4.0 + Spring MVC 4.0 + Mybatis 3.2 + shiro 1.2 + MySQL 5.6的框架，集易用性、广泛性、灵活性、可扩展性、安全性于一身。
          采用的Shiro其干净的API和设计模式可以方便地与许多的其他框架和应用进行集成。
		  </p>
          <p><a class="btn btn-default" href="" role="button">更多细节 &raquo;</a></p>
        </div>
        <div class="col-md-4">
          <h2>web前端</h2>
          <p>NB日志采用了bootstrap以及html5+css3+js作为前端开发框架，简洁、直观、强悍、干净纯洁，手机、平板、pc应用开发设计，均彻底可视化，完全所见即所得，让开发真正迅速简单、高效。</p>
          <p><a class="btn btn-default" href="" role="button">更多发现 &raquo;</a></p>
       </div>
        <div class="col-md-4">
          <h2>未来动向</h2> 
          <p>NB日志开发团队在未来的几周内将完成前端界面的风格统一设计，并在此基础上力争完成记事本的基础功能的开发。在未来几个月，让我们对NB日志拭目以待。</p>
          <p><a class="btn btn-default" href="" role="button">更多功能 &raquo;</a></p>
        </div>
      </div>

      <hr>
<footer class="footer navbar-fixed-bottom ">
    <div class="container">
    <p align="center">&copy; 2016 devBuaa, Powered by NBlog.</p>
    </div>
</footer>
     
    </div> <!-- /container -->

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/collapse.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="<%=basePath%>js/ie10-viewport-bug-workaround.js"></script>
	
</body>
</html>
