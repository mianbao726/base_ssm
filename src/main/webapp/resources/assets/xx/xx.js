var APP = "base";
var BASE = "/"+APP;
(function($) {
	var project_name = "base";
	var wj = {};
	wj.c = function(obj){//console.log
		console.log(obj);
	};
	
	wj.conform = function(info,fun){
		$("#wjConform").click(fun);
		$("#ppss").html(info);
		$("#wjModal").modal('show');
	};
	
	wj.location = function(obj){//console.log
		wj.c(obj);
		window.location.href = obj;
	};
	
	wj.isArray = function(){ //判断array
   	  return Object.prototype.toString.call(o)=='[object Array]';
	};
	
	wj.bindIdClick = function (target){
		var targetID="#"+target;
		document.onkeydown = function(e){
		    var event = e || window.event;  
		    var code = event.keyCode || event.which || event.charCode;
		    if (code == 13) {
		    	$(targetID).click();
		    }
		};
	}
	
	wj.tree = function (tree){//构建树
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
	
	wj.leftmenu = function (arr){//左侧菜单
		$.wj.c("===============");
		$.wj.c(arr);
		$.wj.c("===============");
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
	
	wj.left = function(data){
		$.wj.leftmenu($.wj.tree(data));
	};
	
	 // To create it as a library method:
	wj.formatMoney = function (number, places, symbol, thousand, decimal) {
		 number = number || 0;
	        places = !isNaN(places = Math.abs(places)) ? places : 2;
	        symbol = symbol !== undefined ? symbol : "$";
	        thousand = thousand || ",";
	        decimal = decimal || ".";
	        var negative = number < 0 ? "-" : "",
	            i = parseInt(number = Math.abs(+number || 0).toFixed(places), 10) + "",
	            j = (j = i.length) > 3 ? j % 3 : 0;
	        return symbol + negative + (j ? i.substr(0, j) + thousand : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + thousand) + (places ? decimal + Math.abs(number - i).toFixed(places).slice(2) : "");
    }
	
	wj.ajax = function(opts){
		
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
			var wj_opts = {};
			wj_opts.url = opts.url;
			wj_opts.type = (opts.type == undefined) ? 'post' : opts.type;
			wj_opts.dataType = "json";
			wj_opts.data = {
				"params" : wj.json.encode(opts.params)
			};
			// xx_opts.data = {"params" : opts.params};
			// ops.data={'params': xx.json.encode(params)},
			wj_opts.async = (opts.async == undefined) ? true : opts.async;

			wj_opts.success = function(rsp) {
				// if(opts.disableAll){
				// xx_hide();
				// }
				if (rsp.status_code == '600') {
					window.location.href = '/' + project_name
							+ '/login/login.html';
				}
				opts.success(rsp);
			};

			wj_opts.error = function(rsp) {
				// if(opts.disableAll){
				// xx_hide();
				// }
//				alert('error occored !');
//				window.location.href = '/' + project_name + '/login.html';
				
			};
			$.ajax(wj_opts);
		} catch (e) {
			window.location.href = '/' + project_name + '/sys/500.html';
			return null;
		}
	};
	
	wj.p = function(data){
		return {"params" : wj.json.encode(data)};
	};
	
	wj.json = new (function() {
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
					a.push(v === null ? "null" : $.wj.json.encode(v));
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
				return $.wj.json.encodeDate(o);
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
		"wj" : wj
	});
	
	
})(jQuery);

/**
 * formate $
 * @param places
 * @param symbol
 * @param thousand
 * @param decimal
 * @returns
 */
Number.prototype.formatMoney = function (places, symbol, thousand, decimal) {
    places = !isNaN(places = Math.abs(places)) ? places : 2;
    symbol = symbol !== undefined ? symbol : "$";
    thousand = thousand || ",";
    decimal = decimal || ".";
    var number = this,
        negative = number < 0 ? "-" : "",
        i = parseInt(number = Math.abs(+number || 0).toFixed(places), 10) + "",
        j = (j = i.length) > 3 ? j % 3 : 0;
    return symbol + negative + (j ? i.substr(0, j) + thousand : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + thousand) + (places ? decimal + Math.abs(number - i).toFixed(places).slice(2) : "");
};