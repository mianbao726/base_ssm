var APP = "base";
var BASE = "/"+APP;
(function($) {
	var project_name = "base";
	var xx = {};
	xx.c = function(obj){//console.log
		console.log(obj);
	};
	
	xx.isArray = function(){ //判断array
   	  return Object.prototype.toString.call(o)=='[object Array]';
	};
	
	xx.tree = function (tree){//构建树
		var newTree = [];
        var tmp = [];
        var item = [];
        //遍历数组，建立临时扁平数据
        for(var x in tree){
            item[tree[x].id] = [tree[x].name];
        }
        //遍历数组，同时获取每个对象的父节点和子节点数据
        for(var x in tree){
            var parentId = tree[x].pId; 
            var childId = tree[x].cId;
            //该对象的父元素节点在临时数据中的对应位置有数据存在时
            //说明这是一个二级以上的节点
            //将它的数据传递给父节点对应的子节点位置
            if(item[parentId]){
                item[parentId][childId] = item[tree[x].id];
            }
            //如果没有，说明这是一个一级节点，直接传递给最终结果
            else{
                newTree.push(item[tree[x].id]);
            }
            //因为传递的值为引用值，所以当处理数据时
            //对子节点进行操作后,同样会反映到父节点中，最后体现在最终结果里        
        }
        item = null; // 解除临时数据
        return newTree;
	};
	
	xx.leftmenu = function (arr){//左侧菜单
		$.xx.c("===============");
		$.xx.c(arr);
		$.xx.c("===============");
  	  var ht = '';
        for(var i=0;i<arr.length;i++){
      	  if(('A' == arr[i][0])){
      	  ht+='<li '
      	     +'class="active"' //selected parent menu
      	     +'><a><i class="fa fa-home"></i>'+arr[i][0]+'<span class="fa fa-chevron-down"></span></a>'+'<ul class="nav child_menu" '
      	     +'style="display: block;" '//selected parent menu
      	     +'>';
      	  }else{
      		  ht+='<li '
           	     +'><a><i class="fa fa-home"></i>'+arr[i][0]+'<span class="fa fa-chevron-down"></span></a>'+'<ul class="nav child_menu" '
           	     +'>';  
      	  }
      	  for(var j = 1 ; j<arr[i].length ; j++){
      		  console.log("12  :  "+arr[i][j]);
      		  var temp_arr = (arr[i][j]+"").split("_");
      		  
      		  console.log("12  :  "+arr[i][j]);
      		  if((arr[i][j] == 'A2')){
      			  console.log("true");
      			  ht+= '<li class="current-page"><a href="'+temp_arr[1]+'">'+temp_arr[0]+'</a></li>';
      		  }else{
          		  ht+= '<li><a href="'+temp_arr[1]+'">'+temp_arr[0]+'</a></li>';  
      		  }
      	  }
      	  ht+= '</ul></li>';
     	  }
        $("#sweet_menu").append(ht);  
	};
	
	xx.left = function(data){
		$.xx.leftmenu($.xx.tree(data));
	};
	
	xx.ajax = function(opts){
		
		if (opts.disableAll) {
			if (opts.disableMsg) {
//				xx_show_msg(opts.disableHeight, opts.disableMsg);
				alert(opts.disableMsg);
			} else {
				alert(opts.disableMsg);
//				xx_show(opts.disableHeight);
			}
		}
		
		try {
			var xx_opts = {};
			xx_opts.url = opts.url;
			xx_opts.type = (opts.type == undefined) ? 'post' : opts.type;
			xx_opts.dataType = "json";
			//TODO ?
			xx_opts.data = {
				"params" : xx.json.encode(opts.params)
			};
			// xx_opts.data = {"params" : opts.params};
			// ops.data={'params': xx.json.encode(params)},
			xx_opts.async = (opts.async == undefined) ? true : opts.async;

			xx_opts.success = function(rsp) {
				// if(opts.disableAll){
				// xx_hide();
				// }
				if (rsp.status_code == '600') {
					window.location.href = '/' + project_name
							+ '/login/login.html';
				}
				opts.success(rsp);
			};

			xx_opts.error = function(rsp) {
				// if(opts.disableAll){
				// xx_hide();
				// }
				alert('error occored !');
//				window.location.href = '/' + project_name + '/login.html';
				
			};
			$.ajax(xx_opts);
		} catch (e) {
			window.location.href = '/' + project_name + '/sys/500.html';
			return null;
		}
	};
	
	xx.json = new (function() {
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
					a.push(v === null ? "null" : $.xx.json.encode(v));
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
				return $.xx.json.encodeDate(o);
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
		"xx" : xx
	});

})(jQuery)