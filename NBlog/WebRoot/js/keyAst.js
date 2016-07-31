$(document)
		.ready(
				function() {
					$(document).bind("keydown", function(e) {
						var e = window.event || e;
						if (e.keyCode == 116) {
							e.keyCode = 0;
							return false;
						}
					});
					$(document).bind("contextmenu", function(e) {
						return false;
					});
					$(document)
							.keydown(
									function(event) {

										// 屏蔽 Alt+ 方向键 ←
										// 屏蔽 Alt+ 方向键 →
										if ((event.altKey)
												&& ((event.keyCode == 37) || (event.keyCode == 39))) {
											event.returnValue = false;
											return false;
										}
										// 屏蔽退格删除键
										/*if (event.keyCode == 8) {
											return false;
										}*/
										// 屏蔽F5刷新键
										if (event.keyCode == 116) {
											return false;
										}
										// 屏蔽alt+R
										if ((event.ctrlKey)
												&& (event.keyCode == 82)) {
											return false;
										}
									});
					$(document)
							.keydown(
									function(e) {
										var doPrevent;
										if (e.keyCode == 8) {
											var d = e.srcElement || e.target;
											if (d.tagName.toUpperCase() == 'INPUT'
													|| d.tagName.toUpperCase() == 'TEXTAREA') {
												doPrevent = d.readOnly
														|| d.disabled;
											} else
												doPrevent = true;
										} else
											doPrevent = false;

										if (doPrevent)
											e.preventDefault();
									});
				});
