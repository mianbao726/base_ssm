<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
<meta content="yes" name="apple-mobile-web-app-capable">     
<meta content="black" name="apple-mobile-web-app-status-bar-style">     
<meta content="telephone=no" name="format-detection">
<title>小牛优车</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/xnyc/style.css" />
</head>

<body>
<div class="filter">
	<div class="search">
		<span class="back_x"><a href="#" class="back"><img src="images/back.png" alt=""></a></span>
		<div class="select">
			<img src="images/site.png" alt="">
			<select>
				<option>北京</option>
				<option>乌鲁木齐</option>
			</select>
		</div>
		<label><img src="images/search.png" alt=""><input type="text" placeholder="请输入品牌/车系"></label>
		<a href="#">高级筛选</a>
	</div>
	<ul>
		<li>
			<a href="javascript:void(0);" class="filter_btn">排序</a>
			<div class="filter_pop2">
				<ul>
					<li><a href="#">排序方式</a></li>
					<li><a href="#">排序方式</a></li>
					<li><a href="#">排序方式</a></li>
					<li><a href="#">排序方式</a></li>
				</ul>
				<div class="pop2_bg"></div>
			</div>
		</li>
		<li>
			<a href="javascript:void(0);" class="pinp_btn">品牌</a>
		</li>
		<li>
			<a href="javascript:void(0);" class="filter_btn">价格</a>
			<div class="filter_pop2">
				<ol>
					<li><a href="#">不限</a></li>
					<li><a href="#">3万以下</a></li>
					<li><a href="#">3-5万</a></li>
					<li><a href="#">5-7万</a></li>
					<li><a href="#" class="active">7-9万</a></li>
					<li><a href="#">9-12万</a></li>
					<li><a href="#">12-16万</a></li>
					<li><a href="#">16-20万</a></li>
					<li><a href="#">20万以上</a></li>
				</ol>
				<div class="pop2_bg"></div>
			</div>
		</li>
		<li>
			<a href="javascript:void(0);" class="filter_btn">里程</a>
			<div class="filter_pop2">
				<ol>
					<li><a href="#">0-3万公里</a></li>
					<li><a href="#">3-6万公里</a></li>
					<li><a href="#">6-9万公里</a></li>
					<li><a href="#">9-12万公里</a></li>
					<li><a href="#" class="active">12-15万公里</a></li>
				</ol>
				<div class="pop2_bg"></div>
			</div>
		</li>
	</ul>
</div>
<div class="main carlist">
	<div class="filter_list">
		<span>筛选条件<a href="javascript:void(0);">&times;</a></span>
		<span>筛选条件<a href="javascript:void(0);">&times;</a></span>
		<span>筛选条件<a href="javascript:void(0);">&times;</a></span>
		<span>筛选条件<a href="javascript:void(0);">&times;</a></span>
		<a href="javascript:void(0);"><img src="images/reset.png" alt="">重置</a>
	</div>
	<a href="#"><img src="images/banner_1.png" alt=""></a>
	<div class="hotcar">
		<div class="list">
			<div><img src="images/hot_car.png" alt=""></div>
			<h5>英菲尼迪QX50 2015款2.5自动悦享版</h5>
			<p>2015年6月上牌 | 行驶3.0万公里</p>
			<p><i>日供300/分3期</i></p>
			<span>31.80万<font>¥41.23万</font></span>
		</div>
		<div class="list">
			<div><img src="images/hot_car.png" alt=""></div>
			<h5>英菲尼迪QX50 2015款2.5自动悦享版</h5>
			<p>2015年6月上牌 | 行驶3.0万公里</p>
			<p><i>日供300/分3期</i></p>
			<span>31.80万<font>¥41.23万</font></span>
		</div>
		<div class="list">
			<div><img src="images/hot_car.png" alt=""></div>
			<h5>英菲尼迪QX50 2015款2.5自动悦享版</h5>
			<p>2015年6月上牌 | 行驶3.0万公里</p>
			<p><i>日供300/分3期</i></p>
			<span>31.80万<font>¥41.23万</font></span>
		</div>
		<div class="list">
			<div><img src="images/hot_car.png" alt=""></div>
			<h5>英菲尼迪QX50 2015款2.5自动悦享版</h5>
			<p>2015年6月上牌 | 行驶3.0万公里</p>
			<p><i>日供300/分3期</i></p>
			<span>31.80万<font>¥41.23万</font></span>
		</div>
		<div class="list">
			<div><img src="images/hot_car.png" alt=""></div>
			<h5>英菲尼迪QX50 2015款2.5自动悦享版</h5>
			<p>2015年6月上牌 | 行驶3.0万公里</p>
			<p><i>日供300/分3期</i></p>
			<span>31.80万<font>¥41.23万</font></span>
		</div>
		<div class="list">
			<div><img src="images/hot_car.png" alt=""></div>
			<h5>英菲尼迪QX50 2015款2.5自动悦享版</h5>
			<p>2015年6月上牌 | 行驶3.0万公里</p>
			<p><i>日供300/分3期</i></p>
			<span>31.80万<font>¥41.23万</font></span>
		</div>
		<div class="list">
			<div><img src="images/hot_car.png" alt=""></div>
			<h5>英菲尼迪QX50 2015款2.5自动悦享版</h5>
			<p>2015年6月上牌 | 行驶3.0万公里</p>
			<p><i>日供300/分3期</i></p>
			<span>31.80万<font>¥41.23万</font></span>
		</div>
		<div class="list">
			<div><img src="images/hot_car.png" alt=""></div>
			<h5>英菲尼迪QX50 2015款2.5自动悦享版</h5>
			<p>2015年6月上牌 | 行驶3.0万公里</p>
			<p><i>日供300/分3期</i></p>
			<span>31.80万<font>¥41.23万</font></span>
		</div>
		<div class="list">
			<div><img src="images/hot_car.png" alt=""></div>
			<h5>英菲尼迪QX50 2015款2.5自动悦享版</h5>
			<p>2015年6月上牌 | 行驶3.0万公里</p>
			<p><i>日供300/分3期</i></p>
			<span>31.80万<font>¥41.23万</font></span>
		</div>
		<div class="list">
			<div><img src="images/hot_car.png" alt=""></div>
			<h5>英菲尼迪QX50 2015款2.5自动悦享版</h5>
			<p>2015年6月上牌 | 行驶3.0万公里</p>
			<p><i>日供300/分3期</i></p>
			<span>31.80万<font>¥41.23万</font></span>
		</div>
		<div class="list">
			<div><img src="images/hot_car.png" alt=""></div>
			<h5>英菲尼迪QX50 2015款2.5自动悦享版</h5>
			<p>2015年6月上牌 | 行驶3.0万公里</p>
			<p><i>日供300/分3期</i></p>
			<span>31.80万<font>¥41.23万</font></span>
		</div>
		<div class="list">
			<div><img src="images/hot_car.png" alt=""></div>
			<h5>英菲尼迪QX50 2015款2.5自动悦享版</h5>
			<p>2015年6月上牌 | 行驶3.0万公里</p>
			<p><i>日供300/分3期</i></p>
			<span>31.80万<font>¥41.23万</font></span>
		</div>
		<p>--- 为您推荐的20辆热门好车---</p>
	</div>
</div>
<div class="filter_pop">
	<div class="top_bar">
		<a href="javascript:void(0);" class="back pp_back"><img src="images/back.png" alt=""></a>
		品牌选择
	</div>
	<div class="pp_pop">
		<h5>奥迪</h5>
		<h6>选择车系</h6>
		<ul>
			<li><a href="#">不限车系</a></li>
			<li><a href="#">奥迪A6L</a></li>
			<li><a href="#">奥迪A6L</a></li>
			<li><a href="#">奥迪A6L</a></li>
			<li><a href="#">奥迪A6L</a></li>
			<li><a href="#">奥迪A6L</a></li>
			<li><a href="#">奥迪A6L</a></li>
			<li><a href="#">奥迪A6L</a></li>
			<li><a href="#">奥迪A6L</a></li>
			<li><a href="#">奥迪A6L</a></li>
			<li><a href="#">奥迪A6L</a></li>
			<li><a href="#">奥迪A6L</a></li>
			<li><a href="#">奥迪A6L</a></li>
			<li><a href="#">奥迪A6L</a></li>
			<li><a href="#">奥迪A6L</a></li>
			<li><a href="#">奥迪A6L</a></li>
			<li><a href="#">奥迪A6L</a></li>
			<li><a href="#">奥迪A6L</a></li>
			<li><a href="#">奥迪A6L</a></li>
			<li><a href="#">奥迪A6L</a></li>
			<li><a href="#">奥迪A6L</a></li>
			<li><a href="#">奥迪A6L</a></li>
			<li><a href="#">奥迪A6L</a></li>
			<li><a href="#">奥迪A6L</a></li>
			<li><a href="#">奥迪A6L</a></li>
			<li><a href="#">奥迪A6L</a></li>
			<li><a href="#">奥迪A6L</a></li>
		</ul>
	</div>
	<div class="pp_popbg"></div>
	<dl class="pinp">
		<dt>A</dt>
		<dd>
			<ul>
				<li><a href="#">奥迪</a></li>
				<li><a href="#">阿斯顿马丁</a></li>
			</ul>
		</dd>
		<dt>B</dt>
		<dd>
			<ul>
				<li><a href="#">别克</a></li>
				<li><a href="#">本田</a></li>
				<li><a href="#">宝马</a></li>
				<li><a href="#">奔驰</a></li>
				<li><a href="#">比亚迪</a></li>
				<li><a href="#">标致</a></li>
				<li><a href="#">保时捷</a></li>
				<li><a href="#">奔腾</a></li>
				<li><a href="#">宝骏</a></li>
				<li><a href="#">北京汽车</a></li>
				<li><a href="#">北汽幻速</a></li>
				<li><a href="#">北汽制造</a></li>
				<li><a href="#">宾利</a></li>
				<li><a href="#">巴博斯</a></li>
				<li><a href="#">布加迪</a></li>
			</ul>
		</dd>
		<dt>C</dt>
		<dd>
			<ul>
				<li><a href="#">长城</a></li>
				<li><a href="#">长安</a></li>
				<li><a href="#">昌河</a></li>
			</ul>
		</dd>
		<dt>D</dt>
		<dd>
			<ul>
				<li><a href="#">大众</a></li>
				<li><a href="#">东风</a></li>
				<li><a href="#">东南</a></li>
				<li><a href="#">帝豪</a></li>
				<li><a href="#">道奇</a></li>
				<li><a href="#">大通</a></li>
				<li><a href="#">大宇</a></li>
				<li><a href="#">大迪</a></li>
			</ul>
		</dd>
		<dt>E</dt>
		<dd>
			<ul>
				<li><a href="#">别克</a></li>
				<li><a href="#">本田</a></li>
				<li><a href="#">宝马</a></li>
				<li><a href="#">奔驰</a></li>
				<li><a href="#">比亚迪</a></li>
				<li><a href="#">标致</a></li>
				<li><a href="#">保时捷</a></li>
				<li><a href="#">奔腾</a></li>
				<li><a href="#">宝骏</a></li>
				<li><a href="#">北京汽车</a></li>
				<li><a href="#">北汽幻速</a></li>
				<li><a href="#">北汽制造</a></li>
				<li><a href="#">宾利</a></li>
				<li><a href="#">巴博斯</a></li>
				<li><a href="#">布加迪</a></li>
			</ul>
		</dd>
		<dt>F</dt>
		<dd>
			<ul>
				<li><a href="#">长城</a></li>
				<li><a href="#">长安</a></li>
				<li><a href="#">昌河</a></li>
			</ul>
		</dd>
		<dt>G</dt>
		<dd>
			<ul>
				<li><a href="#">大众</a></li>
				<li><a href="#">东风</a></li>
				<li><a href="#">东南</a></li>
				<li><a href="#">帝豪</a></li>
				<li><a href="#">道奇</a></li>
				<li><a href="#">大通</a></li>
				<li><a href="#">大宇</a></li>
				<li><a href="#">大迪2</a></li>
			</ul>
		</dd>
	</dl>
</div>
<script src="${pageContext.request.contextPath}/assets/xnyc/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/xnyc/script.js"></script>
<script>
$(document).ready(function(e) {
	var textWidth = $(".select").find("select option:selected").val().length + "em";
	var leftWidth = $(".select").find("select option:selected").val().length * 14 + 30;
	
	$(".select").find("select").css("width", textWidth);
	$(".select").next("label").css("margin-left", leftWidth + 44);
	
	$(".select").find("select").change(function() {
		var textWidth = $(".select").find("select").val().length + "em";
		var leftWidth = $(".select").find("select option:selected").val().length * 14 + 30;
		
		$(this).css("width", textWidth);
		$(".select").find("select").css("width", textWidth);
		$(".select").next("label").css("margin-left", leftWidth + 44);
	});
	
	
	$(function(){
	//	$(".pinp").groupList();      //相对窗口顶部
		$(".pinp").groupList(true);
	});
	$.fn.groupList = function(selfScroll){
		var list = this;
		var listTopOffset = list.offset().top;
		var titleHeight = $(list).find("dt:first").height();
		
	
		var currentContext = selfScroll ? list : $(window);
		if(selfScroll){
			list.css({
				"height": $(window).height() - listTopOffset,
				"overflow":"auto"
			});
		}
		$(currentContext).on("scroll",function(){
			if($(currentContext).scrollTop()-(selfScroll ? 0 : listTopOffset) < titleHeight){
				clearFixed();
			}else{
				var lis = list.find("li");

				for(var i = 0, len = lis.length ; i < len ; i++){
					if(isOnSight(lis[i])){
						clearFixed().filter(".clone").remove();
						lis.eq(i).parent().parent().prev().clone(true).addClass("clone").css({
							"top": selfScroll ? listTopOffset : 0,
							"position":"fixed",
							"width":"100%"
						}).appendTo(list.parent());
						break;
					}
				}
			}
		});
		var isOnSight = function(item){
			return selfScroll ? listTopOffset < $(item).offset().top + $(item).outerHeight() : $(currentContext).scrollTop() <  $(item).offset().top + $(item).outerHeight();
		};
		var clearFixed = function(){
			return $(list).next("dt").css({
				"position":""
			});
		};
	};
});
</script>
</body>
</html>