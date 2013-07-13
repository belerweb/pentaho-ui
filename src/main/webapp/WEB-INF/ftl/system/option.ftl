<#assign ContextPath=springMacroRequestContext.getContextPath() />
<div class="clearfix" id="page-content">
	<div class="page-header position-relative">
		<h1>系统管理<small><i class="icon-double-angle-right"></i> 系统配置</small></h1>
	</div>
	<div class="row-fluid">
		<div class="span12 form-horizontal">
			<div class="control-group">
				<label class="control-label">系统名称：</label>
				<div class="controls">
					<a href="#" data-type="text" data-name="system_name" data-value="${option.system_name!'BI Server'}"
						data-url="${ContextPath}/system/option/update.do"
						class="editable"></a>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">资源库试图：</label>
				<div class="controls">
					<a href="#" data-type="select" data-name="repository_view" data-value="${option.repository_view!'tree'}"
						data-url="${ContextPath}/system/option/update.do"
						class="editable"></a>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$('#page-content a.editable[data-type=text]').editable();
$('#page-content a[data-name=repository_view]').editable({
	source: [
		{value:'tree',text:'树形目录多级展示'},
		{value:'2',text:'两级目录展示'}
	]
});
</script>