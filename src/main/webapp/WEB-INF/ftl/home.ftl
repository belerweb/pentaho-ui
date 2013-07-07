<#assign ContextPath=springMacroRequestContext.getContextPath() />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>BI Server</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<link href="${ContextPath}/assets/css/bootstrap.css" rel="stylesheet" />
		<link rel="stylesheet" href="${ContextPath}/assets/css/font-awesome.css" />
		<link rel="stylesheet" href="${ContextPath}/assets/css/OpenSans.css" />
		<link rel="stylesheet" href="${ContextPath}/assets/css/ace.css" />
		<link rel="stylesheet" href="${ContextPath}/assets/css/ace-skins.css" />
		<!--[if IE 7]>
		  <link rel="stylesheet" href="${ContextPath}/assets/css/font-awesome-ie7.css" />
		<![endif]-->
		<!--[if lt IE 9]>
		  <link rel="stylesheet" href="${ContextPath}/assets/css/ace-ie.css" />
		<![endif]-->
	</head>

	<body class="navbar-fixed">
		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container-fluid">
					<a href="#" class="brand">
						<small>
							BI Server
						</small>
					</a><!--/.brand-->

					<ul class="nav ace-nav pull-right">
						<li class="light-blue user-profile">
							<a data-toggle="dropdown" href="#" class="user-menu dropdown-toggle">
								<span id="user_info">
								</span>
								<i class="icon-caret-down"></i>
							</a>

							<ul class="pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer" id="user_menu">
								<li>
									<a href="${ContextPath}/logout.do">
										<i class="icon-off"></i>
										退出
									</a>
								</li>
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
				<div id="sidebar-shortcuts">
					<div id="sidebar-shortcuts-large">
					</div>
				</div><!--#sidebar-shortcuts-->

				<ul class="nav nav-list">
				</ul><!--/.nav-list-->

				<div id="sidebar-collapse">
					<i class="icon-double-angle-left"></i>
				</div>
			</div>

			<div id="main-content" class="clearfix">

			</div><!--/#main-content-->
		</div><!--/.fluid-container#main-container-->

		<script src="${ContextPath}/assets/js/jquery.js"></script>
		<script src="${ContextPath}/assets/js/bootstrap.js"></script>
		<script src="${ContextPath}/assets/js/jquery-ui-1.10.3.custom.js"></script>
		<script src="${ContextPath}/assets/js/jquery.ui.touch-punch.js"></script>
		<script src="${ContextPath}/assets/js/jquery.slimscroll.js"></script>
		<script src="${ContextPath}/assets/js/ace-elements.js"></script>
		<script src="${ContextPath}/assets/js/ace.js"></script>
		<script src="${ContextPath}/assets/js/home.js"></script>
	</body>
</html>
