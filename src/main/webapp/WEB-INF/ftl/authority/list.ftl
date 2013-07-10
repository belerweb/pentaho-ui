<#assign ContextPath=springMacroRequestContext.getContextPath() />
<div class="clearfix" id="page-content">
	<div class="page-header position-relative">
		<h1>权限<small><i class="icon-double-angle-right"></i> 角色管理</small></h1>
		<button type="button" class="btn action action-add">添加角色</button>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>角色</th>
						<th>说明</th>
						<th class="center" style="width:50px;">操作</th>
					</tr>
				</thead>
				<tbody>
					<#list authorities as authority>
					<tr>
						<td>${authority.authority}</td>
						<td><a href="#" data-name="description" data-type="text" data-pk="${authority.authority}" data-url="${ContextPath}/authority/update.do" data-title="说明" data-value="${authority.description!}"></a></td>
						<td class="td-actions center">
							<div class="btn-group">
								<button class="btn btn-mini btn-danger delete" data-authority="${authority.authority}">
									<i class="icon-trash bigger-120"></i>
								</button>
							</div>
						</td>
					</tr>
					</#list>
				</tbody>
			</table>
		</div>
	</div>
</div>

<script type="text/javascript">
$('#page-content a[data-name=description]').editable();
$('#page-content button.delete').on('click', function() {
	var authority = $(this).attr('data-authority');
	var el = $(this).closest('tr');
	bootbox.confirm('确认删除[' + authority + ']？', '取消', '确定', function(confirm) {
		if (confirm) {
			$.post('${ContextPath}/authority/delete.do', {
				authority: authority
			}).done(function() {
				el.remove();
			}).fail(function(xhr) {
				bootbox.alert(xhr.responseText, '确定');
			});
		}
	});
});
</script>