<#assign ContextPath=springMacroRequestContext.getContextPath() />
<!DOCTYPE html>
<htm>
	<head>
		<meta charset="utf-8" />
		<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
		<title>BI Server</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<link href="${ContextPath}/assets/css/bootstrap.css" rel="stylesheet" />
		<link href="${ContextPath}/assets/css/bootstrap-editable.css" rel="stylesheet" />
		<link href="${ContextPath}/assets/css/font-awesome.css" rel="stylesheet" />
		<link href="${ContextPath}/assets/css/OpenSans.css" rel="stylesheet" />
		<link href="${ContextPath}/assets/css/ace.css" rel="stylesheet" />
		<link href="${ContextPath}/assets/css/ace-skins.css" rel="stylesheet" />
		<link href="${ContextPath}/assets/css/style.css" rel="stylesheet" />
		<!--[if IE 7]>
		  <link href="${ContextPath}/assets/css/font-awesome-ie7.css" rel="stylesheet" />
		<![endif]-->
		<!--[if lt IE 9]>
		  <link href="${ContextPath}/assets/css/ace-ie.css" rel="stylesheet" />
		<![endif]-->
	</head>

	<body class="navbar-fixed">
		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container-fluid">
					<a href="#" class="brand"><small>${option.system_name!'BI Server'} 管理平台</small></a><!--/.brand-->

					<ul class="nav ace-nav pull-right">
						<li class="light-blue user-profile">
							<a data-toggle="dropdown" href="#" class="user-menu dropdown-toggle">
								<span id="user_info">
								</span>
								<i class="icon-caret-down"></i>
							</a>

							<ul class="pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer" id="user_menu">
								<li><a href="${ContextPath}/home.do"><i class="icon-wrench"></i> 用户平台</a></li>
								<li class="divider"></li>
								<li><a href="${ContextPath}/logout.do"><i class="icon-off"></i> 退出</a></li>
							</ul>
						</li>
					</ul><!--/.ace-nav-->
				</div><!--/.container-fluid-->
			</div><!--/.navbar-inner-->
		</div>

		<div class="container-fluid" id="main-container">
			<a id="menu-toggler" href="#">
				<span></span>
			</a>

			<div id="sidebar" class="fixed">
				<ul class="nav nav-list">
					<li>
						<a class="dropdown-toggle" href="#">
							<i class="icon-list-alt"></i> <span>系统管理</span> <b class="arrow icon-angle-down"></b>
						</a>
						<ul class="submenu">
							<li><a href="#" data-url="${ContextPath}/system/option.do"><i class="icon-double-angle-right"></i> 系统配置</a></li>
						</ul>
					</li>
					<li>
						<a class="dropdown-toggle" href="#">
							<i class="icon-list-alt"></i> <span>权限管理</span> <b class="arrow icon-angle-down"></b>
						</a>
						<ul class="submenu">
							<li><a href="#" data-url="${ContextPath}/user/list.do"><i class="icon-double-angle-right"></i> 用户管理</a></li>
							<li><a href="#" data-url="${ContextPath}/authority/list.do"><i class="icon-double-angle-right"></i> 角色管理</a></li>
						</ul>
					</li>
				</ul><!--/.nav-list-->

				<div id="sidebar-collapse">
					<i class="icon-double-angle-left"></i>
				</div>
			</div>

			<div id="main-content" class="clearfix">
				<div class="clearfix" id="page-content">
				</div>
			</div><!--/#main-content-->
		</div><!--/.fluid-container#main-container-->

		<script src="${ContextPath}/assets/js/jquery.js"></script>
		<script src="${ContextPath}/assets/js/bootstrap.js"></script>
		<script src="${ContextPath}/assets/js/bootstrap-editable.js"></script>
		<script src="${ContextPath}/assets/js/jquery-ui-1.10.3.custom.js"></script>
		<script src="${ContextPath}/assets/js/jquery.ui.touch-punch.js"></script>
		<script src="${ContextPath}/assets/js/jquery.slimscroll.js"></script>
		<script src="${ContextPath}/assets/js/bootbox.js"></script>
		<script src="${ContextPath}/assets/js/ace-elements.js"></script>
		<script src="${ContextPath}/assets/js/ace.js"></script>
		<script src="${ContextPath}/assets/js/admin.js"></script>
	</body>
</html>
