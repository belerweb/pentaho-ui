<#assign ContextPath=springMacroRequestContext.getContextPath() />
<div class="clearfix" id="page-content">
	<div class="page-header position-relative">
		<h1>系统管理<small><i class="icon-double-angle-right"></i> 系统信息</small></h1>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<div class="widget-box transparent">
				<div class="widget-header">
					<div class="widget-toolbar no-border">
						<ul class="nav nav-tabs">
							<li class="active">
								<a href="#system-env" data-toggle="tab">环境变量</a>
							</li>
							<li class="">
								<a href="#system-property" data-toggle="tab">系统属性</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="widget-body">
					<div class="widget-main padding-4">
						<div class="tab-content padding-8">
							<div class="tab-pane active" id="system-env">
								<table class="table table-condensed">
									<tbody>
										<#list envs?keys?sort as key>
										<tr><th>${key}</th><td>${envs[key]!}</td></tr>
										</#list>
									</tbody>
								</table>
							</div>
							<div class="tab-pane" id="system-property">
								<table class="table table-condensed">
									<tbody>
										<#list properties?keys?sort as key>
										<tr><th>${key}</th><td>${properties[key]!}</td></tr>
										</#list>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
</script>