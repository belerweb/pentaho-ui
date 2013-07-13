<#assign ContextPath=springMacroRequestContext.getContextPath() />
<div class="clearfix" id="page-content">
	<div class="page-header position-relative">
		<h1>权限<small><i class="icon-double-angle-right"></i> 角色管理</small></h1>
		<button type="button" class="btn action action-add">添加角色</button>
		<form class="form-horizontal hide">
			<legend>添加角色</legend>
			<div class="control-group">
				<label class="control-label">角色：</label>
				<div class="controls">
					<input name="authority" type="text" placeholder="角色：4～16位的字母">
				</div>
			</div>
		</form>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>角色</th>
						<th>说明</th>
						<th>用户</th>
						<th class="center" style="width:50px;">操作</th>
					</tr>
				</thead>
				<tbody>
					<#list authorities as authority>
					<tr>
						<td>${authority.authority}</td>
						<td>
							<a href="#" data-name="description" data-type="text"
								data-pk="${authority.authority}"
								data-url="${ContextPath}/authority/update.do"
								data-title="说明" data-value="${authority.description!}">
							</a>
						</td>
						<td>
							<a href="#" data-name="users" data-type="checklist"
								data-pk="${authority.authority}"
								data-url="${ContextPath}/authority/update.do"
								data-title="用户"
								data-value="<#list authority.users as user><#if user_index gt 0>,</#if>${user.username!}</#list>">
							</a>
						</td>
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
$('#page-content a[data-name=users]').editable({
	source: [
		<#list users as user>
		<#if user_index gt 0>,</#if>{value: '${user.username}', text: '${user.username}<#if user.description?has_content>(${user.description})</#if>'}
		</#list>
	]
});
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
					url: '${ContextPath}/authority/add.do',
					data: {
						authority: $.trim($('input[name=authority]', dialog).val())
					}
				}).done(function(){
					success = true;
					$('#main-content').load('${ContextPath}/authority/list.do');
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