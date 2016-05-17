(function($) {
	var project_name = "base";
	var sunny = {};
	sunny.alert = function(title, message) {
		bootbox.alert({
			buttons : {
				ok : {
					label : '关闭',
					className : 'btn-sm btn-danger'
				}
			},
			message : message,
			title : title
		});
	};

	sunny.ajax = function(opts) {
		// if(opts.disableAll){
		// if(opts.disableMsg){
		// sunny_show_msg(opts.disableHeight,opts.disableMsg);
		// }else{
		// sunny_show(opts.disableHeight);
		// }
		// }
		try {
			var sunny_opts = {};
			sunny_opts.url = opts.url;
			sunny_opts.type = (opts.type == undefined) ? 'post' : opts.type;
			sunny_opts.dataType = "json";
			sunny_opts.data = opts.params;
			sunny_opts.async = (opts.async == undefined) ? true : opts.async;

			sunny_opts.success = function(rsp) {
				// if(opts.disableAll){
				// sunny_hide();
				// }
				 if (rsp.status_code == '600') {
					window.location.href = '/' + project_name + '/login/login.html';
				}
				opts.success(rsp);
			};

			sunny_opts.error = function(rsp) {
				// if(opts.disableAll){
				// sunny_hide();
				// }
				window.location.href = '/' + project_name + '/sys/500.html';
			};
			$.ajax(sunny_opts);
		} catch (e) {
			window.location.href = '/' + project_name + '/sys/500.html';
			return null;
		}

	};

	$.extend({
		"sunny" : sunny
	});

})(jQuery)