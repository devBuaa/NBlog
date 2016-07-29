<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<base href="<%=basePath%>">
	<title>牛逼日志 - 带你装逼带你飞</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- Load Javascript -->
	<script type="text/javascript" src="<%=basePath %>js/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/jquery.query-2.1.7.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/rainbows.js"></script>
	<!-- // Load Javascipt -->
	
	<!-- Load stylesheets -->
	<link type="text/css" rel="stylesheet" href="<%=basePath %>css/zui.min.css" />
	<link type="text/css" rel="stylesheet" href="<%=basePath %>css/zui-theme.min.css" />
	<link type="text/css" rel="stylesheet" href="<%=basePath %>css/zui-theme.min.css" />
	
	<!-- // Load stylesheets -->
	<script type="text/javascript">
	
	</script>

<!--[if lte IE 6]><link rel="stylesheet" type="text/css" href="http://7xlj2j.com1.z0.glb.clouddn.com/newstyle/css/bootstrap-ie6.min.css"><link rel="stylesheet" type="text/css" href="http://7xlj2j.com1.z0.glb.clouddn.com/newstyle/css/ie.css"><![endif]-->
</head>
<div class="toplogin">
	<!--弹出登录-->
	<div class="popup_wrap" id="login_popup">
		<section class="popup r_corners shadow">
			<button class="close">
				<i class="fa fa-times"></i>
			</button>
			<h2 class="text-center">用户登录</h2>
			<form method="post" name="validator-form" id="loginFormBox"
				action="/member/login.html" class="form-horizontal">
				<ul>
					<li><input type="text" name="username" id="username"
						class="r_corners full_width" placeholder="用 户 名"></li>
					<li><input type="password" name="password" id="password"
						class="r_corners full_width" placeholder="登陆密码"></li>
					<li class="m_bottom_15"><input type="checkbox"
						checked="checked" name="autologin" id="checkbox_10"><label
						for="checkbox_10">记住我</label></li>
					<li class="clearfix m_bottom_30"><input type="submit"
						class="ajax-login " value="登录">
					<div class="f_right f_size_medium f_mxs_none">
							<a href="/member/findpwd.html" class="color_dark">忘记密码?</a><br>
						</div></li>
				</ul>
			</form>
			<hr style="height:1px; background:#ccc;border:none;" />
			<footer class="text-center">
				<h3>还没有账号?</h3>
				<a href="/member/register.html" role="button">免费申请一个新帐号</a>
			</footer>
		</section>
	</div>
</div>
<body unselectable="on" onselectstart="return false;">
	<!--导航-->
	<div class="container-fuild bailemi">
		<div class="container">
			<nav class="navbar navbar-default">
				<div class="row container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span><span
								class="icon-bar"></span><span class="icon-bar"></span><span
								class="icon-bar"></span>
						</button>
						<a class="logo" href="/"><img
							src="http://7xlj2j.com1.z0.glb.clouddn.com/newstyle/images/logo.png"></a>
					</div>
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li><a href="/index.php?m=&c=genre&a=index"><i
									class="icon-music"></i> 金曲</a></li>
							<li><a href="/index.php?m=&c=album&a=index" title=""><i
									class="icon-list"></i> 期刊</a></li>
							<li><a href="/index.php?m=&c=ranks&a=index" title=""><i
									class="icon-tint"></i> Top榜</a></li>
							<!--<li><a href="/index.php?m=&c=news&a=index" title=""><i class="icon-flag"></i> 街拍</a></li>-->
						</ul>
						<form class="navbar-form navbar-left hidden-xs" role="search"
							id="search_form" method="get" action="/search/index.html">
							<div class="input-group">
								<div class="input-group forms">
									<input type="text" hidden="hidden" name="type" value="songs"><input
										type="text" class="form-control input_key" placeholder="音乐/歌单"
										name="keys"><span class="input-group-btn"><button
											class="btn btn-default f_right search_button tr_all_hover f_xs_none">
											<i class="icon-search"></i> 搜索
										</button></span>
								</div>
							</div>
						</form>
						<ul class="nav navbar-nav navbar-right topreg">
							<!--<li><a href="login.html"><i class="icon-user"></i> 登陆  </a></li>-->
							<li><a href="/user/music/share.html"><i
									class="icon-cloud-upload"></i> 发布</a></li>
							<li><a href="#" class="user-show" id="login_btn"
								data-popup="#login_popup"><i class="icon-signin"></i> 登录</a></li>
							<li class="user-hide dropdown"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown"><b
									id="user_info"></b><b class="caret"></b></a>
							<ul class="dropdown-menu" role="menu">
									<li><a class="icon-home" href="/user/home.html"> 我的空间</a></li>
									<li><a class="icon-music" href="/user/music/index.html">
											我的音乐</a></li>
									<li><a class="icon-star" href="/user/fav.html"> 我的收藏</a></li>
									<li><a class="icon-list" href="/user/fav/album.html">
											我的歌单</a></li>
									<li><a class="icon-envelope" href="/user/message.html">
											我的消息</a></li>
									<li><a class="icon-cogs" href="/user/profile.html">
											个人设置</a></li>
									<!--                <li class="divider"></li><li id="login_out"><a class="icon-signout" href="javascript:;" url="/member/logout.html"> 退出登录</a></li>-->
								</ul></li>
							<li class="user-show bgs"><a href="/member/register.html"
								class="default_t_color"><i class="icon-user"></i> 注册</a></li>
							<li id="login_out" class="user-hide"><a href="javascript:;"
								url="/member/logout.html" class="default_t_color">退出</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</div>
	<!--导航end-->
	<div class="container visible-xs">
		<form class="navbar-form navbar-left" role="search" id="search_form"
			method="get" action="/search/index.html">
			<div class="input-group">
				<div class="input-group">
					<input type="text" hidden="hidden" name="type" value="songs"><input
						type="text" class="form-control" placeholder="音乐/歌单" name="keys"><span
						class="input-group-btn"><button
							class="btn btn-default f_right search_button tr_all_hover f_xs_none">
							<i class="icon-search"></i> 搜索
						</button></span>
				</div>
			</div>
		</form>
	</div>
	<div class="topbg animated bounceInDown hidden-xs">
		<h1 class="container ">
			记录、收藏、分享您喜欢的好歌曲!<span class="indexshare pull-right"><a
				href="/user/music/share.html"><i class="icon-pencil"></i> 立即分享</a>
			<!--    <a href="/member/login.html"><i class="icon-map-marker"></i> 免费拥有</a>--></span>
		</h1>
	</div>
	<div class="container hidden-xs topuser">
		<h2>他们正在点赞...</h2>
		<ul>
			<li><a href="/user/home/index/uid/3.html" target="_blank"><img
					src="/Uploads/Avatars/uid_3/256.jpg" alt="bobo" /></a>
			<h5>
					<a target="_blank" href="/user/home/index/uid/3.html">bobo</a>
				</h5></li>
			<li><a href="/user/home/index/uid/2.html" target="_blank"><img
					src="/Uploads/Avatars/uid_2/256.jpg" alt="paowoo" /></a>
			<h5>
					<a target="_blank" href="/user/home/index/uid/2.html">paowoo</a>
				</h5></li>
			<li><a href="/user/home/index/uid/14.html" target="_blank"><img
					src="/Uploads/Avatars/uid_14/256.jpg" alt="小臭臭" /></a>
			<h5>
					<a target="_blank" href="/user/home/index/uid/14.html">小臭臭</a>
				</h5></li>
			<li><a href="/user/home/index/uid/4.html" target="_blank"><img
					src="/Uploads/Avatars/uid_4/256.jpg" alt="绝地孤狼" /></a>
			<h5>
					<a target="_blank" href="/user/home/index/uid/4.html">绝地孤狼</a>
				</h5></li>
			<li><a href="/user/home/index/uid/6.html" target="_blank"><img
					src="/Uploads/Avatars/default/default.gif" alt="zpedku" /></a>
			<h5>
					<a target="_blank" href="/user/home/index/uid/6.html">zpedku</a>
				</h5></li>
			<li><a href="/user/home/index/uid/5.html" target="_blank"><img
					src="/Uploads/Avatars/default/default.gif" alt="Ruthless" /></a>
			<h5>
					<a target="_blank" href="/user/home/index/uid/5.html">Ruthless</a>
				</h5></li>
			<li><a href="/user/home/index/uid/7.html" target="_blank"><img
					src="/Uploads/Avatars/default/default.gif" alt="SingerWiki" /></a>
			<h5>
					<a target="_blank" href="/user/home/index/uid/7.html">SingerWiki</a>
				</h5></li>
			<li><a href="/user/home/index/uid/8.html" target="_blank"><img
					src="/Uploads/Avatars/uid_8/256.jpg" alt="ares" /></a>
			<h5>
					<a target="_blank" href="/user/home/index/uid/8.html">ares</a>
				</h5></li>
		</ul>
	</div>
	<div class="container">
		<!-- 730X90 -->
		<div class="gggg">
			<script async
				src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
			<ins class="adsbygoogle"
				style="display:inline-block;width:728px;height:90px"
				data-ad-client="ca-pub-9608000770669701" data-ad-slot="6574628565"></ins>
			<script>
				(adsbygoogle = window.adsbygoogle || []).push({});
			</script>
		</div>
	</div>
	<div class="container animated bounceInLeft index">
		<div class="col-md-12 left">
			<h2 class="hidden-sm hidden-md hidden-lg">
				&nbsp;<span class="hidden-xs">错过了今天,您将忘记昨天！所以... </span><span
					class="indexshare"><a href="/user/music/share.html"><i
						class="icon-pencil"></i> 立即分享</a>
				<!--    <a href="/member/login.html"><i class="icon-map-marker"></i> 马上签到</a>--></span>
			</h2>
			<h4 id="indextab">
				<a href="javascript:;"><i class="icon-th-large"> 最新分享</i></a><a
					href="javascript:;"><i class="icon-pushpin"> 热门推荐</i></a><a
					href="javascript:;"><i class="icon-group"> 网友推荐</i></a>
				<!--        <a href=""><i class="icon-tint"> 热门试听</i></a>-->
				<a class="pull-right  hidden-xs"
					href="/index.php?m=&c=genre&a=index"><em
					class="icon-double-angle-right"></em> 更多...</a>
			</h4>
			<div class="row indexlist " id="tabnow">
				<ul>
					<li><div class="zan">
							<a href="javascript:;" class="collect music-action-btn"
								data-id="934" data-action="recommend"><i
								class=" icon-thumbs-up"></i><b><span class="num">0</span></b></a>
						</div>
						<div class="indextitle">
							<h2>
								<a href="/music/detail/id/934.html"
									title=" Fabrizio Faniello - I no can do " target="_blank">Fabrizio
									Faniello - I no can do</a>
							</h2>
							<p>
								<a class="jp-play-me icon-play" data-id="934"
									href="javascript:;"> 播放 </a>
								<!--    <span class="indextag"><a class="color_dark" href="/album/detail/id/0.html">单曲</a></span>-->
							</p>
						</div>
						<div class="hidden-xs img">
							<a href="/music/detail/id/934.html"><img
								src="http://7xjvx6.media1.z0.glb.clouddn.com/2016-07-23_5792cd12520d6.jpg"></a><a
								data-id="934" data-action="fav" href="javascript:;" title="收藏"
								class="music-action-btn icon-star"><span class="num">0</span></a>
						</div></li>
					<li><div class="zan">
							<a href="javascript:;" class="collect music-action-btn"
								data-id="933" data-action="recommend"><i
								class=" icon-thumbs-up"></i><b><span class="num">1</span></b></a>
						</div>
						<div class="indextitle">
							<h2>
								<a href="/music/detail/id/933.html"
									title=" A La Renverse - Hélène Segara " target="_blank">A
									La Renverse - Hélène Segara</a>
							</h2>
							<p>
								<a class="jp-play-me icon-play" data-id="933"
									href="javascript:;"> 播放 </a>
								<!--    <span class="indextag"><a class="color_dark" href="/album/detail/id/0.html">单曲</a></span>-->
							</p>
						</div>
						<div class="hidden-xs img">
							<a href="/music/detail/id/933.html"><img
								src="http://7xjvx6.media1.z0.glb.clouddn.com/2016-07-17_578b963ec8f23.jpg"></a><a
								data-id="933" data-action="fav" href="javascript:;" title="收藏"
								class="music-action-btn icon-star"><span class="num">1</span></a>
						</div></li>
					<li><div class="zan">
							<a href="javascript:;" class="collect music-action-btn"
								data-id="932" data-action="recommend"><i
								class=" icon-thumbs-up"></i><b><span class="num">1</span></b></a>
						</div>
						<div class="indextitle">
							<h2>
								<a href="/music/detail/id/932.html"
									title=" Morgen - Frida Gold " target="_blank">Morgen -
									Frida Gold</a>
							</h2>
							<p>
								<a class="jp-play-me icon-play" data-id="932"
									href="javascript:;"> 播放 </a>
								<!--    <span class="indextag"><a class="color_dark" href="/album/detail/id/0.html">单曲</a></span>-->
							</p>
						</div>
						<div class="hidden-xs img">
							<a href="/music/detail/id/932.html"><img
								src="http://7xjvx6.media1.z0.glb.clouddn.com/2016-07-10_5781f2f8db22c.jpg"></a><a
								data-id="932" data-action="fav" href="javascript:;" title="收藏"
								class="music-action-btn icon-star"><span class="num">1</span></a>
						</div></li>
					<li><div class="zan">
							<a href="javascript:;" class="collect music-action-btn"
								data-id="931" data-action="recommend"><i
								class=" icon-thumbs-up"></i><b><span class="num">1</span></b></a>
						</div>
						<div class="indextitle">
							<h2>
								<a href="/music/detail/id/931.html"
									title=" Mělo to tak být - Marly Man " target="_blank">Mělo
									to tak být - Marly Man</a>
							</h2>
							<p>
								<a class="jp-play-me icon-play" data-id="931"
									href="javascript:;"> 播放 </a>
								<!--    <span class="indextag"><a class="color_dark" href="/album/detail/id/0.html">单曲</a></span>-->
							</p>
						</div>
						<div class="hidden-xs img">
							<a href="/music/detail/id/931.html"><img
								src="http://7xjvx6.media1.z0.glb.clouddn.com/2016-07-10_5781cdb6f2777.jpg"></a><a
								data-id="931" data-action="fav" href="javascript:;" title="收藏"
								class="music-action-btn icon-star"><span class="num">1</span></a>
						</div></li>
					<li><div class="zan">
							<a href="javascript:;" class="collect music-action-btn"
								data-id="930" data-action="recommend"><i
								class=" icon-thumbs-up"></i><b><span class="num">1</span></b></a>
						</div>
						<div class="indextitle">
							<h2>
								<a href="/music/detail/id/930.html"
									title=" Losa _Bonus) - Dzenan Loncarevic " target="_blank">Losa
									_Bonus) - Dzenan Loncarevic</a>
							</h2>
							<p>
								<a class="jp-play-me icon-play" data-id="930"
									href="javascript:;"> 播放 </a>
								<!--    <span class="indextag"><a class="color_dark" href="/album/detail/id/0.html">单曲</a></span>-->
							</p>
						</div>
						<div class="hidden-xs img">
							<a href="/music/detail/id/930.html"><img
								src="http://7xjvx6.media1.z0.glb.clouddn.com/2016-07-09_5780cd215d91e.jpg"></a><a
								data-id="930" data-action="fav" href="javascript:;" title="收藏"
								class="music-action-btn icon-star"><span class="num">0</span></a>
						</div></li>
					<li><div class="zan">
							<a href="javascript:;" class="collect music-action-btn"
								data-id="929" data-action="recommend"><i
								class=" icon-thumbs-up"></i><b><span class="num">1</span></b></a>
						</div>
						<div class="indextitle">
							<h2>
								<a href="/music/detail/id/929.html" title=" Haive - Marly Man "
									target="_blank">Haive - Marly Man</a>
							</h2>
							<p>
								<a class="jp-play-me icon-play" data-id="929"
									href="javascript:;"> 播放 </a>
								<!--    <span class="indextag"><a class="color_dark" href="/album/detail/id/0.html">单曲</a></span>-->
							</p>
						</div>
						<div class="hidden-xs img">
							<a href="/music/detail/id/929.html"><img
								src="http://7xjvx6.media1.z0.glb.clouddn.com/2016-07-09_5780c1d241236.jpg"></a><a
								data-id="929" data-action="fav" href="javascript:;" title="收藏"
								class="music-action-btn icon-star"><span class="num">0</span></a>
						</div></li>
					<li><div class="zan">
							<a href="javascript:;" class="collect music-action-btn"
								data-id="928" data-action="recommend"><i
								class=" icon-thumbs-up"></i><b><span class="num">1</span></b></a>
						</div>
						<div class="indextitle">
							<h2>
								<a href="/music/detail/id/928.html"
									title=" 听首悲伤的晚安曲吧 I Need Some Sleep " target="_blank">听首悲伤的晚安曲吧
									I Need Some Sleep</a>
							</h2>
							<p>
								<a class="jp-play-me icon-play" data-id="928"
									href="javascript:;"> 播放 </a>
								<!--    <span class="indextag"><a class="color_dark" href="/album/detail/id/0.html">单曲</a></span>-->
							</p>
						</div>
						<div class="hidden-xs img">
							<a href="/music/detail/id/928.html"><img
								src="http://7xjvx6.media1.z0.glb.clouddn.com/2016-07-02_577799afe03ce.jpg"></a><a
								data-id="928" data-action="fav" href="javascript:;" title="收藏"
								class="music-action-btn icon-star"><span class="num">0</span></a>
						</div></li>
					<li><div class="zan">
							<a href="javascript:;" class="collect music-action-btn"
								data-id="927" data-action="recommend"><i
								class=" icon-thumbs-up"></i><b><span class="num">1</span></b></a>
						</div>
						<div class="indextitle">
							<h2>
								<a href="/music/detail/id/927.html"
									title=" Менің өмірім - Tengemakers 哈萨克斯坦组合 " target="_blank">Менің
									өмірім - Tengemakers 哈萨克斯坦组合</a>
							</h2>
							<p>
								<a class="jp-play-me icon-play" data-id="927"
									href="javascript:;"> 播放 </a>
								<!--    <span class="indextag"><a class="color_dark" href="/album/detail/id/0.html">单曲</a></span>-->
							</p>
						</div>
						<div class="hidden-xs img">
							<a href="/music/detail/id/927.html"><img
								src="http://7xjvx6.media1.z0.glb.clouddn.com/2016-07-02_57775853b096b.jpg"></a><a
								data-id="927" data-action="fav" href="javascript:;" title="收藏"
								class="music-action-btn icon-star"><span class="num">0</span></a>
						</div></li>
					<li><div class="zan">
							<a href="javascript:;" class="collect music-action-btn"
								data-id="926" data-action="recommend"><i
								class=" icon-thumbs-up"></i><b><span class="num">1</span></b></a>
						</div>
						<div class="indextitle">
							<h2>
								<a href="/music/detail/id/926.html"
									title=" Passenger - Let Her Go " target="_blank">Passenger
									- Let Her Go</a>
							</h2>
							<p>
								<a class="jp-play-me icon-play" data-id="926"
									href="javascript:;"> 播放 </a>
								<!--    <span class="indextag"><a class="color_dark" href="/album/detail/id/0.html">单曲</a></span>-->
							</p>
						</div>
						<div class="hidden-xs img">
							<a href="/music/detail/id/926.html"><img
								src="http://7xjvx6.media1.z0.glb.clouddn.com/2016-06-22_576a9f1611864.jpg"></a><a
								data-id="926" data-action="fav" href="javascript:;" title="收藏"
								class="music-action-btn icon-star"><span class="num">1</span></a>
						</div></li>
					<li><div class="zan">
							<a href="javascript:;" class="collect music-action-btn"
								data-id="925" data-action="recommend"><i
								class=" icon-thumbs-up"></i><b><span class="num">1</span></b></a>
						</div>
						<div class="indextitle">
							<h2>
								<a href="/music/detail/id/925.html"
									title=" Imagine Dragons - Demons " target="_blank">Imagine
									Dragons - Demons</a>
							</h2>
							<p>
								<a class="jp-play-me icon-play" data-id="925"
									href="javascript:;"> 播放 </a>
								<!--    <span class="indextag"><a class="color_dark" href="/album/detail/id/0.html">单曲</a></span>-->
							</p>
						</div>
						<div class="hidden-xs img">
							<a href="/music/detail/id/925.html"><img
								src="http://7xjvx6.media1.z0.glb.clouddn.com/2016-06-21_576949c8b15fb.jpg"></a><a
								data-id="925" data-action="fav" href="javascript:;" title="收藏"
								class="music-action-btn icon-star"><span class="num">0</span></a>
						</div></li>
				</ul>
			</div>
			<div class="row indexlist tabactive" id="tabhot">
				<ul>
					<li><div class="zan">
							<a href="javascript:;" class="collect music-action-btn"
								data-id="1" data-action="recommend"><i
								class=" icon-thumbs-up"></i><b><span class="num">8</span></b></a>
						</div>
						<div class="indextitle">
							<h2>
								<a href="/music/detail/id/1.html"
									title=" Bleu noir  - Mylene Farmer 幽暗深处的法国女声 " target="_blank">Bleu
									noir - Mylene Farmer 幽暗深处的法国女声</a>
							</h2>
							<p>
								<a class="jp-play-me icon-play" data-id="1" href="javascript:;">
									播放</a>
								<!--    <span class="indextag"><a class="color_dark" href="/album/detail/id/1.html">爱，希望的翅膀</a></span>-->
							</p>
						</div>
						<div class="hidden-xs img">
							<a href="/music/detail/id/1.html"><img
								src="http://7xjvx6.media1.z0.glb.clouddn.com/2015-07-14_55a4650777125.jpg"></a><a
								data-id="1" data-action="fav" href="javascript:;" title="收藏"
								class="music-action-btn icon-star"><span class="num">4</span></a>
						</div></li>
					<li><div class="zan">
							<a href="javascript:;" class="collect music-action-btn"
								data-id="2" data-action="recommend"><i
								class=" icon-thumbs-up"></i><b><span class="num">5</span></b></a>
						</div>
						<div class="indextitle">
							<h2>
								<a href="/music/detail/id/2.html"
									title=" La Camisa Negra 经典气氛电音 你值得拥有 " target="_blank">La
									Camisa Negra 经典气氛电音 你值得拥有</a>
							</h2>
							<p>
								<a class="jp-play-me icon-play" data-id="2" href="javascript:;">
									播放</a>
								<!--    <span class="indextag"><a class="color_dark" href="/album/detail/id/2.html">北京申奥成功，国家强大了！</a></span>-->
							</p>
						</div>
						<div class="hidden-xs img">
							<a href="/music/detail/id/2.html"><img
								src="http://7xjvx6.media1.z0.glb.clouddn.com/2015-07-12_55a1c1c38afca.jpg"></a><a
								data-id="2" data-action="fav" href="javascript:;" title="收藏"
								class="music-action-btn icon-star"><span class="num">4</span></a>
						</div></li>
					<li><div class="zan">
							<a href="javascript:;" class="collect music-action-btn"
								data-id="3" data-action="recommend"><i
								class=" icon-thumbs-up"></i><b><span class="num">4</span></b></a>
						</div>
						<div class="indextitle">
							<h2>
								<a href="/music/detail/id/3.html" title=" 黑人喊麦夜店开场女唱越鼓澎湃节奏DJ "
									target="_blank">黑人喊麦夜店开场女唱越鼓澎湃节奏DJ</a>
							</h2>
							<p>
								<a class="jp-play-me icon-play" data-id="3" href="javascript:;">
									播放</a>
								<!--    <span class="indextag"><a class="color_dark" href="/album/detail/id/2.html">北京申奥成功，国家强大了！</a></span>-->
							</p>
						</div>
						<div class="hidden-xs img">
							<a href="/music/detail/id/3.html"><img
								src="http://7xjvx6.media1.z0.glb.clouddn.com/2015-07-10_559fc1eceabeb.jpg"></a><a
								data-id="3" data-action="fav" href="javascript:;" title="收藏"
								class="music-action-btn icon-star"><span class="num">3</span></a>
						</div></li>
					<li><div class="zan">
							<a href="javascript:;" class="collect music-action-btn"
								data-id="4" data-action="recommend"><i
								class=" icon-thumbs-up"></i><b><span class="num">4</span></b></a>
						</div>
						<div class="indextitle">
							<h2>
								<a href="/music/detail/id/4.html"
									title=" Nico & Vinz - Am I Wrong " target="_blank">Nico &
									Vinz - Am I Wrong</a>
							</h2>
							<p>
								<a class="jp-play-me icon-play" data-id="4" href="javascript:;">
									播放</a>
								<!--    <span class="indextag"><a class="color_dark" href="/album/detail/id/3.html">告别印象主义</a></span>-->
							</p>
						</div>
						<div class="hidden-xs img">
							<a href="/music/detail/id/4.html"><img
								src="http://7xjvx6.media1.z0.glb.clouddn.com/2015-07-10_559fcc05ad42d.jpg"></a><a
								data-id="4" data-action="fav" href="javascript:;" title="收藏"
								class="music-action-btn icon-star"><span class="num">1</span></a>
						</div></li>
					<li><div class="zan">
							<a href="javascript:;" class="collect music-action-btn"
								data-id="5" data-action="recommend"><i
								class=" icon-thumbs-up"></i><b><span class="num">3</span></b></a>
						</div>
						<div class="indextitle">
							<h2>
								<a href="/music/detail/id/5.html" title=" 超好听的磁性宏厚女声 "
									target="_blank">超好听的磁性宏厚女声</a>
							</h2>
							<p>
								<a class="jp-play-me icon-play" data-id="5" href="javascript:;">
									播放</a>
								<!--    <span class="indextag"><a class="color_dark" href="/album/detail/id/1.html">爱，希望的翅膀</a></span>-->
							</p>
						</div>
						<div class="hidden-xs img">
							<a href="/music/detail/id/5.html"><img
								src="http://7xjvx6.media1.z0.glb.clouddn.com/2015-07-10_559fcefd0cbf9.jpg"></a><a
								data-id="5" data-action="fav" href="javascript:;" title="收藏"
								class="music-action-btn icon-star"><span class="num">1</span></a>
						</div></li>
					<li><div class="zan">
							<a href="javascript:;" class="collect music-action-btn"
								data-id="6" data-action="recommend"><i
								class=" icon-thumbs-up"></i><b><span class="num">4</span></b></a>
						</div>
						<div class="indextitle">
							<h2>
								<a href="/music/detail/id/6.html" title=" 经典中的Brother Louie "
									target="_blank">经典中的Brother Louie</a>
							</h2>
							<p>
								<a class="jp-play-me icon-play" data-id="6" href="javascript:;">
									播放</a>
								<!--    <span class="indextag"><a class="color_dark" href="/album/detail/id/3.html">告别印象主义</a></span>-->
							</p>
						</div>
						<div class="hidden-xs img">
							<a href="/music/detail/id/6.html"><img
								src="http://7xjvx6.media1.z0.glb.clouddn.com/2015-07-10_559fe562b2c62.jpg"></a><a
								data-id="6" data-action="fav" href="javascript:;" title="收藏"
								class="music-action-btn icon-star"><span class="num">0</span></a>
						</div></li>
					<li><div class="zan">
							<a href="javascript:;" class="collect music-action-btn"
								data-id="7" data-action="recommend"><i
								class=" icon-thumbs-up"></i><b><span class="num">2</span></b></a>
						</div>
						<div class="indextitle">
							<h2>
								<a href="/music/detail/id/7.html"
									title=" 很流行的 Pround of you samira " target="_blank">很流行的
									Pround of you samira</a>
							</h2>
							<p>
								<a class="jp-play-me icon-play" data-id="7" href="javascript:;">
									播放</a>
								<!--    <span class="indextag"><a class="color_dark" href="/album/detail/id/1.html">爱，希望的翅膀</a></span>-->
							</p>
						</div>
						<div class="hidden-xs img">
							<a href="/music/detail/id/7.html"><img
								src="http://7xjvx6.media1.z0.glb.clouddn.com/2015-07-12_55a1c197cd079.jpg"></a><a
								data-id="7" data-action="fav" href="javascript:;" title="收藏"
								class="music-action-btn icon-star"><span class="num">1</span></a>
						</div></li>
					<li><div class="zan">
							<a href="javascript:;" class="collect music-action-btn"
								data-id="8" data-action="recommend"><i
								class=" icon-thumbs-up"></i><b><span class="num">3</span></b></a>
						</div>
						<div class="indextitle">
							<h2>
								<a href="/music/detail/id/8.html"
									title=" 很不错的摇滚 Civil War -  Slash " target="_blank">很不错的摇滚
									Civil War - Slash</a>
							</h2>
							<p>
								<a class="jp-play-me icon-play" data-id="8" href="javascript:;">
									播放</a>
								<!--    <span class="indextag"><a class="color_dark" href="/album/detail/id/2.html">北京申奥成功，国家强大了！</a></span>-->
							</p>
						</div>
						<div class="hidden-xs img">
							<a href="/music/detail/id/8.html"><img
								src="http://7xjvx6.media1.z0.glb.clouddn.com/2015-07-11_55a120637b8ac.jpg"></a><a
								data-id="8" data-action="fav" href="javascript:;" title="收藏"
								class="music-action-btn icon-star"><span class="num">0</span></a>
						</div></li>
					<li><div class="zan">
							<a href="javascript:;" class="collect music-action-btn"
								data-id="9" data-action="recommend"><i
								class=" icon-thumbs-up"></i><b><span class="num">2</span></b></a>
						</div>
						<div class="indextitle">
							<h2>
								<a href="/music/detail/id/9.html"
									title=" 来自印度的 Kelmet Bahebbek Jannat " target="_blank">来自印度的
									Kelmet Bahebbek Jannat</a>
							</h2>
							<p>
								<a class="jp-play-me icon-play" data-id="9" href="javascript:;">
									播放</a>
								<!--    <span class="indextag"><a class="color_dark" href="/album/detail/id/3.html">告别印象主义</a></span>-->
							</p>
						</div>
						<div class="hidden-xs img">
							<a href="/music/detail/id/9.html"><img
								src="http://7xjvx6.media1.z0.glb.clouddn.com/2015-07-11_55a122e88f8c6.jpg"></a><a
								data-id="9" data-action="fav" href="javascript:;" title="收藏"
								class="music-action-btn icon-star"><span class="num">0</span></a>
						</div></li>
					<li><div class="zan">
							<a href="javascript:;" class="collect music-action-btn"
								data-id="10" data-action="recommend"><i
								class=" icon-thumbs-up"></i><b><span class="num">2</span></b></a>
						</div>
						<div class="indextitle">
							<h2>
								<a href="/music/detail/id/10.html"
									title=" 泛西很好听的男声 Snow(Hey oh) " target="_blank">泛西很好听的男声
									Snow(Hey oh)</a>
							</h2>
							<p>
								<a class="jp-play-me icon-play" data-id="10" href="javascript:;">
									播放</a>
								<!--    <span class="indextag"><a class="color_dark" href="/album/detail/id/1.html">爱，希望的翅膀</a></span>-->
							</p>
						</div>
						<div class="hidden-xs img">
							<a href="/music/detail/id/10.html"><img
								src="http://7xjvx6.media1.z0.glb.clouddn.com/2015-07-11_55a126870b63b.jpg"></a><a
								data-id="10" data-action="fav" href="javascript:;" title="收藏"
								class="music-action-btn icon-star"><span class="num">1</span></a>
						</div></li>
				</ul>
			</div>
			<div class="row indexlist tabactive" id="tabpush">
				<ul>
					<li><div class="zan">
							<a href="javascript:;" class="collect music-action-btn"
								data-id="166" data-action="recommend"><i
								class=" icon-thumbs-up"></i><b><span class="num">6</span></b></a>
						</div>
						<div class="indextitle">
							<h2>
								<a href="/music/detail/id/166.html"
									title=" 超赞！Love to be loved by you - Marc Terenzi "
									target="_blank">超赞！Love to be loved by you - Marc Terenzi</a>
							</h2>
							<p>
								<a class="jp-play-me icon-play" data-id="166"
									href="javascript:;">播放 </a>
								<!--    <span class="indextag"><a class="color_dark" href="/album/detail/id/17.html">我知道一种信仰</a></span>-->
							</p>
						</div>
						<div class="hidden-xs img">
							<a href="/music/detail/id/166.html"><img
								src="http://7xjvx6.media1.z0.glb.clouddn.com/2015-09-26_560699a5552da.jpg"></a><a
								data-id="166" data-action="fav" href="javascript:;" title="收藏"
								class="music-action-btn icon-star"><span class="num">2</span></a>
						</div></li>
					<li><div class="zan">
							<a href="javascript:;" class="collect music-action-btn"
								data-id="1" data-action="recommend"><i
								class=" icon-thumbs-up"></i><b><span class="num">8</span></b></a>
						</div>
						<div class="indextitle">
							<h2>
								<a href="/music/detail/id/1.html"
									title=" Bleu noir  - Mylene Farmer 幽暗深处的法国女声 " target="_blank">Bleu
									noir - Mylene Farmer 幽暗深处的法国女声</a>
							</h2>
							<p>
								<a class="jp-play-me icon-play" data-id="1" href="javascript:;">播放
								</a>
								<!--    <span class="indextag"><a class="color_dark" href="/album/detail/id/1.html">爱，希望的翅膀</a></span>-->
							</p>
						</div>
						<div class="hidden-xs img">
							<a href="/music/detail/id/1.html"><img
								src="http://7xjvx6.media1.z0.glb.clouddn.com/2015-07-14_55a4650777125.jpg"></a><a
								data-id="1" data-action="fav" href="javascript:;" title="收藏"
								class="music-action-btn icon-star"><span class="num">4</span></a>
						</div></li>
					<li><div class="zan">
							<a href="javascript:;" class="collect music-action-btn"
								data-id="2" data-action="recommend"><i
								class=" icon-thumbs-up"></i><b><span class="num">5</span></b></a>
						</div>
						<div class="indextitle">
							<h2>
								<a href="/music/detail/id/2.html"
									title=" La Camisa Negra 经典气氛电音 你值得拥有 " target="_blank">La
									Camisa Negra 经典气氛电音 你值得拥有</a>
							</h2>
							<p>
								<a class="jp-play-me icon-play" data-id="2" href="javascript:;">播放
								</a>
								<!--    <span class="indextag"><a class="color_dark" href="/album/detail/id/2.html">北京申奥成功，国家强大了！</a></span>-->
							</p>
						</div>
						<div class="hidden-xs img">
							<a href="/music/detail/id/2.html"><img
								src="http://7xjvx6.media1.z0.glb.clouddn.com/2015-07-12_55a1c1c38afca.jpg"></a><a
								data-id="2" data-action="fav" href="javascript:;" title="收藏"
								class="music-action-btn icon-star"><span class="num">4</span></a>
						</div></li>
					<li><div class="zan">
							<a href="javascript:;" class="collect music-action-btn"
								data-id="3" data-action="recommend"><i
								class=" icon-thumbs-up"></i><b><span class="num">4</span></b></a>
						</div>
						<div class="indextitle">
							<h2>
								<a href="/music/detail/id/3.html" title=" 黑人喊麦夜店开场女唱越鼓澎湃节奏DJ "
									target="_blank">黑人喊麦夜店开场女唱越鼓澎湃节奏DJ</a>
							</h2>
							<p>
								<a class="jp-play-me icon-play" data-id="3" href="javascript:;">播放
								</a>
								<!--    <span class="indextag"><a class="color_dark" href="/album/detail/id/2.html">北京申奥成功，国家强大了！</a></span>-->
							</p>
						</div>
						<div class="hidden-xs img">
							<a href="/music/detail/id/3.html"><img
								src="http://7xjvx6.media1.z0.glb.clouddn.com/2015-07-10_559fc1eceabeb.jpg"></a><a
								data-id="3" data-action="fav" href="javascript:;" title="收藏"
								class="music-action-btn icon-star"><span class="num">3</span></a>
						</div></li>
					<li><div class="zan">
							<a href="javascript:;" class="collect music-action-btn"
								data-id="4" data-action="recommend"><i
								class=" icon-thumbs-up"></i><b><span class="num">4</span></b></a>
						</div>
						<div class="indextitle">
							<h2>
								<a href="/music/detail/id/4.html"
									title=" Nico & Vinz - Am I Wrong " target="_blank">Nico &
									Vinz - Am I Wrong</a>
							</h2>
							<p>
								<a class="jp-play-me icon-play" data-id="4" href="javascript:;">播放
								</a>
								<!--    <span class="indextag"><a class="color_dark" href="/album/detail/id/3.html">告别印象主义</a></span>-->
							</p>
						</div>
						<div class="hidden-xs img">
							<a href="/music/detail/id/4.html"><img
								src="http://7xjvx6.media1.z0.glb.clouddn.com/2015-07-10_559fcc05ad42d.jpg"></a><a
								data-id="4" data-action="fav" href="javascript:;" title="收藏"
								class="music-action-btn icon-star"><span class="num">1</span></a>
						</div></li>
					<li><div class="zan">
							<a href="javascript:;" class="collect music-action-btn"
								data-id="5" data-action="recommend"><i
								class=" icon-thumbs-up"></i><b><span class="num">3</span></b></a>
						</div>
						<div class="indextitle">
							<h2>
								<a href="/music/detail/id/5.html" title=" 超好听的磁性宏厚女声 "
									target="_blank">超好听的磁性宏厚女声</a>
							</h2>
							<p>
								<a class="jp-play-me icon-play" data-id="5" href="javascript:;">播放
								</a>
								<!--    <span class="indextag"><a class="color_dark" href="/album/detail/id/1.html">爱，希望的翅膀</a></span>-->
							</p>
						</div>
						<div class="hidden-xs img">
							<a href="/music/detail/id/5.html"><img
								src="http://7xjvx6.media1.z0.glb.clouddn.com/2015-07-10_559fcefd0cbf9.jpg"></a><a
								data-id="5" data-action="fav" href="javascript:;" title="收藏"
								class="music-action-btn icon-star"><span class="num">1</span></a>
						</div></li>
					<li><div class="zan">
							<a href="javascript:;" class="collect music-action-btn"
								data-id="6" data-action="recommend"><i
								class=" icon-thumbs-up"></i><b><span class="num">4</span></b></a>
						</div>
						<div class="indextitle">
							<h2>
								<a href="/music/detail/id/6.html" title=" 经典中的Brother Louie "
									target="_blank">经典中的Brother Louie</a>
							</h2>
							<p>
								<a class="jp-play-me icon-play" data-id="6" href="javascript:;">播放
								</a>
								<!--    <span class="indextag"><a class="color_dark" href="/album/detail/id/3.html">告别印象主义</a></span>-->
							</p>
						</div>
						<div class="hidden-xs img">
							<a href="/music/detail/id/6.html"><img
								src="http://7xjvx6.media1.z0.glb.clouddn.com/2015-07-10_559fe562b2c62.jpg"></a><a
								data-id="6" data-action="fav" href="javascript:;" title="收藏"
								class="music-action-btn icon-star"><span class="num">0</span></a>
						</div></li>
					<li><div class="zan">
							<a href="javascript:;" class="collect music-action-btn"
								data-id="7" data-action="recommend"><i
								class=" icon-thumbs-up"></i><b><span class="num">2</span></b></a>
						</div>
						<div class="indextitle">
							<h2>
								<a href="/music/detail/id/7.html"
									title=" 很流行的 Pround of you samira " target="_blank">很流行的
									Pround of you samira</a>
							</h2>
							<p>
								<a class="jp-play-me icon-play" data-id="7" href="javascript:;">播放
								</a>
								<!--    <span class="indextag"><a class="color_dark" href="/album/detail/id/1.html">爱，希望的翅膀</a></span>-->
							</p>
						</div>
						<div class="hidden-xs img">
							<a href="/music/detail/id/7.html"><img
								src="http://7xjvx6.media1.z0.glb.clouddn.com/2015-07-12_55a1c197cd079.jpg"></a><a
								data-id="7" data-action="fav" href="javascript:;" title="收藏"
								class="music-action-btn icon-star"><span class="num">1</span></a>
						</div></li>
					<li><div class="zan">
							<a href="javascript:;" class="collect music-action-btn"
								data-id="8" data-action="recommend"><i
								class=" icon-thumbs-up"></i><b><span class="num">3</span></b></a>
						</div>
						<div class="indextitle">
							<h2>
								<a href="/music/detail/id/8.html"
									title=" 很不错的摇滚 Civil War -  Slash " target="_blank">很不错的摇滚
									Civil War - Slash</a>
							</h2>
							<p>
								<a class="jp-play-me icon-play" data-id="8" href="javascript:;">播放
								</a>
								<!--    <span class="indextag"><a class="color_dark" href="/album/detail/id/2.html">北京申奥成功，国家强大了！</a></span>-->
							</p>
						</div>
						<div class="hidden-xs img">
							<a href="/music/detail/id/8.html"><img
								src="http://7xjvx6.media1.z0.glb.clouddn.com/2015-07-11_55a120637b8ac.jpg"></a><a
								data-id="8" data-action="fav" href="javascript:;" title="收藏"
								class="music-action-btn icon-star"><span class="num">0</span></a>
						</div></li>
					<li><div class="zan">
							<a href="javascript:;" class="collect music-action-btn"
								data-id="9" data-action="recommend"><i
								class=" icon-thumbs-up"></i><b><span class="num">2</span></b></a>
						</div>
						<div class="indextitle">
							<h2>
								<a href="/music/detail/id/9.html"
									title=" 来自印度的 Kelmet Bahebbek Jannat " target="_blank">来自印度的
									Kelmet Bahebbek Jannat</a>
							</h2>
							<p>
								<a class="jp-play-me icon-play" data-id="9" href="javascript:;">播放
								</a>
								<!--    <span class="indextag"><a class="color_dark" href="/album/detail/id/3.html">告别印象主义</a></span>-->
							</p>
						</div>
						<div class="hidden-xs img">
							<a href="/music/detail/id/9.html"><img
								src="http://7xjvx6.media1.z0.glb.clouddn.com/2015-07-11_55a122e88f8c6.jpg"></a><a
								data-id="9" data-action="fav" href="javascript:;" title="收藏"
								class="music-action-btn icon-star"><span class="num">0</span></a>
						</div></li>
				</ul>
			</div>
			<!--列表结束-->
			<div
				style="text-align:center;margin-top:20px;width:100%;font-size:16px;">
				<a href="/genre/index/p/2.html"
					style="display:inline-block;background:#eee;padding:5px 20px;">更多新单...</a>
			</div>
		</div>
		<div class="container">
			<a href="http://www.miwuqu.com/" target="_blank"><img
				src="http://www.miwuqu.com/style/images/760x90.gif"></a>
		</div>
		<!--专辑-->
		<div class="mtop30 indexbottom">
			<h2>
				新建歌单 <a class="icon-double-angle-right pull-right"
					href="/index.php?m=&c=album&a=index"></a>
			</h2>
			<span class="col-md-6"><h4>
					<a href="/album/detail/id/56.html" title="老来多健忘" target="_blank"><img
						src="http://7xjvx6.media1.z0.glb.clouddn.com/2016-07-24_5794383c19cda.jpg"></a>
				</h4>
				<h3>
					<a title="老来多健忘" target="_blank" href="/album/detail/id/56.html">老来多健忘</a><a
						class=" pull-right music-action-btn" data-id="56"
						data-action="recommend" data-type="album" href="javascript:;"><i
						class="icon-thumbs-up"></i> 赞(0) </a>
				</h3>
				<p>在我的印象中，祖父不过是一个喜欢打麻将、练太...</p>
				<!--
     <p><a class=" music-action-btn" data-id="56" data-action="recommend" data-type="album" href="javascript:;"><i class="icon-thumbs-up"></i> 赞(0) </a>
         &nbsp; &nbsp;<i class="icon-time"></i> 2016-07-24         &nbsp; &nbsp;<i class="icon-eye-open pull-right"> 18</i></p>--></span><span
				class="col-md-6"><h4>
					<a href="/album/detail/id/55.html" title="时间即生命" target="_blank"><img
						src="http://7xjvx6.media1.z0.glb.clouddn.com/2016-07-17_578b816ad8bb1.jpg"></a>
				</h4>
				<h3>
					<a title="时间即生命" target="_blank" href="/album/detail/id/55.html">时间即生命</a><a
						class=" pull-right music-action-btn" data-id="55"
						data-action="recommend" data-type="album" href="javascript:;"><i
						class="icon-thumbs-up"></i> 赞(1) </a>
				</h3>
				<p>最令人怵目惊心的一件事，是看着钟表上的秒针一...</p>
				<!--
     <p><a class=" music-action-btn" data-id="55" data-action="recommend" data-type="album" href="javascript:;"><i class="icon-thumbs-up"></i> 赞(1) </a>
         &nbsp; &nbsp;<i class="icon-time"></i> 2016-07-17         &nbsp; &nbsp;<i class="icon-eye-open pull-right"> 42</i></p>--></span><span
				class="col-md-6"><h4>
					<a href="/album/detail/id/54.html" title="寂寞的感觉" target="_blank"><img
						src="http://7xjvx6.media1.z0.glb.clouddn.com/2016-07-09_5780c23196856.jpg"></a>
				</h4>
				<h3>
					<a title="寂寞的感觉" target="_blank" href="/album/detail/id/54.html">寂寞的感觉</a><a
						class=" pull-right music-action-btn" data-id="54"
						data-action="recommend" data-type="album" href="javascript:;"><i
						class="icon-thumbs-up"></i> 赞(2) </a>
				</h3>
				<p>你一定也有过这种感觉。当你心事重重， 渴望找...</p>
				<!--
     <p><a class=" music-action-btn" data-id="54" data-action="recommend" data-type="album" href="javascript:;"><i class="icon-thumbs-up"></i> 赞(2) </a>
         &nbsp; &nbsp;<i class="icon-time"></i> 2016-07-09         &nbsp; &nbsp;<i class="icon-eye-open pull-right"> 76</i></p>--></span><span
				class="col-md-6"><h4>
					<a href="/album/detail/id/53.html" title="我的愿望" target="_blank"><img
						src="http://7xjvx6.media1.z0.glb.clouddn.com/2016-06-10_575ac24d1fd00.jpg"></a>
				</h4>
				<h3>
					<a title="我的愿望" target="_blank" href="/album/detail/id/53.html">我的愿望</a><a
						class=" pull-right music-action-btn" data-id="53"
						data-action="recommend" data-type="album" href="javascript:;"><i
						class="icon-thumbs-up"></i> 赞(2) </a>
				</h3>
				<p>我要一间自己的书房，可以安心工作。并不要怎样...</p>
				<!--
     <p><a class=" music-action-btn" data-id="53" data-action="recommend" data-type="album" href="javascript:;"><i class="icon-thumbs-up"></i> 赞(2) </a>
         &nbsp; &nbsp;<i class="icon-time"></i> 2016-06-10         &nbsp; &nbsp;<i class="icon-eye-open pull-right"> 149</i></p>--></span>
		</div>
		<!--专辑-->
	</div>
	<link rel="stylesheet" href="/Public/static/player/jplayer.flat.css"
		type="text/css" />
	<link href="/newstyle/css/font-awesome.min.css" rel="stylesheet">
	<section class="player" id="footer-player">
		<div id="p-artist" class="artist col-lg-1 playnone">
			<img alt="" class="dker f_right" src="/newstyle/images/fp_1.jpg">
		</div>
		<div id="jp_container_N" class="col-lg-10">
			<div class="jp-type-playlist">
				<div id="jplayer_N" class="jp-jplayer hide"></div>
				<div class="jp-gui">
					<div class="jp-video-play hide">
						<a class="jp-video-play-fa fa">play</a>
					</div>
					<div class="jp-interface">
						<div class="jp-controls">
							<div>
								<a class="jp-previous"><i class="fa fa-fast-backward i-lg"></i></a>
							</div>
							<div>
								<a class="jp-play"><i class="fa fa-play i-2x"></i></a><a
									class="jp-pause hid"><i class="fa fa-pause i-2x"></i></a>
							</div>
							<div>
								<a class="jp-next"><i class="fa fa-fast-forward i-lg"></i></a>
							</div>
							<div class="hide">
								<a class="jp-stop"><i class="fa fa-stop"></i></a>
							</div>
							<div class="jp-progress">
								<div class="jp-seek-bar dk" id="jp-seek-bar">
									<div class="jp-play-bar bg-info"></div>
									<div class="jp-title"></div>
								</div>
							</div>
							<div class="jp-current-time text-xs text-muted"></div>
							<div class="jp-duration playnone text-xs text-muted"></div>
							<div class=" ">
								<a class="jp-mute" title="静音"><i class="fa fa-volume-up"></i></a><a
									class="jp-unmute hid" title="取消静音"><i
									class="fa fa-volume-off"></i></a>
							</div>
							<div class="jp-volume">
								<div class="jp-volume-bar dk">
									<div class="jp-volume-bar-value lter"></div>
								</div>
							</div>
							<!--div><a class="jp-shuffle" title="随机"><i class="fa fa-random text-muted"></i></a><a class="jp-shuffle-off hid" title="关闭 随机"><i class="fa fa-random text-lt"></i></a></div-->
							<div>
								<a class="jp-repeat" title="单曲重复"><i class="fa fa-random"></i></a><a
									class="jp-repeat-off hid" title="顺序播放"><i
									class="fa fa-retweet text-lt"></i></a>
							</div>
							<div>
								<a class="" data-toggle="dropdown" data-target="#playlist"><i
									class="fa fa-list"></i></a>
							</div>
							<div class="hide">
								<a class="jp-full-screen" title="全屏 "><i
									class="fa fa-expand"></i></a><a class="jp-restore-screen"
									title="恢复屏幕"><i class="fa fa-compress text-lt"></i></a>
							</div>
						</div>
					</div>
				</div>
				<div class="jp-playlist dker dropup row col-lg-6 col-md-8 col-sm-9"
					id="playlist">
					<h4 class="col-lg-12">
						<i class="fa fa-clock-o"></i> 播放记录
					</h4>
					<ul class="col-lg-12">
						<li></li>
					</ul>
				</div>
				<div id="player_off">
					<a class="lock-on" href="#" title=""><i class="fa fa-unlock"></i></a><a
						class="lock-off d_none" href="#" title=""><i
						class="fa fa-unlock-alt"></i></a>
				</div>
				<div class="jp-no-solution hide">
					<span>Update Required</span> To play the media you will need to
					either update your browser to a recent version or update your <a
						href="http://get.adobe.com/flashplayer/" target="_blank">Flash
						plugin</a>.

				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript"
		src="/Public/static/player/jquery.jplayer.min.js"></script>
	<script type="text/javascript" src="/newstyle/js/jy_play.js"></script>
	<!--底部播放器-->
	<div class="container-fuild mtop30 footer">
		<div class="container">
			<div class="link">
				<!-- 普通友情链接 -->
				<li><i class="fa fa-link f_size_small scheme_color m_right_5"></i><a
					href="http://www.zanyy.com/" target="_blank">赞音乐</a></li>
				<li><i class="fa fa-link f_size_small scheme_color m_right_5"></i><a
					href="http://www.rkidc.net/?refcode=fc06016316" target="_blank">稳定免备案主机</a></li>
				<li><i class="fa fa-link f_size_small scheme_color m_right_5"></i><a
					href="https://portal.qiniu.com/signup?code=3llacz4n9w7de"
					target="_blank">七牛免费存</a></li>
				<li><i class="fa fa-link f_size_small scheme_color m_right_5"></i><a
					href="http://www.jyuu.cn/" target="_blank">JYMUSIC</a></li>
				<li><i class="fa fa-link f_size_small scheme_color m_right_5"></i><a
					href="http://onijiang.com/" target="_blank">欧尼酱二次元</a></li>
				<li><i class="fa fa-link f_size_small scheme_color m_right_5"></i><a
					href="http://manpin.net/" target="_blank">慢品音乐电台</a></li>
				<li><i class="fa fa-link f_size_small scheme_color m_right_5"></i><a
					href="http://zhangjinkun.com/" target="_blank">ROOEYE</a></li>
				<li><i class="fa fa-link f_size_small scheme_color m_right_5"></i><a
					href="http://lanyes.org" target="_blank">蓝叶博客</a></li>
				<li><i class="fa fa-link f_size_small scheme_color m_right_5"></i><a
					href="http://2b.oldgo.net" target="_blank">老去</a></li>
				<li><i class="fa fa-link f_size_small scheme_color m_right_5"></i><a
					href="http://www.caotama.com/" target="_blank">操他妈</a></li>
				<li><i class="fa fa-link f_size_small scheme_color m_right_5"></i><a
					href="http://www.miwuqu.com/" target="_blank">迷舞曲</a></li>
				<li><i class="fa fa-link f_size_small scheme_color m_right_5"></i><a
					href="http://www.qiqiaoge.com/" target="_blank">奇巧阁</a></li>
				<li><i class="fa fa-link f_size_small scheme_color m_right_5"></i><a
					href="http://www.mc678.com/" target="_blank">MC语录网</a></li>
				<li><i class="fa fa-link f_size_small scheme_color m_right_5"></i><a
					href="http://www.1616dh.com/" target="_blank">1616网址导航</a></li>
				<li><i class="fa fa-link f_size_small scheme_color m_right_5"></i><a
					href="http://guo.lu/" target="_blank">素锦</a></li>
				<li><i class="fa fa-link f_size_small scheme_color m_right_5"></i><a
					href="http://www.liaoo.net/" target="_blank">料网</a></li>
				<li><i class="fa fa-link f_size_small scheme_color m_right_5"></i><a
					href="http://www.baidu.com" target="_blank">百度</a></li>
			</div>
			<div class="guanzhu">
				<span>关注: <a class="icon-wechat" href="#"> 微信</a><a
					href="http://www.ipads.cc" target="_blank">博客</a><a class="icon-qq"
					href="http://shang.qq.com/wpa/qunwpa?idkey=d792ab6762dd70ae3b45f6d0bd1d226f6b3e16de0f1003545963a2bbb953976f"
					target="_blank"> Q群: 470917485 </a></span><span
					class="pull-right hidden-xs"> 程序：By <a
					href="http://www.jyuu.cn/" target="_blank">JYmusic</a></span>
			</div>
			<div class="about">
				<span>© ZanYY.Com 赞音乐 All Rights Reserved. </span><span
					class="pull-right"> 内容许可:除特别说明外，用户内容均采用<a
					href="http://creativecommons.org/licenses/by-sa/3.0/cn/"
					target="_blank">《知识共享署名-相同方式共享 3.0 中国大陆许可协议》</a> 进行许可
				</span>
			</div>
		</div>
	</div>
	<a class="gotop icon-collapse-top" href="javascript:;"></a>
	<!--[if lt IE 9]><script src="http://7xlj2j.com1.z0.glb.clouddn.com/newstyle/js/ieonly/html5shiv.js"></script><script src="http://7xlj2j.com1.z0.glb.clouddn.com/newstyle/js/ieonly/respond.js"></script><script src="http://7xlj2j.com1.z0.glb.clouddn.com/newstyle/js/ieonly/excanvas.js"></script><![endif]-->
	
	<div class="hidden">
		<!-- 用于加载统计代码等隐藏元素 -->
		<script type="text/javascript"
			src="http://tajs.qq.com/stats?sId=52905562" charset="UTF-8"></script>
		<script type="text/javascript">
							
		</script>
	</div>
</body>
</html>