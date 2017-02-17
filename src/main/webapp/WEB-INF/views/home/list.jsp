<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<!-- saved from url=(0040)https://m.anrunjinrong.com/loanAction.do -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
	name="viewport">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection">
<title>沈阳赏金猎人</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/sjlr/newstyle.css" />
<script type="text/javascript">
	function refresh(){
		window.location.href="loanAction.do";
	}
	function loadMore(){
		var id=$("#lastId").val();
		var type=$("#type").val();//serial
		document.getElementById('loadmore').style.display = "none";
		document.getElementById('loadmoremsg').style.display = "";
		$.ajax({
			contentType : 'application/json; charset=utf-8',
	      type: 'post',
	      dataType : "json",
	      url: '../home/loadMore.do' ,
	      data : JSON.stringify({'uuid':'f519b396-cfa5-4744-b940-d317870e5113','type':type} ),
	      success: function(data){
			for(var i=0;i<data.data.length;i++){
			var item = data.data[i];
			var div="<div class=\"list list_2 list_3\" onclick=\"detail('"+item.id+"');\">";
			div+="<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">";
			div+="<tbody><tr><td colspan=\"3\"></td><td style=\"width:40px;\"></td></tr><tr><td colspan=\"4\" class=\"list_r1\">";
			if(item.type==1){
			div+="<i class=\"mark1\">实</i>";
			}
			if(item.type==1){
			div+="<i class=\"mark2\">抵</i>";
			}
			if(item.type==1){
			div+="<i class=\"mark3\" style=\"margin-right:10px;\">担</i>";
			}
			
			//div+=data[i].title;
			//div+="<font color=\"red\">";
			//div+=data[i].subtitle;
			//div+="</font>";
			div+=" "+item.name
			div+="</td></tr><tr><td colspan=\"3\" class=\"list_r2\"><span><font>ID</font>";
			div+=item.name;
			div+="</span>";
			if("SETTLED"==item.status||"FROZEN"==item.status||"FINISHED"==item.status||"CLEARED"==item.status){
				div+="<div class=\"loading\"><i style=\"width:100%;\"></i></div>";
			}else if("OPENED"==item.status){
				div+="<div class=\"loading\"><i style=\"width:";
				div+=item.finishRate;
				div+="%;\"></i></div>";
			}
			if("SETTLED"==item.status||"FROZEN"==item.status||"FINISHED"==item.status||"CLEARED"==item.status){
				div+="<font class=\"fl_l\">100%</font>";
			}else if("OPENED"==item.status){
				div+="<font class=\"fl_l\">";
				div+=item.finishRate;
				div+="%</font>";
			}
			if("SCHEDULED"==item.status){
				div+="<div class=\"begintime\" id=\"";
				div+=item.id;
				div+="span\"></div>";
			}
			div+="</td><td rowspan=\"3\" align=\"right\" class=\"gobut-item\">";
// 			div+=a(item.status,item.id);
			div+="<a href=\"javascript:;void(0);\" class=\"gobut manb\">悬赏中</a>"
			
			div+="</td></tr><tr>";
			div+="<td class=\"list_r3\"><font>"+item.amount+"万元</font> "+ item.e_date+"</td>";
			div+="<td class=\"list_r3\"><font></font></td>";
			
			div+="</tr></tbody></table></div>";
					 
				
				if(i==data.length-1){//最后一条数据信息
					$("#lastId").val(item.id);
					
				}
				$("#moreLoad").before(div);
				if("SCHEDULED"==item.status){
					$("#puttimeDiv").before("<input type=\"hidden\" id=\""+item.id+"\" name=\"puttime\" value=\""+item.startPutTime+"\">");
				}
			}
	      	document.getElementById('loadmore').style.display = "";
	      	document.getElementById('loadmoremsg').style.display = "none";
	      } ,
	      error:function(data){
	      	document.getElementById('loadmoremsg').style.display = "";
	      	document.getElementById('loadmoremsg').innerHTML = "已无更多内容";
	      	document.getElementById('loadmore').style.display = "none";
	      },
	      dataType: "json"
		});
		
	}
	
	function a(type,id){
		var href="";
		if("OPENED"==type){
			href="<a href=\"javascript:;investPage('"+id+"');\" class=\"gobut\">立即出借</a>";
		}else if("FINISHED"==type){
			href="<a href=\"javascript:;void(0);\" class=\"gobut\">已满标</a>";
		}else if("FROZEN"==type){
			href="<a href=\"javascript:;void(0);\" class=\"gobut\">账户资金冻结</a>";
		}else if("SETTLED"==type){
			href="<a href=\"javascript:;void(0);\" class=\"gobut manb\">还款中</a>";
		}else if("CLEARED"==type){
			href="<a href=\"javascript:;void(0);\" class=\"gobut manb\">已还完</a>";
		}else if("SCHEDULED"==type){
			href="<a href=\"javascript:;void(0);\" class=\"gobut begin\">即将开始</a>";
			
		}else if("PROPOSED"==type){
			href="<a href=\"javascript:;void(0);\" class=\"gobut\">申请投标</a>";
		}else if("FROZEN_FAILED"==type){
			href="<a href=\"javascript:;void(0);\" class=\"gobut\">资金冻结失败</a>";
		}else if("FAILED"==type){
			href="<a href=\"javascript:;void(0);\" class=\"gobut liub\">流标</a>";
		}else if("CANCELED"==type){
			href="<a href=\"javascript:;void(0);\" class=\"gobut\">已取消</a>";
		
		}else if("CLEARED"==type){
			href="<a href=\"javascript:;void(0);\" class=\"gobut\">还款完成</a>";
		}else if("OVERDUE"==type){
			href="<a href=\"javascript:;void(0);\" class=\"gobut liub\">逾期</a>";
		}else if("BREACH"==type){
			href="<a href=\"javascript:;void(0);\" class=\"gobut liub\">违约</a>";
		}
		return href;
	}
	function investPage(id){//投资页面
		window.location.href="investAction!investPage.do?id="+id;
	}
	function detail(id){
		window.location.href="loanAction!detail.do?id="+id;
	}
	function gotoHome(){
		window.location.href="homeAction.do";
	}
</script>
<script type="text/javascript">
//一个小时，按秒计算，可以自己调整时间
function CountDown(){  
	var times=document.getElementsByName("puttime");
	for(var i=0;i<times.length;i++){
		var maxtime=times[i].value;
		times[i].value=times[i].value-1000;
    if(maxtime>=0){  
      var	days = Math.floor(maxtime/86400000);  
      var  hours = Math.floor((maxtime/1000/60/60)%24);  
      var  minutes = Math.floor((maxtime/1000/60)%60);  
      var  seconds = Math.floor((maxtime/1000)%60);  
        msg = days+"天"+hours+"小时"+minutes+"分"+seconds+"秒";  
        document.getElementById(times[i].id+"span").innerHTML=msg;  
    }  
	}
}  
timer = setInterval("CountDown()",1000); 
</script>
</head>

<body>
	<input type="hidden" id="pageSize" name="pageSize" value="7">
	<input type="hidden" id="lastId" name="lastId"
		value="E7CA7D7E-A382-4F9A-8888-0506EC5120FD" style="width: 400px;">
	<input type="hidden" id="type" value="" style="width: 400px;">

	<script type="text/javascript">
	function toGoHome(){
		window.location.href="homeAction.do";
	}

	function registerPage(){//注册页
		window.location.href="loginAction!registerPage.do?flag=0";
	}
	function out(){
	window.location.href="homeAction!out.do";
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
function downLoad(){
var u = navigator.userAgent, app = navigator.appVersion;
var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Linux') > -1; //android终端或者uc浏览器
var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
var ua = navigator.userAgent.toLowerCase(); 
var weixin =ua.match(/MicroMessenger/i)=="micromessenger";
if(isAndroid){
window.location.href="/arjrapp/arjr.apk";
}
if(isiOS){
window.location.href="https://itunes.apple.com/us/app/an-run-jin-rong/id951030583?mt=8";
}
if(weixin){
window.location.href="/jsp/weixin/aboutus/appDownload.html";
}

}
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
		 var ua = navigator.userAgent.toLowerCase(); 
		var weixin =ua.match(/MicroMessenger/i)=="micromessenger";
		if(weixin){
		window.location.href="weixinAction!loginPage.do";
		}else{
		window.location.href="loginAction!loginPage.do";
		}
	}
</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/sjlr/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/viewjs/sunny.js"></script>

	<div class="header">
		<h1 class="fl_l">
			<a href="javascript:;toGoHome();"><img src="${pageContext.request.contextPath}/assets/sjlr/logo.png" width="155" height="44"></a></a>
		</h1>

		<!--未登录-->
		 <div class="login fl_r">
			<a href="javascript:;registerPage();" class="fl_l">hi！张三</a> 
		</div> 


	</div>
	<!-- <ul class="tabar">
		<li><a href="javascript:;loanPage(&#39;aplan&#39;);">A计划</a></li>
		<li><a href="javascript:;loanPage(&#39;special&#39;);">特惠推荐</a></li>
		<li style="width: 34%;"><a
			href="javascript:;loanPage(&#39;common&#39;);" class="mark">直投项目</a></li>
	</ul> -->
	<div class="listbox">



		<div class="list list_2 list_3"
			onclick="detail(&#39;6E3EB711-6C11-4B63-8DE9-831ACEC09B33&#39;);">

			<table border="0" cellspacing="0" cellpadding="0">
				<tbody>
					<tr>
						<td colspan="3"></td>
						<td style="width: 40px;"></td>
					</tr>
					<tr>
						<td colspan="4" class="list_r1"><i class="mark1">个</i> <i
							class="mark1" style="margin-right: 10px;">人</i> 安牧贷-内蒙古-四子王旗某牧民 </td>
					</tr>
					<tr>
						<td colspan="3" class="list_r2"><span><font>ID</font>SZWQ2016113006Z</span>

						<div class="loading"> 
								<i style="width: 100%;"></i> 
						</div> <font class="fl_l"></font></td> 


						<td rowspan="3" align="right" class="gobut-item"><a
							href="javascript:;void(0);" class="gobut manb">悬赏中</a></td>

					</tr>
					<tr>
						<td class="list_r3"><font>10.0万元</font> 2017年10月20～2017年11月22日</td>
						<td class="list_r3"><font></font></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="list list_2 list_3"
			onclick="detail(&#39;6E3EB711-6C11-4B63-8DE9-831ACEC09B33&#39;);">

			<table border="0" cellspacing="0" cellpadding="0">
				<tbody>
					<tr>
						<td colspan="3"></td>
						<td style="width: 40px;"></td>
					</tr>
					<tr>
						<td colspan="4" class="list_r1"><i class="mark1">个</i> <i
							class="mark1" style="margin-right: 10px;">人</i> 安牧贷-内蒙古-四子王旗某牧民 </td>
					</tr>
					<tr>
						<td colspan="3" class="list_r2"><span><font>ID</font>SZWQ2016113006Z</span>

						<div class="loading"> 
								<i style="width: 100%;"></i> 
						</div> <font class="fl_l"></font></td> 


						<td rowspan="3" align="right" class="gobut-item"><a
							href="javascript:;void(0);" class="gobut manb">悬赏中</a></td>

					</tr>
					<tr>
						<td class="list_r3"><font>10.0万元</font> 2017年10月20～2017年11月22日</td>
						<td class="list_r3"><font></font></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="list list_2 list_3"
			onclick="detail(&#39;6E3EB711-6C11-4B63-8DE9-831ACEC09B33&#39;);">

			<table border="0" cellspacing="0" cellpadding="0">
				<tbody>
					<tr>
						<td colspan="3"></td>
						<td style="width: 40px;"></td>
					</tr>
					<tr>
						<td colspan="4" class="list_r1"><i class="mark1">个</i> <i
							class="mark1" style="margin-right: 10px;">人</i> 安牧贷-内蒙古-四子王旗某牧民 </td>
					</tr>
					<tr>
						<td colspan="3" class="list_r2"><span><font>ID</font>SZWQ2016113006Z</span>

						<div class="loading"> 
								<i style="width: 100%;"></i> 
						</div> <font class="fl_l"></font></td> 


						<td rowspan="3" align="right" class="gobut-item"><a
							href="javascript:;void(0);" class="gobut manb">悬赏中</a></td>

					</tr>
					<tr>
						<td class="list_r3"><font>10.0万元</font> 2017年10月20～2017年11月22日</td>
						<td class="list_r3"><font></font></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="list list_2 list_3"
			onclick="detail(&#39;6E3EB711-6C11-4B63-8DE9-831ACEC09B33&#39;);">

			<table border="0" cellspacing="0" cellpadding="0">
				<tbody>
					<tr>
						<td colspan="3"></td>
						<td style="width: 40px;"></td>
					</tr>
					<tr>
						<td colspan="4" class="list_r1"><i class="mark1">个</i> <i
							class="mark1" style="margin-right: 10px;">人</i> 安牧贷-内蒙古-四子王旗某牧民 </td>
					</tr>
					<tr>
						<td colspan="3" class="list_r2"><span><font>ID</font>SZWQ2016113006Z</span>

						<div class="loading"> 
								<i style="width: 100%;"></i> 
						</div> <font class="fl_l"></font></td> 


						<td rowspan="3" align="right" class="gobut-item"><a
							href="javascript:;void(0);" class="gobut manb">悬赏中</a></td>

					</tr>
					<tr>
						<td class="list_r3"><font>10.0万元</font> 2017年10月20～2017年11月22日</td>
						<td class="list_r3"><font></font></td>
					</tr>
				</tbody>
			</table>
		</div>

		<div id="moreLoad"></div>
		<a href="javascript:;loadMore();" class="more more2" id="loadmore">加载更多项目</a>
		<span class="more more2" id="loadmoremsg" style="display: none;">正在加载...</span>
	</div>

	<script type="text/javascript">
	function goPageOne(){
		window.location.href="homeAction.do";
	}
	
	</script>
	<!--  <div class="edition">
	<a href="/jsp/arjrjsp/help/clientDown.jsp" class="fl_r">下载客户端</a>
</div> -->
	<div class="footer">
<!-- 		<ul> -->
<!-- 			<li><a href="javascript:;goPageOne();">首页</a>&nbsp;|&nbsp;</li> -->
<!-- 			<li><a -->
<!-- 				href="https://m.anrunjinrong.com/jsp/arjrjsp/aboutus/about_us.jsp">关于我们</a>&nbsp;|&nbsp;</li> -->
<!-- 			<li><a -->
<!-- 				href="https://m.anrunjinrong.com/jsp/arjrjsp/help/help.jsp">帮助中心</a></li> -->
<!-- 		</ul> -->
		<span>©2017 赏金猎人 sjlr.com</span>
	</div>


	<div id="puttimeDiv"></div>
	<script>
document.body.addEventListener('touchstart', function () { });
</script>
</body>
</html>