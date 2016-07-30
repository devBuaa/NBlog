<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>牛逼日志 - 带你装逼带你飞</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<link type="text/css" rel="stylesheet"
	href="<%=basePath%>css/zui.min.css" />
<link type="text/css" rel="stylesheet"
	href="<%=basePath%>css/zui-theme.min.css" />
	<link type="text/css" rel="stylesheet"
	href="<%=basePath%>css/doc.min.css" />
<!-- Load Javascript -->
<script type="text/javascript" src="<%=basePath%>js/zui.min.js"></script>
<script src="<%=basePath%>lib/ieonly/html5shiv.js"></script>
<script src="<%=basePath%>lib/ieonly/respond.js"></script>
<script src="<%=basePath%>lib/ieonly/excanvas.js"></script>
<script src="<%=basePath%>js/jquery-2.1.1.min.js"></script>
<script src="<%=basePath%>js/popover.js"></script>
<!-- 增强文档插件 -->
<script src="<%=basePath%>js/doc.min.js"></script>
<script src="<%=basePath%>lib/prettify/prettify.js"></script>
<!-- // Load Javascipt -->


</head>
 <body>
 	<header id="header" class="bg-primary">
	<div class="navbar navbar-inverse  navbar-fixed-top" id="navbar"
		role="banner">
		<div class="container">
			<div class="navbar-header">
				<a href="<%=basePath%>" class="navbar-brand"> <span
					class="brand-title">NBLog</span> &nbsp; <i data-toggle="tooltip"
					id="compactTogger" data-placement="bottom" class="icon icon-home"></i></a>
			</div>
			<nav class="collapse navbar-collapse zui-navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li class="navLoginLink"><a title="登陆"> <i
						class="icon icon-signin" data-toggle="popover"
						data-placement="left" data-target="$next"></i><span> 登陆</span></a></li>
				<li><a title="注册" href="register" target="_blank"><i
						class="icon icon-user"></i><span>注册</span></a></li>
				<li><a title="在Github上Star项目"
					href="https://github.com/devBuaa/NBlog" target="_blank"><i
						class="icon icon-github"></i><span> Star</span></a></li>
			</ul>
			</nav>
		</div>
	</div>
	<div id="headContainer">
        <div class="container">
          <div id="heading">
            <h1>NBLog</h1>
            <p>牛逼日志</p>
          </div>
          <div id="search">
            <div id="searchForm">
              <input type="text" class="form-control input-lg" id="searchInput" placeholder=""/>
              <i class="icon icon-search"></i>
              <button id="searchHelpBtn" type="button" class="btn btn-link"><i class="icon icon-question"></i></button>
            </div>
          </div>
        </div>
      </div>
    </header>

    <div id="page">
      <div id="pageHeader">
        <div class="wrapper container">
          <i class="icon icon-star"></i>
          <h2><a class="name" href="###">图标</a></h2>
          <button type="button" class="btn btn-link" id="pageTogger" title="折叠/展开 章节" data-toggle="tooltip"></button>
          <button data-toggle="tooltip" title="关闭（ESC）" type="button" class="btn btn-link path-close-btn path-btn" id="pageCloseBtn"><i class="path-1"></i></button>
        </div>
      </div>
      <div id="pageBody" class="scrollbar-hover">
        <div class="container">
          <div id="pageAttrs" class="clearfix">
            <div class="badge badge-zui" style="display: none" data-toggle="tooltip" title="此组件在标准版中提供">ZUI</div>
            <div class="badge badge-lite" style="display: none" data-toggle="tooltip" title="此组件在简洁版中提供">LITE</div>
            <div class="badge badge-lib" style="display: none" data-toggle="tooltip" title="此组件在lib目录中单独提供">LIB</div>
            <a class="badge badge-party" style="display: none" data-toggle="tooltip" title="这是第三方组件，点击访问网站" target="_blank"><i class="icon icon-heart"></i> <span class="product-ver"></span></a>
            <div class="badge badge-custom" style="display: none" data-toggle="tooltip" title="此组件可以拆分使用"><i class="icon icon-cogs"></i></div>
            <div class="badge badge-version" style="display: none" data-toggle="tooltip" title="此组件的最早提供版本">1.2.0+</div>
            <div class="badge badge-author hidden" data-toggle="tooltip" title="本文档作者"><i class="icon icon-user"></i> <span class="author-name">Catouse</span></div>

            <a href="#" target="_blank" class="badge badge-source pull-right" data-toggle="tooltip" title="访问文档源码，Fork项目来完善文档"><i class="icon icon-pencil"></i></a>
            <div class='dropdown pull-right badge-code-dropdown'>
              <button type="button" data-toggle="dropdown" title="查看源码和打包信息" class="badge btn btn-link badge-code pull-right"><span class="badge-code-source"><i class="icon icon-file-code"></i> <span class="count"></span></span><span class="badge-code-pkgs"><i class="icon icon-cube"></i> <span class="count"></span></span></button>
              <ul class="dropdown-menu"></ul>
            </div>
          </div>
        </div>
        <div class="loader" id="pageLoader"><i class="icon icon-spin icon-spinner-indicator"></i> <span class="loading-text">加载中...</span><span class="error-text">加载失败，请检查网络重试。<br>另一个导致无法加载文档的原因可能是该文档尚未完成。<br>欢迎你在 <a href="https://github.com/easysoft/zui">Github</a> 上 <a href="https://github.com/easysoft/zui/fork">Fork</a> 项目来完善文档。</span></div>
        <div class="container">
          <div id="pageContent"></div>
          <nav></nav>
        </div>
      </div>
    </div>

    <div class="text-muted loader loading"><i class="icon icon-spin icon-spinner-indicator"></i> 加载中...</div>

    <div id="grid">
      <div class="container">
        <div class="row">
          <div class="col col-md-d5 col-sm-6">
            <div class="chapter" id="chapter-basic" data-id="basic">
              <div class="chapter-heading fade scale show">
                <h4><i class="icon icon-book"></i> <span class='name'>基础</span></h4>
              </div>
              <div class="chapter-body" id="sections-basic">
              </div>
            </div>
          </div>
          <div class="col col-md-d5 col-sm-6">
            <div class="chapter" id="chapter-control" data-id="control">
              <div class="chapter-heading fade scale show">
                <h4><i class="icon icon-check-empty"></i> <span class='name'>控件</span></h4>
              </div>
              <div class="chapter-body" id="sections-control">
              </div>
            </div>
          </div>
          <div class="col col-md-d5 col-sm-6">
            <div class="chapter" id="chapter-component" data-id="component">
              <div class="chapter-heading fade scale show">
                <h4><i class="icon icon-columns"></i> <span class='name'>组件</span></h4>
              </div>
              <div class="chapter-body" id="sections-component">
              </div>
            </div>
          </div>
          <div class="col col-md-d5 col-sm-6">
            <div class="chapter" id="chapter-javascript" data-id="javascript">
              <div class="chapter-heading fade scale show">
                <h4><i class="icon icon-magic"></i> <span class='name'>JS插件</span></h4>
              </div>
              <div class="chapter-body" id="sections-javascript">
              </div>
            </div>
          </div>
          <div class="col col-md-d5 col-sm-6">
            <div class="chapter" id="chapter-view" data-id="view">
              <div class="chapter-heading fade scale show">
                <h4><i class="icon icon-list-alt"></i> <span class='name'>视图</span></h4>
              </div>
              <div class="chapter-body" id="sections-view">
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col col-md-3 col-sm-6">
            <div class="chapter" id="chapter-learn" data-id="learn">
              <div class="chapter-heading fade scale show">
                <h4><i class="icon icon-node"></i> <span class='name'>交流探索</span></h4>
              </div>
              <div class="chapter-body" id="sections-learn">
              </div>
            </div>
          </div>
          <div class="col col-md-3 col-sm-6">
            <div class="chapter" id="chapter-promotion" data-id="promotion">
              <div class="chapter-heading fade scale show">
                <h4><i class="icon icon-diamond"></i> <span class='name'>推荐</span></h4>
              </div>
              <div class="chapter-body" id="sections-promotion">
              </div>
            </div>
          </div>
          <div class="col col-md-3 col-sm-6">
            <div class="chapter" id="chapter-resource" data-id="resource">
              <div class="chapter-heading fade scale show">
                <h4><i class="icon icon-coffee"></i> <span class='name'>更多资源</span></h4>
              </div>
              <div class="chapter-body" id="sections-resource">
              </div>
            </div>
          </div>
          <div class="col col-md-3 col-sm-6">
            <div class="chapter" id="chapter-contribution" data-id="contribution">
              <div class="chapter-heading fade scale show">
                <h4><i class="icon icon-heart"></i> <span class='name'>贡献</span></h4>
              </div>
              <div class="chapter-body" id="sections-contribution">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <footer>
      <div class="container">
        <hr>
        <p class="text-muted"><small>文档版本 <span class="doc-version"><i class="icon icon-spin icon-spinner-indicator"></i></span></small></p>
      </div>
    </footer>
 
    <!-- 一些html模板代码片段 -->
    <div class="template">
      <div class="card section fade scale slide-in-up-100 slide-in-right-50" id="sectionTemplate">
        <div class="card-heading">
          <i class="icon"></i>
          <h5><a class="name" href="###"></a></h5>
        </div>
        <div class="card-content">
          <ul class="topics">
          </ul>
        </div>
      </div>
      <div class="card-content section-preview icon-preview" id="iconPreviewTemplate">
        <div class="icons"><i class="icon icon-10x"></i><i class="icon icon-5x"></i><i class="icon icon-2x"></i><i class="icon"></i></div>
        <h3><small><i class="icon "></i></small> <span class="name color-accent"></span>  <small>Unicode: \<span class="unicode">f3dd</span><span class="alias"> · 别名：<span class="alias-values"></span></span></small></h3>
        <pre class="copyable"><code><span class="tag">&lt;i</span><span class="pln"> </span><span class="atn">class</span><span class="pun">=</span><span class="atv">&quot;icon <em class="name"></em>&quot;</span><span class="tag">&gt;&lt;/i&gt;</span></code></pre>
      </div>
      <button id="copyCodeBtn" data-html="true" data-animation="false" data-toggle="tooltip" data-title="复制代码" type="button" class="btn btn-copy-code"  data-tip-id="copyCodeTip"><i class="icon icon-copy"></i></button>
    </div>

    <!-- jQuery (ZUI中的Javascript组件依赖于jQuery) -->
    <script src="assets/jquery.js"></script>
    <script src="assets/clipboard/clipboard.min.js"></script>
    <script src="assets/less/less.min.js"></script>

    <!-- ZUI Javascript组件 -->
    <script src="docs/js/zui.min.js"></script>
    <script src="docs/js/doc.min.js"></script>

    <!-- 增强文档插件 -->
    <script async src="assets/prettify/prettify.js"></script>
    <script async src="assets/marked/marked.min.js"></script>

    <!-- Statistic -->
    <div class="hide"><script src="http://s95.cnzz.com/stat.php?id=1253026255&web_id=1253026255"></script></div>
    <script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

      ga('create', 'UA-53781622-1', 'auto');
      ga('send', 'pageview');
    </script>
  </body>
</html>
