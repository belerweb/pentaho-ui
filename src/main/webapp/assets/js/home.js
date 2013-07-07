$(function() {
	(function() {
		$("#menu-toggler").on("click", function() {
			$("#sidebar").toggleClass("display");
			$(this).toggleClass("display");
			return false;
		});
		var collapse = false;
		$("#sidebar-collapse").on("click", function() {
			$("#sidebar").toggleClass("menu-min");
			$(this.firstChild).toggleClass("icon-double-angle-right");
			collapse = $("#sidebar").hasClass("menu-min");
			if (collapse) {
				$(".open > .submenu").removeClass("open")
			}
		});
		$(".nav-list").on(
				"click",
				function(event) {
					if (collapse) {
						return;
					}
					var folder = $(event.target).closest(".dropdown-toggle");
					if (folder && folder.length > 0) {
						var files = folder.next().get(0);
						if (!$(files).is(":visible")) {
							$(".open > .submenu").each(function() {
								if (this != files && !$(this.parentNode).hasClass("active")) {
									$(this).slideUp(200).parent().removeClass("open")
								}
							})
						}
						$(files).slideToggle(200).parent().toggleClass("open");
						return false;
					}
					var file = $(event.target);
					if (file.is('a') && !file.is('.dropdown-toggle')) {
						event.preventDefault();
						event.stopPropagation();
						var fileName = file.text();
						var folderName = $('a:first', file.parents('li').get(1)).text();
						var iframe = '<iframe src="' + file.attr('data-url')
								+ '" frameborder="0" style="width:100%;height:0;"></iframe>';
						iframe = $(iframe);
						iframe.on('load', function() {
							$(this).height($(this).contents().height());
						});
						var content = '<div class="clearfix" id="page-content">'
								+ '<div class="page-header position-relative"><h1>' + folderName
								+ '<small><i class="icon-double-angle-right"></i> ' + fileName + '</small></h1></div>'
								+ '<div class="row-fluid"><div class="span12"></div></div>'
						content = $(content);
						$('.span12', content).append(iframe);
						$('#main-content').empty().append(content);
					}
				});
	})();

	var RepositorySort = function(obj1, obj2) {
		var name1 = $(obj1).attr('name');
		var name2 = $(obj2).attr('name');
		return name1 == name2 ? 0 : name1 > name2 ? 1 : -1;
	};

	// Refresh Repository
	var SRS = '/pentaho/SolutionRepositoryService?component=getSolutionRepositoryDoc';
	$.get(SRS, function(xml) {
		var folders = $('repository > file[isDirectory=true][visible=true]', xml).sort(RepositorySort);
		$.each(folders, function(i, obj) {
			var files = $('file[isDirectory=false][visible=true]', obj).sort(RepositorySort);
			if (files.length) {
				var folder = '<li><a class="dropdown-toggle" href="#">' + '<i class="icon-th"></i><span>'
						+ $(obj).attr('localized-name') + '</span><b class="arrow icon-angle-down"></b></a>'
						+ '<ul class="submenu"></ul></li>';
				folder = $(folder);
				$.each(files, function(i, obj) {
					var file = '<a href="#" data-url="' + $(obj).attr('url') + '">'
							+ '<i class="icon-double-angle-right"></i> ' + $(obj).attr('localized-name') + '</a>';
					$('ul', folder).append('<li>' + file + '</li>');
				});
				$('#sidebar .nav-list').append(folder);
			}
		});
	}, 'xml');
});