<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath(); 
	String uuid = request.getParameter("uuid");
%>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  
<link rel="apple-touch-icon" href="https://m.sjlr.com/images/arjr/icon120.png">
<meta name="apple-mobile-web-app-title" content="赏金猎人触屏">  
<meta name="keywords" content="赏金猎人,赏金猎人官网,互联网金融,P2P网贷,投资理财,P2P理财,互联网理财,网络贷款,小额贷款,资金安全">
<meta name="description" content="赏金猎人触屏版 m.sjlr.com - 国内最规范的互联网金融P2P网贷平台之一_为投资理财用户提供安全、诚信、透明的互联网金融务。银行级风险控制水平,大型机构资金担保,第三方资金托管,保障资金安全。">
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
<meta name="baidu-site-verification" content="U0KIAkdGPs">

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>沈阳债务包</title>
<style type="text/css">
input.textinput{font-size:16px;display:block; width:100%; height:44px; line-height:44px; border:0; border-bottom:#007FFF solid 2px;}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/sjlr/newstyle.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/sjlr/style_vip.css">
<script type="text/javascript">
var uuid = '<%=uuid %>';

	function goHome(){
		window.location.href="<%=path%>/home/index.html";
	}
	function investPage(id){
		window.location.href="investAction!investPage.do?id="+id;
	}
	function recharge(){
   		//window.location.href="rechargeAction.do";
   		window.location.href="rechargeAction.do?rapidRecharge=true";
   	}
  function refresh(){
		document.form.target="_parent";
		document.form.action="investAction.do";
		document.form.submit();
	}
   function loanList(){
		document.form.target="_parent";
		document.form.action="loanAction.do";
		document.form.submit();
	}	
	function allMoney(money){
		var pMoney=document.getElementById("pMoney").value;////项目可投金额
		var have=money.split(".");
		var pMoneyInt=pMoney.split(".");
		if(parseFloat(pMoney)<parseFloat(money)){
			document.getElementById("money").value=pMoneyInt[0];
		}
		else{
			document.getElementById("money").value=have[0];
		}
			
	}
	function sub(){
		var pMoney=parseFloat(document.getElementById("pMoney").value);//项目可投金额
		var hMoney=parseFloat(document.getElementById("hMoney").value);//账户余额
		var m=document.getElementById("money").value;
		var money=parseFloat(m);//用户输入金额
		//alert("项目可投金额:"+pMoney+"用户输入金额:"+money+(pMoney>money)+"@"+(typeof pMoney)+(typeof money));
		var ua = navigator.userAgent.toLowerCase(); 
		var weixin =ua.match(/MicroMessenger/i)=="micromessenger";
		if(weixin){
		$("#bidway").val("weixin");
		}
		var minInvestAmount = parseFloat($("#minInvestAmount").val()); 
		if(m==""||m==''){
			alert("请输入投资金额");
			return;
		}else if(money<minInvestAmount){
			alert(minInvestAmount+"元起投，请重新输入");
			return;
		}else if(pMoney<money){
			alert("项目剩余金额"+pMoney+",请重新输入");
			return;
		}else if(hMoney<money){
			alert("您的余额不足，请充值");
			return;
		}
		document.form.target="_blank";
		document.form.action="investAction!investing.do";
		document.form.submit();
		$(".pop_2").fadeIn(120);
	}
		function checkMoney(){
	    	var money=$("#money").val();
	    	if(money.length==1){
	    		$("#money").val(money.replace(/[^1-9]/g,''));
	    	}else{
	    		$("#money").val(money.replace(/\D/g,''));
	    	}
	    	var m=parseFloat(money);
	    	if(m==0)
	    		$("#money").val("");
    	}
    /**
	  * 小数型
	  */
	  function clearNoNum(obj,title){
	  	obj.value = obj.value.replace(/[^\d.]/g,"");  //清除“数字”和“.”以外的字符  
	  	obj.value = obj.value.replace(/^\./g,"");  //验证第一个字符是数字而不是. 
	  	obj.value = obj.value.replace(/\.{1,}/g,"."); //只保留第一个. 清除多余的.   
	  	obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
	  	obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3'); //只能输入两个小数
	  	obj.value = obj.value.replace("/^-?\d+\.?\d{0,1}"); //只能输入两个小数
	  	document.getElementById(title).value = obj.value;
	  }
</script>
<script type="text/javascript">
//一个小时，按秒计算，可以自己调整时间
var maxtime = 682188400;
function CountDown()
{  
    if(maxtime>=0)
    {  
       	days = Math.floor(maxtime/86400000);  
        hours = Math.floor((maxtime/1000/60/60)%24);  
        minutes = Math.floor((maxtime/1000/60)%60);  
        seconds = Math.floor((maxtime/1000)%60);  
        msg = days+"天"+hours+"小时"+minutes+"分"+seconds+"秒";  
        document.all["timer"].innerHTML=msg;  
        maxtime=maxtime-1000; 
    }  
}  
timer = setInterval("CountDown()",1000); 
</script>
</head>

<body style="background:#FFF;">

<script type="text/javascript">
	function toGoHome(){
		window.location.href="homeAction.do";
	}

	function registerPage(){//注册页
		window.location.href="loginAction!registerPage.do?flag=0";
	}
	function out(){
		window.location.href='<%=path%>/logout.html';
	}
	function myAccount(){
		window.location.href="accountAction.do";
	}
	function loanPage(type){//投资页面
	if(type=='aplan'){
	window.location.href="loanAction!getAplan.do";
	}
	if(type=='special'){
	window.location.href="loanAction!getSpecialLoans.do";
	}
	if(type=='common'){
	window.location.href="loanAction.do";
	}
	}
		

</script>
<script type="text/javascript">
/* var u = navigator.userAgent, app = navigator.appVersion;
var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Linux') > -1; //android终端或者uc浏览器
var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端 */

window.onload=function(){
var ua = navigator.userAgent.toLowerCase(); 
var weixin =ua.match(/MicroMessenger/i)=="micromessenger";
if(weixin){
$("#out").hide();
}
}
</script>
<script type="text/javascript">
// function downLoad(){
// var u = navigator.userAgent, app = navigator.appVersion;
// var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Linux') > -1; //android终端或者uc浏览器
// var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
// var ua = navigator.userAgent.toLowerCase(); 
// var weixin =ua.match(/MicroMessenger/i)=="micromessenger";
// if(isAndroid){
// window.location.href="/arjrapp/arjr.apk";
// }
// if(isiOS){
// window.location.href="https://itunes.apple.com/us/app/an-run-jin-rong/id951030583?mt=8";
// }
// if(weixin){
// window.location.href="/jsp/weixin/aboutus/appDownload.html";
// }

// }
function close(){
$.ajax({
	      type: 'POST',
	      url: 'homeAction!close.do' ,
	      success: function(data){}
	      }
	      )
//$("#topdown").show();//表示display:block, 
$("#topdown").hide();//表示display:none; 
}

	function loginPage(){
		$('#commit').show();
	}
	
	
</script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/sjlr/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/viewjs/sunny.js"></script>

<div class="header">
	<h1 class="fl_l"><a href="javascript:;toGoHome();"><img src="${pageContext.request.contextPath}/assets/sjlr/logo.png" width="119" height="44"></a></h1>
	
	<!--未登录-->
	<div class="loging fl_r">
		<a href="javascript:;myAccount();" class="fl_l" id = "hi">hi,m***o</a>
		<a id="out" href="javascript:;out();">退出</a>
	</div>
	
	
	
</div>
<div class="tabar tabar2">
	<a href="javascript:goHome();">&lt; 返回</a>
	悬赏详情
</div>
<div class="tabs_1 ui-tabs ui-widget ui-widget-content ui-corner-all">
	<div class="tabs">
		<h3>
		
		
		<span>
		<img src="${pageContext.request.contextPath}/assets/sjlr/a_03.png" height="22"><font  id = "context001">个人</font></span> <font id = "context002">载入中... ...</font><font color="red">悬赏中</font></h3>
		
		
		<ul class="tabs1 ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all" role="tablist">
<%-- 			<li class="first ui-state-default ui-corner-top ui-tabs-active ui-state-active ui-state-focus" role="tab" tabindex="0" aria-controls="tabox1" aria-labelledby="ui-id-1" aria-selected="true" aria-expanded="true"><a href="http://localhost:8080/base/home/detial.html?uuid=<%=uuid %>#tabox1" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-1">悬赏详情</a></li> --%>
<%-- 			<li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="tabox2" aria-labelledby="ui-id-2" aria-selected="false" aria-expanded="false"><a href="https://m.sjlr.com/loanAction!aplandetail.do?id=<%=uuid %>#tabox2" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-2">项目介绍</a></li> --%>
<%-- 			<li class="last ui-state-default ui-corner-top" style="width:34%;" role="tab" tabindex="-1" aria-controls="tabox3" aria-labelledby="ui-id-3" aria-selected="false" aria-expanded="false"><a href="https://localhost:8080?id=<%=uuid %>#tabox3" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-3">常见问题</a></li> --%>
				<li class="first ui-state-default ui-corner-top ui-tabs-active ui-state-active ui-state-focus" role="tab" tabindex="0" aria-controls="tabox1" aria-labelledby="ui-id-1" aria-selected="true" aria-expanded="true"><a href="http://localhost:8080/base/home/detial.html?uuid=<%=uuid %>#tabox1" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-1">悬赏详情</a></li>
				<li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="tabox2" aria-labelledby="ui-id-2" aria-selected="false" aria-expanded="false"><a href="https://m.sjlr.com/loanAction!aplandetail.do?id=<%=uuid %>#tabox2" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-2">项目介绍</a></li>
				<li class="last ui-state-default ui-corner-top" style="width:34%;" role="tab" tabindex="-1" aria-controls="tabox3" aria-labelledby="ui-id-3" aria-selected="false" aria-expanded="false"><a href="https://localhost:8080?id=<%=uuid %>#tabox3" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-3">常见问题</a></li>
		</ul>
	</div>
	<div id="tabox1" class="tabox1 ui-tabs-panel ui-widget-content ui-corner-bottom" aria-labelledby="ui-id-1" role="tabpanel" aria-hidden="false" style="display: block;">
		<div class="tabbox11">
			<table>
				<tbody>
					<tr>
						<td valign="top" style="width:35%;" colspan ="3">
<!-- 							<font>预期年化收益</font> -->
<!-- 							<span class="red">6+6.0 <font>%</font></span> -->
							<font>债务总额</font>
							<span id = "context003">载入中...</span>
						</td>
<!-- 						<td valign="top" style="width:85%;" colspan ="2"> -->
<!-- 							<font>债务周期</font> -->
<!-- 							<span>2017年02月16日~2017年02月16日<font></font></span> -->
<!-- 						</td> -->
						
					</tr>
					<tr>
						<td valign="top" style="width:100%;" colspan ="3">
							<font>债务地址</font>
							<span id = "context004">辽宁省沈阳市皇姑区长江南街6号</span>
						</td>
<!-- 						<td colspan="2" valign="top"> -->
<!-- 						         <font>剩余时间</font> -->
<!-- 								<span style="font-size:14px;" id="timer">7天21小时29分13秒</span> -->
<!-- 						</td> -->
					</tr>
					<tr style = "display : none">
						<td valign="top" style="width:100%;" colspan ="3">
 						         <font>剩余时间</font>
   								<span style="font-size:14px;" id="timer">7天21小时29分13秒</span>
						</td>
					</tr>
					
					<tr>
						<td valign="top" style="width:35%;" colspan ="3">
<!-- 							<font>预期年化收益</font> -->
<!-- 							<span class="red">6+6.0 <font>%</font></span> -->
							<font>债务周期</font>
							<span id = "context005">2017年02月16日~2017年02月16日<font></font></span>
						</td>
					</tr>
					<tr>
						<td valign="top" style="width:35%;" colspan ="3">
<!-- 							<font>预期年化收益</font> -->
<!-- 							<span class="red">6+6.0 <font>%</font></span> -->
							<font>债务详情</font>
							<span id = "context006">2017年02月16日~2017年02月16日<font></font></span>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		
		
		<input type="button" value="立即抢标" onclick="loginPage();" style="margin-bottom:20px !important;" id = "get_the_target">
		
		<p style="color:#999999;width:100%;text-align:center;position: relative;margin-top: 10px;margin-bottom:20px;">抢标有风险，选择需谨慎</p>
	</div>
	<div id="tabox2" class="tabox2 ui-tabs-panel ui-widget-content ui-corner-bottom" aria-labelledby="ui-id-2" role="tabpanel" aria-hidden="true" style="display: none;">
<!-- 		<h3 class="title"><font>名称</font><i></i></h3> -->
<!-- 		<div class="con"> -->
<!-- 			<font>说明：</font> -->
<!-- 			<p>新手计划第071期-新手计划</p> -->
<!-- 		</div> -->
		<h3 class="title"><font>悬赏介绍</font><i></i></h3>
		<div class="con">
			<font>说明：</font>
			<p>债务包是赏金猎人推出的便捷高效的自动出借工具。债务包在用户认可的标的范围内，对符合要求的标的进行自动出借，且回款本金在相应期限内自动复投，期限结束后债务包会通过赏金猎人债权转让平台进行转让退出。该计划所对应的标的均适用于赏金猎人资金安全伞计划并由系统实现标的分散资。</p>
		</div>
		<h3 class="title"><font>接标范围</font><i></i></h3>
		<div class="con">
			<font>说明：</font>
			<p>机构担保标、实地认证标</p>
		</div>
		<h3 class="title"><font>锁定期</font><i></i></h3>
		<div class="con">
			<font>说明：</font>
			<p>30 天</p>
		</div>
<!-- 		<h3 class="title"><font>购买条件</font><i></i></h3> -->
<!-- 		<div class="con"> -->
<!-- 			<font>说明：</font> -->
<!-- 			<p>购买金额100元起，且为100元的整数倍递增。</p> -->
<!-- 		</div> -->
		<h3 class="title"><font>回款方式</font><i></i></h3>
		<div class="con">
			<font>说明：</font>
			<p>
							
							
							一次性还本付息
							
			</p>
		</div>
		<h3 class="title"><font>风险保障</font><i></i></h3>
		<div class="con">
			<font>说明：</font>
			<p>资金安全伞计划</p>
		</div>
	</div>
	<div id="tabox3" class="tabox3 ui-tabs-panel ui-widget-content ui-corner-bottom" aria-labelledby="ui-id-3" role="tabpanel" aria-hidden="true" style="display: none;">
		<h3 class="title"><font>债务包安全吗？</font><i></i></h3>
		<div class="con">
			<font>说明：</font>
			<p>债务包所对应出借项目适用赏金猎人资金安全伞计划且拥有风险金无延迟优先赔付优势。</p>
		</div>
		<h3 class="title"><font>到期后如何取回本息？</font><i></i></h3>
		<div class="con">
			<font>说明：</font>
			<p>债务包到期后，我们会在债务包到期当日（T+0）把您的本金和收益一并返还至您的安润账户中，无需任何手动操作；债务包暂时不支持自动复投，您可以手动选择其他A产品进行出借。</p>
		</div>
		<h3 class="title"><font>债务包和散标的区别？</font><i></i></h3>
		<div class="con">
			<font>说明：</font>
			<p>债务包是依据风险分散原则，由赏金猎人智 能出借平台将客户出借资金自动分散投资到多个严格甄选的优质标的中，所投资债权日常利息回款在计划未到期前会进行立即复投以提升整体出借收益率，债务包到期后客户持有债权会自动转让给其他出借人以实现资金退出。与出借散标相比债务包具有出借简单、低风险、资金管理清晰等优势。</p>
		</div>
	</div>
</div>

<div class="explain_box" style="display: none ;" id = "commit">
        <div class="bg"></div>
        <div class="explain">
            <h3 class="explain_title">抢标提示</h3>
            <p class="explain_con">wow！我觉得没时间解释了，这个标是我的了！</p>
            <button class="explain_btn" onclick="show_commit()">确认接单</button>
            <hr/>
            <button class="explain_btn" onclick="javascript:$('#commit').hide();"><font color = "black">我再想想</font></button>
        </div>
    </div>

<div class="pop_2" style="display:none" id="alertDiv">
	<div class="popbg2"></div>
	<div class="popbox2">
		<h3>抢标提示<a href="javascript:void(0);" class="close">×</a></h3>
		<dl id ="hint_success">
			<dt><img src="${pageContext.request.contextPath}/assets/sjlr/tipok.png"></dt>
			<dd>
				<span><font>投资成功！</font> 您可以选择：</span>
<!-- 				<a href="javascript:refresh();">查看我的投资</a> -->
				<a href="javascript:goList();">继续抢标</a> 
			</dd>
		</dl>
		<dl class="last" id ="hint_error" style ="display:none">
			<dt><img src="${pageContext.request.contextPath}/assets/sjlr/tipno.png"></dt>
			<dd>
				<span><font>抢标失败！</font><font id = "error_hint"></font> 您可以选择：</span>
				<a href="javascript:goList();">查看其他悬赏</a>
			</dd>
		</dl>
	</div>
</div>


<script type="text/javascript">
	function goPageOne(){
		window.location.href="homeAction.do";
	}
	
	function goList(){
		window.location.href="<%=path%>/home/index.html";
	}
	
	</script>
<!--  <div class="edition">
	<a href="/jsp/arjrjsp/help/clientDown.jsp" class="fl_r">下载客户端</a>
</div> -->
<div class="footer">
<!-- 	<ul> -->
<!-- 		<li><a href="javascript:;goPageOne();">首页</a>&nbsp;|&nbsp;</li> -->
<!-- 		<li><a href="https://m.sjlr.com/jsp/arjrjsp/aboutus/about_us.jsp">关于我们</a>&nbsp;|&nbsp;</li> -->
<!-- 		<li><a href="https://m.sjlr.com/jsp/arjrjsp/help/help.jsp">帮助中心</a></li> -->
<!-- 	</ul> -->
	<span>©2017 赏金猎人 sjlr.com</span>
</div>

<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/sjlr/jquery.min.js"></script>
		
		<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/sjlr/jquery-ui.min.js"></script>
<script>
document.body.addEventListener('touchstart', function () { });

$(document).ready(function(e) {
$(".tijiao").click(function() {
		$(".pop_2").fadeIn(120);
	})
	$(".close").click(function() {
		$(".pop_2").fadeOut(120);
	})

	$(".tabs_1").tabs();
});
function hideDiv(){
	   $("#alertDiv").hide();
	}

function show_commit(){
	   
	   $("#commit").hide();
	   var params = {};
			params['uuid'] = uuid;
			$.ajax({
			contentType : 'application/json; charset=utf-8',
			url : "../debt/target.do",
			type : "post",
			dataType : "json",
			async:false,
			data : JSON.stringify(params),
			success : function(data) {
				console.log(data);
				if(200 == data.status_code){
					$("#hint_success").show();
					$("#hint_error").hide();
					$("#get_the_target").val("此标已有主了！");
					$("#get_the_target").attr("disabled",true); 
				}else{
					$("#hint_error").show();
					$("#hint_success").hide();
					if('y' == data.tarinfo.same){
						$("#error_hint").html("这个标已经是您的喽！")	
					}else{
						$("#error_hint").html("已经被"+data.tarinfo.targetname+"抢标了！")
					}
					
				}
// 				$("#context001").html(data.kind);
// 				$("#context002").html(data.name);
// 				$("#context003").html("￥" + data.amount + "万元");
// 				$("#context004").html(data.address);
// 				$("#context005").html(data.s_f_date+"~"+data.e_f_date);
// 				$("#form-field-1").val(data.name);
// 				$("#form-field-2").val(data.amount);
// 				$("#form-field-3").val(data.address);
// 				$("#form-field-4").val(data.s_date);
// 				$("#form-field-5").val(data.e_date);
			}
		});
	   $("#alertDiv").show();
	   
	}


//alert(id  +' ___  ' +(id != 'null'));
//alert(typeof(id)=="null");
//alert(id=="null");
var current_roleid ;
if(uuid != 'null'){
	var params = {};
	params['uuid'] = uuid;
			$.ajax({
			contentType : 'application/json; charset=utf-8',
			url : "../debt/selectOne.do",
			type : "post",
			dataType : "json",
			async:false,
			data : JSON.stringify(params),
			success : function(data) {
				
				 $("#hi").html("hi! "+data.hi);
				$("#context001").html(data.kind);
				$("#context002").html(data.name);
				$("#context003").html("￥" + data.amount + "万元");
				$("#context004").html(data.address);
				$("#context005").html(data.s_f_date+"~"+data.e_f_date);
				$("#context006").html(data.detial);
				
				console.log(data);
				if(data.target_status == 'close'){
					$("#get_the_target").val("此标已有主了！");
					$("#get_the_target").attr("disabled",true); 
				}
// 				<input type="button" value="立即抢标" onclick="loginPage();" style="margin-bottom:20px !important;">
// 				$("#form-field-1").val(data.name);
// 				$("#form-field-2").val(data.amount);
// 				$("#form-field-3").val(data.address);
// 				$("#form-field-4").val(data.s_date);
// 				$("#form-field-5").val(data.e_date);
			}
		});
}
</script>



</body></html>