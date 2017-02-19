<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath(); 
	String uuid = request.getParameter("uuid");
%>
<!DOCTYPE html>
<!-- saved from url=(0049)https://m.anrunjinrong.com/accountAction!myVip.do -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  
<link rel="apple-touch-icon" href="https://m.anrunjinrong.com/images/arjr/icon120.png">
<meta name="apple-mobile-web-app-title" content="安润金融触屏">  
<meta name="keywords" content="安润金融,安润金融官网,互联网金融,P2P网贷,投资理财,P2P理财,互联网理财,网络贷款,小额贷款,资金安全,anrunjinrong.com">
<meta name="description" content="安润金融触屏版 m.anrunjinrong.com - 国内最规范的互联网金融P2P网贷平台之一_为投资理财用户提供安全、诚信、透明的互联网金融务。银行级风险控制水平,大型机构资金担保,第三方资金托管,保障资金安全。">
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
<meta name="baidu-site-verification" content="U0KIAkdGPs">
    
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <title>安润金融</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/sjlr/style_vip.css">
    <style>
        .footer{
            margin-top: 40px;
        }
    </style>
</head>
<body>


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
<script src="${pageContext.request.contextPath}/assets/sjlr/jquery.min.js"></script>

<div class="header">
	<h1 class="fl_l"><a href="javascript:;toGoHome();"><img src="${pageContext.request.contextPath}/assets/sjlr/logo.png" width="155" height="44"></a></h1>
	
	
	<!--已登录-->
	<div class="loging fl_r">
		<a href="javascript:;myAccount();" class="fl_l">m***o</a>
		<a id="out" href="javascript:;out();">退出</a>
	</div>
	
</div>
    <div class="tabar tabar2">
        <a href="javascript:;goAccount();" class="tatar_return">&lt; 返回</a>
        会员等级
        <a href="javascript:;goRules();" class="tabar_help"><img src="${pageContext.request.contextPath}/assets/sjlr/invite_t01.png"></a>
    </div>
    <!-- 内容部分 -->
    <div class="grade_head">
        <ul class="grade_bar clearfix">
            <input type="hidden" id="level" value="USUAL">
            <input type="hidden" id="need" value="10">
            <!-- 是什么等级就给对应的li添加active类名 -->
			
            <li class="xs noActive" id="xsIcon">
            
            
                <p class="icon"></p>
                <p class="grade">新手</p>
            </li>
            
            
            <li class="pt active" id="ptIcon">
            
                <p class="icon"></p>
                <p class="grade">普通</p>
            </li>
            
            <li class="hj noActive" id="hjIcon">
            
            
                <p class="icon"></p>
                <p class="grade">黄金</p>
            </li>
            
            <li class="bj noActive" id="bjIcon">
            
            
                <p class="icon"></p>
                <p class="grade">白金</p>
            </li>
            
            <li class="zs noActive" id="zsIcon">
            
            
                <p class="icon"></p>
                <p class="grade">钻石</p>
            </li>

            <li class="grade_line noActive"></li>
            <!-- 进度条修改下面类名为progress的li的长度 -->
              
   			
            <li class="grade_line progress noActive" style="width: 43%;"></li>
            
            
            
                      
        </ul>
    </div>
    <div class="grade_content">
        <div class="grade">
            <p>
                <span class="name">贡献值 <img src="${pageContext.request.contextPath}/assets/sjlr/icon_point.png" alt="">&nbsp;：</span>
                <span>+10万元&nbsp;&nbsp;&nbsp;升级为黄金会员</span>
            </p>
            <p>
                <span class="name">单笔出借 <img src="${pageContext.request.contextPath}/assets/sjlr/icon_point.png" alt="">&nbsp;：</span>
                <span>+20万元&nbsp;&nbsp;&nbsp;升级为黄金会员</span>
            </p>
        </div>
        <div class="grade_list">
            <h3><span class="gradeName">普通会员</span>特权</h3>
            <div class="detail_box">
                <!-- 是什么等级就给下面的ul添加对应的类名
                     新手：xs，普通：pt，黄金：hj，白金：bj，钻石：zs-->
                <ul class="grade_detail pt">
                    <li>
                        <a href="javascript:;">新手专享项目</a>
                    </li>
                    <li>
                        <a href="javascript:;">专属VIP出借项目</a>
                    </li>
                    <li>
                        <a href="javascript:;">出借红包</a>
                    </li>
                    <li>
                        <a href="javascript:;">升级礼包</a>
                    </li>
                    <li>
                        <a href="javascript:;">沙龙活动</a>
                    </li>
                    <li>
                        <a href="javascript:;">专属理财顾问</a>
                    </li>
                    <li>
                        <a href="javascript:;">VIP客服热线</a>
                    </li>
                    <li>
                        <a href="javascript:;">生日礼包</a>
                    </li>
                    <li>
                        <a href="javascript:;">节日感恩礼</a>
                    </li>
                    <li>
                        <a href="javascript:;">周年感恩礼</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- 浮层 -->
    <div class="explain_box" style="display: none;">
        <div class="bg"></div>
        <div class="explain">
            <h3 class="explain_title">专属VIP出借项目</h3>
            <p class="explain_con">专属VIP出借项目是安润金融针对黄金VIP会员及以上等级会员推出的专享特权，会每天不定时推送，购买专属理财项目能够获得额外的加息奖励，让您收益快人一步。</p>
            <button class="explain_btn">我知道了</button><button class="explain_btn">我知道了</button>
        </div>
    </div>
    <!-- 底部 -->

<script type="text/javascript">
	function goPageOne(){
		window.location.href="homeAction.do";
	}
	
	</script>
<!--  <div class="edition">
	<a href="/jsp/arjrjsp/help/clientDown.jsp" class="fl_r">下载客户端</a>
</div> -->
<div class="footer">
	<ul>
		<li><a href="javascript:;goPageOne();">首页</a>&nbsp;|&nbsp;</li>
		<li><a href="https://m.anrunjinrong.com/jsp/arjrjsp/aboutus/about_us.jsp">关于我们</a>&nbsp;|&nbsp;</li>
		<li><a href="https://m.anrunjinrong.com/jsp/arjrjsp/help/help.jsp">帮助中心</a></li>
	</ul>
	<span>©2014 安润金融 anrunjinrong.com</span>
</div>

<script src="${pageContext.request.contextPath}/assets/sjlr/jquery.min(1).js"></script>
<script src="${pageContext.request.contextPath}/assets/sjlr/jquery-ui.min.js"></script>

    <script>
    	function goAccount(){
			window.location.href="accountAction.do";
		}
		function goRules(){
			window.location.href="accountAction!goRules.do";
		}
        // 点击等级导航
        var className = ['xs','pt','hj','bj','zs'];
        var gradeName = ['新手会员','普通会员','黄金会员','白金会员','钻石会员'];
        $('.grade_bar li').each(function(i){
            var index = i;
            $(this).click(function(){
                $('.grade_bar li').removeClass('active1').addClass('noActive');
                $('.gradeName').text(gradeName[index]);
                $(this).removeClass('noActive');
                for(var i = 0;i<className.length;i++){
                    $('.grade_detail').removeClass(className[i]);
                }
                if(!$(this).hasClass('active')){
                    $(this).addClass('active1');
                }
                else{
                    $(this).addClass('active');
                }
                $('.grade_detail').addClass(className[index]);
            })
        });

        // 点击特权列表
        var title = ['贡献值','单笔出借','新手专享项目','专属VIP出借项目','出借红包','升级礼包','沙龙活动','专属理财顾问','VIP客服热线','生日礼包','节日感恩礼','周年感恩礼'];
        var explain = ['贡献值为会员在安润平台年化累计出借金额的总和。',
                        '单笔出借是指会员在安润平台的最高单笔出借金额。',
                        '安润金融新手专享项目是安润金融的一大特色产品，为了让新用户对投资快速上路，该项目为新手专享项目，只有未进行过投资的新用户才可以投资（仅限一次），预期年化收益率可达14%，出借周期短。',
                        '专属VIP出借项目是安润金融针对黄金VIP会员及以上等级会员推出的专享特权，会每天不定时推送，购买专属理财项目能够获得额外的加息奖励，让您收益快人一步。',
                        '出借红包，也叫红包，是安润金融奖励给用户的电子虚拟现金的一种，黄金VIP会员及以上等级会员可以定期获得；当获得用户单笔出借额度满足领取红包条件时，系统将自动按照领取条件匹配符合条件的红包。',
                        '安润金融针对升级至黄金VIP会员及以上等级的会员特赠送升级感恩回馈礼包！ 内含大量丰富好礼等您来领取！奖品多多，升级就有。',
                        '沙龙活动是安润进行针对黄金VIP会员及以上等级会员推出的沙龙交流活动。',
                        '专属理财顾问是安润金融针对白金VIP会员及以上等级会员及指定高端用户推出尊享的专属服务通道， 在使用网站的过程中碰到各种问题，第一时间为您处理和解决。让您拥有一对一尊贵服务。',
                        'VIP客服热线是白金VIP会员及以上等级会员用注册手机拨打安润金融全国统一客服热线，系统将自动识别VIP会员身份，匹配VIP专属的客服坐席，尽享尊贵体验。',
                        '生日礼包是安润金融针对白金VIP会员及以上等级会员生日的感恩回馈。凡是用户生日当月，安润金融会送出一个生日礼包。',
                        '安润金融针对白金VIP会员及以上等级会员特推出节日回馈大礼包。',
                        '安润金融针对钻石VIP会员特推出周年感恩大礼包。'];
        $('.grade_content span.name').each(function(i){
            var index = i;
            $(this).click(function(){
                $('.explain_box').fadeIn(120);
                $('.explain_title').html(title[index]);
                $('.explain_con').html(explain[index]);
            })
        });
        $('.grade_detail li').each(function(i){
            var index = i;
            $(this).click(function(){
                $('.explain_box').fadeIn(120);
                $('.explain_title').html(title[index+2]);
                $('.explain_con').html(explain[index+2]);
            })
        });
        // 点击按钮关闭
        $('.explain_btn').click(function(){
            $('.explain_box').fadeOut(120);
        });
        $('.explain_box .bg').click(function(){
            $('.explain_box').fadeOut(120);
        });

        // 新手和钻石会员贡献值与单笔出借值数据写死
        if($('.grade_bar li.xs').hasClass('active')){
        	
            $('.grade p span:nth-child(2)').html('完成一笔出借&nbsp;&nbsp;&nbsp;升级为普通会员');
        }
        if($('.grade_bar li.zs').hasClass('active')){
            $('.grade p:nth-child(1) span:nth-child(2)').html('+100万元&nbsp;&nbsp;&nbsp;保级为钻石会员');
            $('.grade p:nth-child(2) span:nth-child(2)').html('+200万元&nbsp;&nbsp;&nbsp;保级为钻石会员');
        }
        if($('.grade_bar li.pt').hasClass('active')){
       		var need =$("#need").val();
       		$('.grade p:nth-child(1) span:nth-child(2)').html('+'+need+'万元&nbsp;&nbsp;&nbsp;升级为黄金会员');
       		$('.grade p:nth-child(2) span:nth-child(2)').html('+20万元&nbsp;&nbsp;&nbsp;升级为黄金会员');
            $('.grade p  span .grades').html('黄金会员');
        }
        if($('.grade_bar li.hj').hasClass('active')){
            var need =$("#need").val();
       		$('.grade p:nth-child(1) span:nth-child(2)').html('+'+need+'万元&nbsp;&nbsp;&nbsp;升级为白金会员');
       		$('.grade p:nth-child(2) span:nth-child(2)').html('+100万元&nbsp;&nbsp;&nbsp;升级为白金会员');
            $('.grade p  span .grades').html('白金会员');
        }
        if($('.grade_bar li.bj').hasClass('active')){
        	var need =$("#need").val();
            $('.grade p:nth-child(1) span:nth-child(2)').html('+'+need+'万元&nbsp;&nbsp;&nbsp;升级为钻石会员');
       		$('.grade p:nth-child(2) span:nth-child(2)').html('+200万元&nbsp;&nbsp;&nbsp;升级为钻石会员');
            $('.grade p  span .grades').html('钻石会员');
        }
        window.onload=function a(){
          console.log("初始化");
          var level= $("#level").val();
          if(level=='NEW'){
          	$("#xsIcon").click();
          }else if(level=='USUAL'){
          	$("#ptIcon").click();
          }else if(level=='GOLD'){
          	$("#hjIcon").click();
          }else if(level=='PLATINUM'){
          	$("#bjIcon").click();
          }else if(level=='DIAMOND'){
          	$("#zsIcon").click();
          }else{
          	$("#xsIcon").click();
          }
          
          
        }
    </script>
</body></html>