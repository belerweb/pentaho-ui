<#assign ContextPath=springMacroRequestContext.getContextPath() />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
		<title>登录</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<link href="${ContextPath}/assets/css/bootstrap.css" rel="stylesheet" />
		<link rel="stylesheet" href="${ContextPath}/assets/css/font-awesome.css" />
		<link rel="stylesheet" href="${ContextPath}/assets/css/OpenSans.css" />
		<link rel="stylesheet" href="${ContextPath}/assets/css/ace.css" />
		<!--[if IE 7]>
		  <link rel="stylesheet" href="${ContextPath}/assets/css/font-awesome-ie7.css" />
		<![endif]-->
		<!--[if lt IE 9]>
		  <link rel="stylesheet" href="${ContextPath}/assets/css/ace-ie.css" />
		<![endif]-->
	</head>
	<body class="login-layout">
		<div class="container-fluid" id="main-container">
			<div id="main-content">
				<div class="row-fluid">
					<div class="span12">
						<div class="login-container">
							<div class="row-fluid">
								<div class="space-24"></div>
								<div class="center">
									<h1>
										<span class="white">BI Server</span>
									</h1>
								</div>
							</div>
							<div class="space-6"></div>
							<div class="row-fluid">
								<div class="position-relative">
									<div id="login-box" class="visible widget-box no-border">
										<div class="widget-body">
											<div class="widget-main">
												<h4 class="header blue lighter bigger">
													<i class="icon-coffee green"></i>
													输入用户名和密码登录系统
												</h4>
												<div class="space-6"></div>
												<form action="${ContextPath}/session.do" method="post">
													<fieldset>
														<label>
															<span class="block input-icon input-icon-right">
																<input name="j_username" type="text" class="span12" placeholder="用户名" />
																<i class="icon-user"></i>
															</span>
														</label>
														<label>
															<span class="block input-icon input-icon-right">
																<input name="j_password" type="password" class="span12" placeholder="密码" />
																<i class="icon-lock"></i>
															</span>
														</label>
														<div class="space"></div>
														<div class="row-fluid">
															<label class="span8">
																<!-- input type="checkbox" />
																<span class="lbl"> 记住我</span -->
															</label>
															<button type="submit" class="span4 btn btn-small btn-primary" data-loading-text="登录中...">
																<i class="icon-key"></i>
																登录
															</button>
														</div>
													</fieldset>
												</form>
											</div><!--/widget-main-->
										</div><!--/widget-body-->
									</div><!--/login-box-->
								</div><!--/position-relative-->
							</div>
						</div>
					</div><!--/span-->
				</div><!--/row-->
			</div>
		</div><!--/.fluid-container-->

		<script src="${ContextPath}/assets/js/jquery.js"></script>
		<script src="${ContextPath}/assets/js/bootstrap.js"></script>
		<script type="text/javascript">
			$('form').on('submit', function(event) {
				$('button[type=submit]').button('loading')
				$.ajax({
					async: false,
					type: 'POST',
					url: '/pentaho/j_spring_security_check',
					data: {
						j_username: $('input[name=j_username]').val(),
						j_password: $('input[name=j_password]').val(),
						locale: 'zh_CN'
					},
					error: function() {
						event.preventDefault();
						event.stopPropagation();
						alert('登录失败，请检查是否正确安装了程序。');
						$('button[type=submit]').button('reset');
					}
				});
			});
		</script>

	</body>
</html>
