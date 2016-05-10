(function($){
	var project_name = "base";
	var man = {};
	man.alert = function(title,message){
		 bootbox.alert({  
	            buttons: {  
	               ok: {  
	                    label: '关闭',  
	                    className: 'btn-sm btn-danger'  
	                }  
	            },  
	            message: message,   
	            title: title
	     });
	}
	man.confirm = function(message,fun){
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
	
	man.ajax = function(opts){
		var ops = {};
		var status = 200;
		var rsp = null;
		
		var params = opts.params;
		
		ops.contentType = 'application/json; charset=utf-8',
		ops.url=opts.url,		
//		ops.data={'params': man.json.encode(params)},
//		ops.data={'params': man.json.encode(params)},
		ops.data=params,
		ops.type=(opts.type==undefined)?'post':opts.type,
//		ops.async=opts.async,
		ops.async=true,
		ops.success=opts.success;
		
		if(opts.dataType!=null){
			ops.dataType = opts.dataType;
		}
		
		if(ops.async==false){
			
			try{
				rsp = $.ajax(ops);
				if(rsp.status==200){
					return man.json.decode(rsp.responseText);
				}
				return null;
			}catch(e){	
				man.alert('提示信息','系统错误');
				return null;
			}		
		}
		
		try{		
			ops.error = function(rsp){
				if(rsp.status==601){
					window.location.href = 'error.jsp';
				}else{
					man.alert('提示信息','系统错误');
				}
			};
			ops.success = function(rsp){
				var obj = man.json.decode(rsp.responseText);
				if(rsp.status_code=='505'){
					man.alert('提示信息',rsp.error_msg);
					return false;
				}else if(rsp.status_code=='600'){//返回状态600,ajax登陆请求登陆超时,跳转到登陆页面
					window.location.href = '/'+project_name+'/login.jsp';
				}
				opts.success(rsp);	
			};		
			var ret= $.ajax(ops);
			console.log("ERROR: ", ret);
			
		}catch(e){			
			man.alert('提示信息','返回信息解析异常');
			
			return null;
		}		
		
		};

	man.json = new (function(){
	    var useHasOwn = !!{}.hasOwnProperty;
	
	    // crashes Safari in some instances
	    //var validRE = /^("(\\.|[^"\\\n\r])*?"|[,:{}\[\]0-9.\-+Eaeflnr-u \n\r\t])+?$/;
	
	    var pad = function(n) {
	        return n < 10 ? "0" + n : n;
	    };
		/**
		 * 这个方法应该是jquery的扩展
		 * @param {Object} v
		 */
	    var isDate = function(v){
	        return v && typeof v.getFullYear == 'function';
	    };
	
	    var m = {
	        "\b": '\\b',
	        "\t": '\\t',
	        "\n": '\\n',
	        "\f": '\\f',
	        "\r": '\\r',
	        '"' : '\\"',
	        "\\": '\\\\'
	    };
	
	    var encodeString = function(s){
	        if (/["\\\x00-\x1f]/.test(s)) {
	            return '"' + s.replace(/([\x00-\x1f\\"])/g, function(a, b) {
	                var c = m[b];
	                if(c){
	                    return c;
	                }
	                c = b.charCodeAt();
	                return "\\u00" +
	                    Math.floor(c / 16).toString(16) +
	                    (c % 16).toString(16);
	            }) + '"';
	        }
	        return '"' + s + '"';
	    };
	
	    var encodeArray = function(o){
	        var a = ["["], b, i, l = o.length, v;
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
	                        a.push(v === null ? "null" : $.man.json.encode(v));
	                        b = true;
	                }
	            }
	            a.push("]");
	            return a.join("");
	    };
	
	    this.encodeDate = function(o){
	        return '"' + o.getFullYear() + "-" +
	                pad(o.getMonth() + 1) + "-" +
	                pad(o.getDate()) + "T" +
	                pad(o.getHours()) + ":" +
	                pad(o.getMinutes()) + ":" +
	                pad(o.getSeconds()) + '"';
	    };
	
	    
	    this.encode = function(o){
	        if(typeof o == "undefined" || o === null){
	            return "null";
	        }else if($.isArray(o)){
	            return encodeArray(o);
	        }else if(isDate(o)){
	            return $.man.json.encodeDate(o);
	        }else if(typeof o == "string"){
	            return encodeString(o);
	        }else if(typeof o == "number"){
	            return isFinite(o) ? String(o) : "null";
	        }else if(typeof o == "boolean"){
	            return String(o);
	        }else {
	            var a = ["{"], b, i, v;
	            for (i in o) {
	                if(!useHasOwn || o.hasOwnProperty(i)) {
	                    v = o[i];
	                    switch (typeof v) {
	                    case "undefined":
	                    case "function":
	                    case "unknown":
	                        break;
	                    default:
	                        if(b){
	                            a.push(',');
	                        }
	                        a.push(this.encode(i), ":",
	                                v === null ? "null" : this.encode(v));
	                        b = true;
	                    }
	                }
	            }
	            a.push("}");
	            return a.join("");
	        }
	    };
	
	    
	    this.decode = function(json){
	        return eval("(" + json + ')');
	    };
	})();
	
	man.getUrlParam = function(name, win){
	    
	    var w = window;
	    if (win != null) {
	        w = win;
	    }
	    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
	    var r = w.location.search.substr(1).match(reg);
	    if (r != null) 
	        return decodeURI(r[2]);
	    return null;
	};
    $.extend({
        "man": man
    });
    var opts = {
			  width : 200,     // 信息窗口宽度
			  height: 100,     // 信息窗口高度
			  title : "详细" , // 信息窗口标题
			  enableMessage:true,//设置允许信息窗发送短息
			  message:"详细"
		};
    man.showPointDeail = function(place,customer_name){
		 var divBody = '<body><div class="mapopbox"><dl><dt>详情</dt>' 
		 	+ '<dd><font>客户：</font>'+ customer_name +'</dd>'
		 	+ '<dd><font>地址：</font>'+ place +'</dd></dl></div></body>';
		return divBody;
	};
	
	 man.showLocationDeail = function(place,circle,lon,lat){
		 var divBody = '<body><div class="mapopbox"><dl><dt>详情</dt>' 
		 	+ '<dd><font>地址：</font>'+ place +'</dd>'
		 	+ '<dd><font>有效范围：</font>'+ circle +'米</dd>'
		 	+ '<dd><font>经度：</font>'+ lon +'</dd>'
		 	+ '<dd><font>纬度：</font>'+ lat +'</dd></dl></div></body>';
		return divBody;
	};
    man.showSearchDeail = function(place,customer_name,point){
		 var divBody = '<body><div class="mapopbox"><dl><dt>详情</dt>' 
		 	+ '<dd><font>客户：</font>'+ customer_name +'</dd>'
		 	+ '<dd><font>地址：</font>'+ place +'</dd></dl>'
		  	+ '<dd><button class="btn btn-success btn-sm" onclick="usePlace('+point.lng+','+point.lat+',\''+place+'\');"><i class="fa fa-plus"></i> 点击应用此地</button></div></body>';
		return divBody;
	};
})(jQuery)