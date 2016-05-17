<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script>
	function zkbr_show(height) {
		var hideobj = document.getElementById("zkbr_bg");
		zkbr_bg.style.display = "block";
		zkbr_bg.style.height = height+"px";
		document.getElementById("zkbr_loading_div").style.display = "block";
	}
	
	function zkbr_show_msg(height,hint) {
		$("#zkbr_load_hint").html(hint);
		zkbr_show(height);
	}
	
	function zkbr_hide() {
		document.getElementById("zkbr_bg").style.display = "none";
		document.getElementById("zkbr_loading_div").style.display = "none";
	}
</script>
<style>
#zkbr_bg {
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

#zkbr_loading_div {
	position: absolute;
	top: 50%;
	left: 45%;
	display: none;
	z-Index: 2147483646;
}
</style>
<div id="zkbr_bg"></div>
<div id="zkbr_loading_div">
	<div id="zkbr_loading_hint" style="opacity: 1.0；-moz-user-select:-moz-none;" onselectstart="return false;">
		<i class="ace-icon fa fa-spinner fa-spin orange bigger-125"></i> <label style="color: white" id="zkbr_load_hint">请稍后... ...&nbsp;&nbsp;^o^</label>
	</div>
</div>
