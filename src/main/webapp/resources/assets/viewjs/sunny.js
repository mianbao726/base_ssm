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
	
	sunny.confirm = function(message,fun){
		bootbox.confirm({
			message: message,
			buttons: {
			  confirm: {
				 label: "确定",
				 className: "btn-primary btn-sm",
			  },
			  cancel: {
				 label: "取消",
				 className: "btn-sm",
			  }
			},
			callback: fun
		  })
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
			//TODO ?
			sunny_opts.data = {
				"params" : sunny.json.encode(opts.params)
			};
			// sunny_opts.data = {"params" : opts.params};
			// ops.data={'params': sunny.json.encode(params)},
			sunny_opts.async = (opts.async == undefined) ? true : opts.async;

			sunny_opts.success = function(rsp) {
				// if(opts.disableAll){
				// sunny_hide();
				// }
				if (rsp.status_code == '600') {
					window.location.href = '/' + project_name
							+ '/login/login.html';
				}
				opts.success(rsp);
			};

			sunny_opts.error = function(rsp) {
				// if(opts.disableAll){
				// sunny_hide();
				// }
//				alert(1);
				window.location.href = '/' + project_name + '/login.html';
			};
			$.ajax(sunny_opts);
		} catch (e) {
			window.location.href = '/' + project_name + '/sys/500.html';
			return null;
		}

	};

	sunny.json = new (function() {
		var useHasOwn = !!{}.hasOwnProperty;

		// crashes Safari in some instances
		// var validRE = /^("(\\.|[^"\\\n\r])*?"|[,:{}\[\]0-9.\-+Eaeflnr-u
		// \n\r\t])+?$/;

		var pad = function(n) {
			return n < 10 ? "0" + n : n;
		};
		/**
		 * 这个方法应该是jquery的扩展
		 * 
		 * @param {Object}
		 *            v
		 */
		var isDate = function(v) {
			return v && typeof v.getFullYear == 'function';
		};

		var m = {
			"\b" : '\\b',
			"\t" : '\\t',
			"\n" : '\\n',
			"\f" : '\\f',
			"\r" : '\\r',
			'"' : '\\"',
			"\\" : '\\\\'
		};

		var encodeString = function(s) {
			if (/["\\\x00-\x1f]/.test(s)) {
				return '"'
						+ s.replace(/([\x00-\x1f\\"])/g, function(a, b) {
							var c = m[b];
							if (c) {
								return c;
							}
							c = b.charCodeAt();
							return "\\u00" + Math.floor(c / 16).toString(16)
									+ (c % 16).toString(16);
						}) + '"';
			}
			return '"' + s + '"';
		};

		var encodeArray = function(o) {
			var a = [ "[" ], b, i, l = o.length, v;
			for (i = 0; i < l; i += 1) {
				v = o[i];
				switch (typeof v) {
				case "undefined":
				case "function":
				case "unknown":
					break;
				default:
					if (b) {
						a.push(',');
					}
					a.push(v === null ? "null" : $.sunny.json.encode(v));
					b = true;
				}
			}
			a.push("]");
			return a.join("");
		};

		this.encodeDate = function(o) {
			return '"' + o.getFullYear() + "-" + pad(o.getMonth() + 1) + "-"
					+ pad(o.getDate()) + "T" + pad(o.getHours()) + ":"
					+ pad(o.getMinutes()) + ":" + pad(o.getSeconds()) + '"';
		};

		this.encode = function(o) {
			if (typeof o == "undefined" || o === null) {
				return "null";
			} else if ($.isArray(o)) {
				return encodeArray(o);
			} else if (isDate(o)) {
				return $.sunny.json.encodeDate(o);
			} else if (typeof o == "string") {
				return encodeString(o);
			} else if (typeof o == "number") {
				return isFinite(o) ? String(o) : "null";
			} else if (typeof o == "boolean") {
				return String(o);
			} else {
				var a = [ "{" ], b, i, v;
				for (i in o) {
					if (!useHasOwn || o.hasOwnProperty(i)) {
						v = o[i];
						switch (typeof v) {
						case "undefined":
						case "function":
						case "unknown":
							break;
						default:
							if (b) {
								a.push(',');
							}
							a.push(this.encode(i), ":", v === null ? "null"
									: this.encode(v));
							b = true;
						}
					}
				}
				a.push("}");
				return a.join("");
			}
		};

		this.decode = function(json) {
			return eval("(" + json + ')');
		};
	})();

	$.extend({
		"sunny" : sunny
	});

})(jQuery)