<#assign ContextPath=springMacroRequestContext.getContextPath() />
<div class="clearfix" id="page-content">
	<div class="page-header position-relative">
		<h1>权限<small><i class="icon-double-angle-right"></i> 用户管理</small></h1>
		<button type="button" class="btn action action-add">添加用户</button>
		<form class="form-horizontal hide">
			<legend>添加用户</legend>
			<div class="control-group">
				<label class="control-label">用户名</label>
				<div class="controls">
					<input name="username" type="text" placeholder="用户名">
				</div>
			</div>
		</form>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>用户名</th>
						<th>密码</th>
						<th>说明</th>
						<th class="center" style="width:50px;">状态</th>
						<th class="center" style="width:50px;">操作</th>
					</tr>
				</thead>
				<tbody>
					<#list users as user>
					<tr>
						<td>${user.username}</td>
						<td><a href="#" data-name="password" data-type="password" data-pk="${user.username}" data-url="${ContextPath}/user/update.do" data-title="密码" data-value="******"></a></td>
						<td><a href="#" data-name="description" data-type="text" data-pk="${user.username}" data-url="${ContextPath}/user/update.do" data-title="说明" data-value="${user.description!}"></a></td>
						<td class="center"><a href="#" data-name="enabled" data-type="select" data-pk="${user.username}" data-url="${ContextPath}/user/update.do" data-title="状态" data-value="<#if user.enabled?has_content && user.enabled>1<#else>0</#if>"></a></td>
						<td class="td-actions center">
							<div class="btn-group">
								<button class="btn btn-mini btn-danger delete" data-username="${user.username}">
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
$('#page-content a[data-name=password]').editable();
$('#page-content a[data-name=description]').editable();
$('#page-content a[data-name=enabled]').editable({
	source: [
		{value: 1, text: '启用'},
		{value: 0, text: '禁用'}
	]
});
$('#page-content button.delete').on('click', function() {
	var username = $(this).attr('data-username');
	var el = $(this).closest('tr');
	bootbox.confirm('确认删除[' + username + ']？', '取消', '确定', function(confirm) {
		if (confirm) {
			$.post('${ContextPath}/user/delete.do', {
				username: username
			}).done(function() {
				el.remove();
			}).fail(function(xhr) {
				bootbox.alert(xhr.responseText, '确定');
			});
		}
	});
});
$('#page-content button.action-add').on('click', function() {
	var dialog = bootbox.dialog($('<div></div>').append($(this).next().clone().removeClass('hide')).html(), [{
			label: '取消'
		}, {
			label: '确定',
			callback: function(){
				var success = false;
				$.ajax({
					async: false,
					method: 'POST',
					url: '${ContextPath}/user/add.do',
					data: {
						username: $.trim($('input[name=username]', dialog).val())
					}
				}).done(function(){
					success = true;
					$('#main-content').load('${ContextPath}/user/list.do');
				}).fail(function(xhr) {
					bootbox.alert(xhr.responseText, '确定');
				});
				return success;
			}
		}
	]);
	$('form', dialog).on('submit', function(e) {
		e.preventDefault();
		dialog.find(".btn-primary").click();
	});
});
</script>