jQuery(function() {
	handle_side_menu();
	add_browser_detection(jQuery);
	general_things();
	widget_boxes();
	$(document).off("click.dropdown-menu")
});
function handle_side_menu() {
	$("#menu-toggler").on("click", function() {
		$("#sidebar").toggleClass("display");
		$(this).toggleClass("display");
		return false
	});
	var a = false;
	$("#sidebar-collapse").on("click", function() {
		$("#sidebar").toggleClass("menu-min");
		$(this.firstChild).toggleClass("icon-double-angle-right");
		a = $("#sidebar").hasClass("menu-min");
		if (a) {
			$(".open > .submenu").removeClass("open")
		}
	});
	$(".nav-list").on("click", function(d) {
		if (a) {
			return
		}
		var c = $(d.target).closest(".dropdown-toggle");
		if (c && c.length > 0) {
			var b = c.next().get(0);
			if (!$(b).is(":visible")) {
				$(".open > .submenu").each(function() {
					if (this != b && !$(this.parentNode).hasClass("active")) {
						$(this).slideUp(200).parent().removeClass("open")
					}
				})
			}
			$(b).slideToggle(200).parent().toggleClass("open");
			return false
		}
	})
}
function general_things() {
	$('.ace-nav [class*="icon-animated-"]').closest("a").on("click",
			function() {
				var b = $(this).find('[class*="icon-animated-"]').eq(0);
				var a = b.attr("class").match(/icon\-animated\-([\d\w]+)/);
				b.removeClass(a[0]);
				$(this).off("click")
			});
}
function widget_boxes() {
	$(".widget-toolbar > a[data-action]")
			.each(
					function() {
						var f = $(this);
						var h = f.data("action");
						var e = f.closest(".widget-box");
						if (h == "collapse") {
							var d = e.find(".widget-body");
							var b = f.find("[class*=icon-]").eq(0);
							var a = b.attr("class").match(
									/icon\-(.*)\-(up|down)/);
							var c = "icon-" + a[1] + "-down";
							var g = "icon-" + a[1] + "-up";
							d = d.wrapInner(
									'<div class="widget-body-inner"></div>')
									.find(":first-child").eq(0);
							f.on("click", function(i) {
								if (e.hasClass("collapsed")) {
									if (b) {
										b.addClass(g).removeClass(c)
									}
									e.removeClass("collapsed");
									d.slideDown(200)
								} else {
									if (b) {
										b.addClass(c).removeClass(g)
									}
									d.slideUp(300, function() {
										e.addClass("collapsed")
									})
								}
								i.preventDefault()
							});
							if (e.hasClass("collapsed") && b) {
								b.addClass(c).removeClass(g)
							}
						} else {
							if (h == "close") {
								f.on("click", function(i) {
									e.hide(300, function() {
										e.remove()
									});
									i.preventDefault()
								})
							} else {
								if (h == "reload") {
									f
											.on(
													"click",
													function(j) {
														f.blur();
														var i = false;
														if (!e
																.hasClass("position-relative")) {
															i = true;
															e
																	.addClass("position-relative")
														}
														e
																.append('<div class="widget-box-layer"><i class="icon-spinner icon-spin icon-2x white"></i></div>');
														setTimeout(
																function() {
																	e
																			.find(
																					"> div:last-child")
																			.remove();
																	if (i) {
																		e
																				.removeClass("position-relative")
																	}
																},
																parseInt(Math
																		.random() * 1000 + 1000));
														j.preventDefault()
													})
								} else {
									if (h == "settings") {
										f.on("click", function(i) {
											i.preventDefault()
										})
									}
								}
							}
						}
					})
}
function add_browser_detection(c) {
	if (!c.browser) {
		var a, b;
		c.uaMatch = function(e) {
			e = e.toLowerCase();
			var d = /(chrome)[ \/]([\w.]+)/.exec(e)
					|| /(webkit)[ \/]([\w.]+)/.exec(e)
					|| /(opera)(?:.*version|)[ \/]([\w.]+)/.exec(e)
					|| /(msie) ([\w.]+)/.exec(e) || e.indexOf("compatible") < 0
					&& /(mozilla)(?:.*? rv:([\w.]+)|)/.exec(e) || [];
			return {
				browser : d[1] || "",
				version : d[2] || "0"
			}
		};
		a = c.uaMatch(navigator.userAgent);
		b = {};
		if (a.browser) {
			b[a.browser] = true;
			b.version = a.version
		}
		if (b.chrome) {
			b.webkit = true
		} else {
			if (b.webkit) {
				b.safari = true
			}
		}
		c.browser = b
	}
};