$(function() {
	var RepositorySort = function(obj1, obj2) {
		var name1 = $(obj1).attr('name');
		var name2 = $(obj2).attr('name');
		return name1 == name2 ? 0 : name1 > name2 ? 1 : -1;
	};

	// Refresh Repository
	var SRS = '/pentaho/SolutionRepositoryService?component=getSolutionRepositoryDoc';
	$.get(SRS, function(xml) {
		console.log(xml);
		var folders = $('repository > file[isDirectory=true][visible=true]',
				xml).sort(RepositorySort);
		$.each(folders, function(i, obj) {
			var files = $('file[isDirectory=false][visible=true]', obj).sort(
					RepositorySort);
			if (files.length) {
				var folder = '<li><a class="dropdown-toggle" href="#">'
						+ '<i class="icon-th"></i><span>'
						+ $(obj).attr('localized-name')
						+ '</span><b class="arrow icon-angle-down"></b></a>'
						+ '<ul class="submenu"></ul></li>';
				folder = $(folder);
				$.each(files, function(i, obj) {
					var file = '<a href="#">'
							+ '<i class="icon-double-angle-right"></i>'
							+ $(obj).attr('localized-name') + '</a>';
					$('ul', folder).append('<li>' + file + '</li>');
				});
				$('#sidebar .nav-list').append(folder);
			}
		});
	}, 'xml');
});