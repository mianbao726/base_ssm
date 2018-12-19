<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script>
	function sunny_show(height) {
		var hideobj = document.getElementById("sunny_bg");
		sunny_bg.style.display = "block";
		sunny_bg.style.height = height+"px";
		document.getElementById("sunny_loading_div").style.display = "block";
	}
	
	function sunny_show_msg(height,hint) {
		$("#sunny_load_hint").html(hint);
		sunny_show(height);
	}
	
	function sunny_hide() {
		document.getElementById("sunny_bg").style.display = "none";
		document.getElementById("sunny_loading_div").style.display = "none";
	}
</script>
<style>
#sunny_bg {
	position: absolute;
	left: 0px;
	top: 0px;
	background-color: #000;
	width: 100%;
	height:100%
	filter: alpha(opacity = 60);
	opacity: 0.6;
	display: none;
	z-Index: 2147483645;
}

#sunny_loading_div {
	position: absolute;
	top: 50%;
	left: 45%;
	display: none;
	z-Index: 2147483646;
}
</style>
<div id="sunny_bg"></div>
<div id="sunny_loading_div">
	<div id="sunny_loading_hint" style="opacity: 1.0；-moz-user-select:-moz-none;" onselectstart="return false;">
		<i class="ace-icon fa fa-spinner fa-spin orange bigger-125"></i> <label style="color: white" id="sunny_load_hint">请稍后... ...&nbsp;&nbsp;^o^</label>
	</div>
</div>
