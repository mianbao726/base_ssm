
        

(function($){
    $.fn.extend({
        menu:function(options){
            var defaults = {
                data:[],
                ulId:"baseMenu",
                itemId:"",
                foder:false
            };
         
            var options = $.extend(defaults, options);
            $("#baseMenu").empty();
            // 开始拼接ul,li
            $.each(options.data,function(i,v){
            	 var li;
            	  var _a;
                if(options.data[i].children==undefined||options.data[i].children==null||options.data[i].children.length==0){
                
                li = $("<li id='"+options.data[i].id+"' name='"+options.data[i].pid+"' class=''></li>");
                
                _a = $("<a href='"+getRootPath()+options.data[i].url+"' class=''><i class='menu-icon fa "+options.data[i].action_pic+"'></i><span class='menu-text'> "+options.data[i].name+" </span></a>");
                }else{
                	
                li = $("<li id='"+options.data[i].id+"' name='"+options.data[i].pid+"' class=''></li>");
                _a = $("<a href='#' class='dropdown-toggle'><i class='menu-icon fa  "+options.data[i].action_pic+"'></i><span class='menu-text'> "+options.data[i].name+" </span><b class='arrow fa fa-angle-down'></b></a>");	
                }
               
                   _a.appendTo(li);
               _each(options.data[i],li);
                li.appendTo($("#"+options.ulId));
            });
         
           if(options.itemId!=""&&options.itemId!=null&&options.itemId!=undefined){
           	if(options.foder==true){
           		
           	  $("#"+options.itemId).parents("li").removeClass().addClass("active open");
              $("#"+options.itemId).addClass("active");
           	}else{
              $("#"+options.itemId).addClass("active");
           	}
        
           }
       
        }
    });
})(jQuery);

//二级
function _each(data,li){
    if(data==undefined||data.children==undefined||data.children.length==0){
        return false;
    }
    var ul = $("<ul name='"+data.id+"' class='submenu'></ul>");
    
    $.each(data.children,function(i,v){
    	var _li;
    	var _a;
    	if(data.children[i].children!=undefined){
    	 _li = $("<li  id='"+data.children[i].id+"' name='"+data.children[i].pid+" '></li>");
         _a = $("<a class='dropdown-toggle'> <i class='menu-icon fa fa-caret-right'></i>"+data.children[i].name+"<b class='arrow icon-angle-down'></b></a>");
    	}else{
    	 _li = $("<li  id='"+data.children[i].id+"' name='"+data.children[i].pid+" '></li>");
         _a = $("<a> <i class='menu-icon fa fa-caret-right'></i>"+data.children[i].name+"</a>");
    	}
      _a.attr("href",getRootPath()+data.children[i].url).appendTo(_li);
        
        if(data.children[i].children!=undefined){
        
            __each(data.children[i],_li);
        }
        _li.appendTo(ul);
    });
    ul.appendTo(li);
   
}

	
	  function getRootPath(){
	    var curWwwPath=window.document.location.href;
	    var pathName=window.document.location.pathname;
	    var pos=curWwwPath.indexOf(pathName);
	    var localhostPaht=curWwwPath.substring(0,pos);
	    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
	    return(localhostPaht+projectName+"/");
		}	

