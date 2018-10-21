<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Gentelella Alela! | login</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/assets/default/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/assets/default/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath}/assets/default/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="${pageContext.request.contextPath}/assets/default/vendors/animate.css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath}/assets/default/build/css/custom.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/assets/default/vendors/jquery/dist/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/xx/xx.js"></script>
    <script>
    function login(){
    	var user_name = $("#user_name").val();
		var password = $("#password").val();
		var params = {};
		params['username'] = user_name;
		params['password'] = password;
		$.wj.c(params);
		$.wj.ajax({
			  url: "user/login.do",
			  type:"post",
			  dataType:"json",
			  params:params,
			  success:function(data){
					window.location.href = "<%=path%>/dashboard.html";
			  }
		});
    }
    
    document.onkeydown = function(e){
	    var event = e || window.event;  
	    var code = event.keyCode || event.which || event.charCode;
	    if (code == 13) {
	        login();
	    }
	};
    </script>
  </head>
<body>
<script>!(function(a,b,c,d,e,f){var g="",h=a.sessionStorage,i="__admaster_ta_param__",j="tmDataLayer"!==d?"&dl="+d:"";
if(a[f]={},a[d]=a[d]||[],a[d].push({startTime:+new Date,event:"tm.js"}),h){var k=a.location.search,
l=new RegExp("[?&]"+i+"=(.*?)(&|#|$)").exec(k)||[];l[1]&&h.setItem(i,l[1]),l=h.getItem(i),
l&&(g="&p="+l+"&t="+ +new Date)}var m=b.createElement(c),n=b.getElementsByTagName(c)[0];m.src="//tag.cdnmaster.cn/tmjs/tm.js?id="+e+j+g,
m.async=!0,n.parentNode.insertBefore(m,n)})(window,document,"script","tmDataLayer","TM-092483","admaster_tm");</script>
<form id="acctForm" name="acctForm" action="/perbank/bk0321/acctmng/acctqry" method="post">
	<input type="hidden" name="cardNo" value="">
	<input type="hidden" name="cardNo_enc" value="">
	<input type="hidden" name="realCardNo" value="">
	<input type="hidden" id="size" name="size" value="2">
	<input type="hidden" name="token" value="647582ee-d496-4c6e-9daf-ac54b1f4ab69">
</form>
<div id="container">
   <div id="header">
   	   




<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>汇丰中国信用卡个人网上银行</title>
<script type="text/javascript">
function clicktab(name){
	document.homeForm.action="/perbank/"+name;
	document.homeForm.submit();
}

function exit1(){ 
	if(confirm("您确定要退出网银吗？")){
		document.homeForm.action="/perbank/0321/exit";
		document.homeForm.bankcode.value="0321";
		document.homeForm.submit()		
	}
}
</script>



	<form id="homeForm" name="homeForm" action="/perbank/home" method="post">
		<input type="hidden" id="bankcode" name="bankcode" value="">
	</form>
  	<div class="head">
   			<div class="top">
   				<div style="float:right;margin-top:10px;margin-left:12px;"><span>&nbsp;&nbsp;<a href="javascript:exit1();">安全退出</a></span>
                </div>
            	<div style="float:right;margin-top:10px;"><span>&nbsp;&nbsp;<a href="javascript:clicktab('bk0321/acctmng/acctqry')">汇丰网银首页</a></span>
                </div>
                <div style="float:right;margin-top:8px;">
            		<span>
                   	  <img src="/perbank/images/0321/home.png">
                   </span>
                </div>
             </div>
             <div id="customer_id_cupd" style="visibility:hidden !important; display:none !important;">v1:ZXg4M0cwbk9lR096eVZLMQ==-l69NkTD5MGvdksxzLAF2V/xI+8TkAzKTZw4P3/oLWgDZd2dWqNl+5tAZTJ8ACA7+</div>
   	</div>
     


   </div>
		<div id="menu">
			 





<script type="text/javascript">

function menuFix(pmenuId,menuId){
	/*首页*/
	if (menuId=='1000') {
		document.menuForm.action="/perbank/welcome";
		
	}
	/*我的账户*/
	if (menuId=='2000') {
		document.menuForm.action="/perbank/bk0321/acctmng/acctqry";
	}
	if (menuId=='2001') {
		document.menuForm.action="/perbank/bk0321/acctmng/acctqry";
	}
	if (menuId=='2002') {
		document.menuForm.action="/perbank/bk0321/acctmng/acctmng";
	}
	
	/*账单管理*/
	if (menuId=='3000') {
		document.menuForm.action="/perbank/bk0321/billmng/bill/index";
	}
	if (menuId=='3001') {
		document.menuForm.action="/perbank/bk0321/billmng/bill/index";
	}
	if (menuId=='3002') {
		document.menuForm.action="/perbank/bk0321/billmng/unbill/index";
	}
	if (menuId=='3003') {
		document.menuForm.action="/perbank/bk0321/billmng/resend/index";
	}
	
	
	/*分期业务*/
	if (menuId=='4000') {
		document.menuForm.action="/perbank/bk0321/installment/flexible/apply";
	}
	if (menuId=='4001') {
		document.menuForm.action="/perbank/bk0321/installment/flexible/apply";
	}
	if (menuId=='4002') {
		document.menuForm.action="/perbank/bk0321/installment/bill/apply";
	}
  	if (menuId=='4009') {
		document.menuForm.action="/perbank/bk0321/installment/big/index";
	} 
	if (menuId=='4005') {
		document.menuForm.action="/perbank/bk0321/installment/hisqry/index";
	}
     if (menuId=='4006') {
		document.menuForm.action="/perbank/bk0321/installment/cash/index";
	}
	if (menuId=='4007') {
		document.menuForm.action="/perbank/bk0321/installment/limit/index";
	}
	
	/*积分查询*/
	if (menuId=='5000') {
		document.menuForm.action="/perbank/bk0321/points/ptquery/index";
	}
	
	/*还款设置*/
	if (menuId=='6000') {
		document.menuForm.action="/perbank/bk0321/repayment/repay/index";
	}
	if (menuId=='6001') {
		document.menuForm.action="/perbank/bk0321/repayment/repay/index";
	}
 	if (menuId=='6002') {
		document.menuForm.action="/perbank/bk0321/repayment/exchange/index";
	} 
 	if (menuId=='6003') {
		document.menuForm.action="/perbank/bk0321/repayment/real/index";
	} 
 	

	/*功能设置*/
	if (menuId=='7000') {
		document.menuForm.action="/perbank/bk0321/settings/pwdqry/index";
	}
	if (menuId=='7001') {
		document.menuForm.action="/perbank/bk0321/settings/pwdqry/index";
	}

	if (menuId=='7003') {
		document.menuForm.action="/perbank/bk0321/settings/pwdbypay/index";
	}
	if (menuId=='7004') {
		document.menuForm.action="/perbank/bk0321/settings/childcard/index";
	}
	
	if (menuId=='7005') {
		document.menuForm.action="/perbank/bk0321/settings/email/index";
	}
	if (menuId=='7006') {
		document.menuForm.action="/perbank/bk0321/settings/email/index";
	}
	if (menuId=='7007') {
		document.menuForm.action="/perbank/bk0321/settings/billsend/index";
	}
	if (menuId=='7008') {
		document.menuForm.action="/perbank/bk0321/settings/netpay/index";
	} 
	if (menuId=='7009') {
		document.menuForm.action="/perbank/bk0321/settings/pwdtran/index";
	}
	if (menuId=='7010') {
		document.menuForm.action="/perbank/bk0321/settings/billday/index";
	}
	
	/*特殊业务*/
	if (menuId=='8000') {
		document.menuForm.action="/perbank/special/iccardqry/index";
	}
	if (menuId=='8001') {
		document.menuForm.action="/perbank/special/iccardqry/index";
	}
	if (menuId=='8002') {
		document.menuForm.action="/perbank/special/dreammng/gjj/blance";
	}

	
	document.menuForm.pmenuId.value=pmenuId;
	document.menuForm.menuId.value=menuId;
	document.menuForm.submit();
	
}

function menuchoose(){
	var menuId= '';
	var pmenuId = '';
	if (menuId=='' || menuId=='0000') 
		pmenuId='m3';
	 document.getElementById(pmenuId).className="active";
}



</script> 


<div class="menu-top">
	<div class="menu-logo">
  		    <div style="margin-top: 10px;">
               <img height="41" src="/perbank/images/0321/logo.png">
            </div>
	</div>
	<div class="menu-list">
		<ul id="topMenu">
			<li id="m3" class="active"><p><a style="border-left:0px solid #d2d2d2" href="javascript:menuFix('m3','2001')"><span style="border-left:0;">账单与额度</span></a></p>
				<ul>
					<li><a href="javascript:menuFix('m3','2001')">概览</a></li>
					<li><a href="javascript:menuFix('m3','3001')">账单</a></li>
					<li><a href="javascript:menuFix('m3','3002')">未出账交易</a></li>
					<li><a href="javascript:menuFix('m3','7007')">电子账单设置</a></li>
					<li><a href="javascript:menuFix('m3','7010')">账单日设置</a></li>
					<li><a href="javascript:menuFix('m3','3003')">账单补寄</a></li>	
					<li><a href="javascript:menuFix('m4','4007')">申请临时调额</a></li>			
				</ul>
			</li>
			<li id="m6"><p><a href="javascript:menuFix('m6','6000')"><span>还款与积分</span></a></p>
				<ul>
					<li><a href="javascript:menuFix('m6','6001')">自动还款设置</a></li>
					<li><a href="javascript:menuFix('m6','6002')">还当期美元账单</a></li>
					<li><a href="javascript:menuFix('m6','6003')">还当期人民币账单</a></li>
					<li><a href="javascript:menuFix('m6','5000')">积分查询</a></li>
				</ul>
			</li>
			<li id="m4"><p><a href="javascript:menuFix('m4','4001')"><span>分期业务</span></a></p>
				 <ul>
					 <li><a href="javascript:menuFix('m4','4001')">交易分期申请</a></li>
					 <li><a href="javascript:menuFix('m4','4002')">账单分期申请</a></li>
					 <li><a href="javascript:menuFix('m4','4006')">现金分期申请</a></li>
					<!--  <li><a href="javascript:menuFix('m4','4009')">荟享贷申请</a></li>  -->
					 <li><a href="javascript:menuFix('m4','4005')">分期历史查询</a></li>
				 </ul>
			</li>

			<li id="m7"><p><a href="javascript:menuFix('m7','7001')"><span>安全用卡</span></a></p>
				<ul>
					<li><a href="javascript:menuFix('m7','7001')">查询密码修改</a></li>
					<li><a href="javascript:menuFix('m7','7009')">交易密码管理</a></li>
					<li><a href="javascript:menuFix('m7','7003')">交易凭密设置</a></li>
					<li><a href="javascript:menuFix('m7','7008')">第三方支付设置</a></li>
					<li><a href="javascript:menuFix('m7','7004')">附属卡额度设置</a></li>
				</ul>
			</li>
			<li id="m8"><p><a href="javascript:menuFix('m8','7005')"><span>联系信息修改</span></a></p>
				<ul>
				 	<li><a href="javascript:menuFix('m8','7006')">电子邮件修改</a></li>
				</ul>
			</li>
		</ul>
	</div>
</div>
<form id="menuForm" name="menuForm" action="" method="post">
	<input type="hidden" id="menuId" name="menuId" value="welcome">
	<input type="hidden" id="pmenuId" name="pmenuId" value="m1">
</form>


<script type="text/javascript">
menuchoose();
</script> 


	   </div>
   <div id="page">
	
	   <!--content-->
	   
	    <div id="content">
	    	<div id="content_title">
				  <span></span>
			</div>
	    	<div id="content_left">
	    		<div class="ui-tab ui-tab-transparent">
		            <ul class="ui-tab-items">
		              <li class="ui-tab-item ui-tab-item-current">
		                <a class="ui-tab-item-link" href="javascript:choosetab('bk0321/acctmng/acctqry')">概览</a>
		              </li>
		              <li class="ui-tab-item">
		                <a class="ui-tab-item-link" href="javascript:choosetab('/bk0321/billmng/bill/index')">账单</a>
		              </li>
		              <li class="ui-tab-item">
		                <a class="ui-tab-item-link" href="javascript:choosetab('/bk0321/billmng/unbill/index')">未出账交易</a>
		              </li>
		              <li class="ui-tab-item">
		                <a class="ui-tab-item-link" href="javascript:choosetab('/bk0321/settings/billsend/index')">电子账单设置</a>
		              </li>
		              <li class="ui-tab-item">
		                <a class="ui-tab-item-link" href="javascript:choosetab('bk0321/settings/billday/index')">账单日修改</a>
		              </li>
		              <li class="ui-tab-item">
		                <a class="ui-tab-item-link" href="javascript:choosetab('/bk0321/billmng/resend/index')">账单补寄</a>
		              </li>
		              <li class="ui-tab-item">
		                <a class="ui-tab-item-link" href="javascript:choosetab('bk0321/installment/limit/index')">申请临时调额</a>
		              </li>
		            </ul>
          		</div>
				<div id="main">


					<div class="pt10">

						<div class="title"><span>额度信息</span></div>
						<div class="f14">
		                        <table class="tabB w814 pt10" cellspacing="0">
									  <tbody><tr>
									   	  									      <td class="tit" width="116">币种</td>
										  <td class="tit" width="116">信用额度</td>
			                              <td class="tit" width="116">可用额度</td>
			                              <td class="tit" width="116">现金提取额度</td>
			                              <td class="tit" width="116">现金提取可用额度</td>
			                              <td class="tit" width="116">临时额度</td>
			                              <td class="tit" width="116">临时额度到期日</td>
			                              			                           </tr>
			                           
			                           <tr>
			                              									      <td class="">人民币</td>
										  <td class="">21,000.00</td>
			                              <td class="">15,724.00</td>
			                              <td class="">10,500.00</td>
			                              <td class="">10,500.00</td>
			                              <td class="">31,000.00</td>
			                              <td class="">2018-04-21</td>
			                              
			                           </tr>
			                           
			                           			                           <tr class="bg-gray">
			                              			                              <td class="">美元</td>
										  <td class="">3,069.91</td>
			                              <td class="">2,298.63</td>
			                              <td class="">1,534.95</td>
			                              <td class="">1,534.95</td>
			                              <td class="">--</td>
			                              <td class="">--</td>
			                              			                           </tr>
			                           									   
			                        </tbody></table>
	                    	</div>

	               </div>

				   <div class="mt10">
				   		<div class="title"><span>账单信息</span></div>
						<div class="f14" id="content2">
		                        <table class="tabB w814 pt10" cellspacing="0">
									  <tbody><tr>
			                          	  <td class="tit" width="100">币种</td>
									 	  <td class="tit" width="102">账单日</td>
									 	  <td class="tit" width="102">本期账单金额</td>
									 	  <td class="tit" width="102">未还金额</td>
									 	  <td class="tit" width="102">最低还款额</td>
			                              <td class="tit" width="102">已还金额</td>
									 	  <td class="tit" width="102">最后还款日</td>
									 	  <td class="tit" width="102">当前欠款</td>    
			                           </tr>
			                           
			                           <tr>
									      <td class="">人民币</td>
										  <td class="">05</td>
			                              <td class="">18,252.44</td>
			                              <td class="">999999999.00</td>
			                              <td class="">912.62</td>
			                              <td class="">18,252.44</td>
			                              <td class="">2018-08-25</td>
			                              <td class="">5,276.00</td>            
			                           </tr>
			                           
			                           			                           <tr class="bg-gray">
			       						  <td class="">美元</td>
										  <td class="">05</td>
			                              <td class="">0.00</td>
			                              <td class="">0.00</td>
			                              <td class="">0.00</td>
			                              <td class="">0.00</td>
			                              <td class="">2018-08-25</td>
			                              <td class="">0.00</td>                       
			                           </tr>
									   			                        </tbody></table>
	                    	</div>
             		</div>
             		
             		<div class="title"><span>我的信用卡</span></div>
							
							<div class="f14" id="content3">
		                       	<table class="tabB w814 pt10" cellspacing="0">
								  <tbody><tr>
								      <td class="tit" width="162">信用卡卡号</td>
									  <td class="tit" width="162">卡片种类</td>
		                              <td class="tit" width="162">主附卡标志</td>
		                              <td class="tit" width="162">卡片状态</td>
		                              <td class="tit" width="162">操作</td>
		                           </tr>
		                           								   		                           <tr>
		                              <td>5300*****8914</td>
		                              <td>生活美元白金卡      </td>
		                              <td> 主卡 </td>
		                              <td> 正常  </td>
		                              		                              	<td><span style="color: #71A5CC;font-weight:bold;">--</span></td>
		                              		                           </tr>
		                           		                           <tr class="bg-gray">
		                              <td>6251*****7222</td>
		                              <td>生活人民币白金卡    </td>
		                              <td> 主卡 </td>
		                              <td> 正常  </td>
		                              		                              	<td><span style="color: #71A5CC;font-weight:bold;">--</span></td>
		                              		                           </tr>
		                           		                           
		                           		                        </tbody></table>
	                    	</div>
							
							<div class="mt20">
								 <div class="title"><span>温馨提示</span></div>
								 <div class="w640 instruct">
								 		<ul>
					                        <li><font>1）额度信息：您名下所有的信用卡（各币种主卡、附属卡）共享您的信用额度、现金提取额度；美元额度为人民币额度以我行系统汇率折算的参考值。</font></li>
					                        <li><font>2）账单信息：“当前欠款”表示自最近一期账单日至今发生的欠款金额合计。</font></li>
					                        <li><font>3）我的信用卡：您名下各币种信用卡主卡、附属卡均列示在此，包括待激活卡片。</font></li>
				                        </ul>
				                        
				                 </div>
		             		</div>

				</div>
				<div id="advert">
					 




<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>汇丰中国信用卡个人网上银行</title>




   <div class="advert">
   	  	<!-- <img width="100%" src="/perbank/images/0321/bannerHead.jpg"> -->
   </div>
   



			   </div>
			</div>

			
			<div id="content_right">
				


<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- <link href="/perbank/css/0321/perbank.css" rel="stylesheet" type="text/css">
 -->
 <title>汇丰中国信用卡个人网上银行</title>

<script type="text/javascript">

function show_cont(id){
	document.getElementById( id + "_cont" ).style.display = 'block';
}
function close_cont(id){
	document.getElementById( id ).style.display = 'none';	
}

</script>




	<div class="right_mess">
	<form id="messForm" name="messForm" action="/perbank/home" method="post">
	</form>
      <div class="personal">
         <div>
            <font class="pl10 font-w9">个人信息</font>
         </div>
      </div>
      <div class="per-mes">
         <font color="#000">您好！朱文件 先生 ，</font><br>
         <font color="#000">欢迎使用汇丰银行信用卡网银。</font><br><br>
         <font>您上次登录时间：</font><br>
         <font class="font-w9">2018-08-21 20:37:28</font>
      </div>
      <div class="notice">
         <div class="mt30">
            <font class="pl10 font-w9">公告信息</font>
         </div>
      </div>
      <div style="height:auto;">
          <ul class="mt30">
             <li><a href="#" id="six" onclick="show_cont(this.id)">完善的信用卡服务现已登陆汇丰中国手机银行</a></li>
             <li><a href="#" id="one" onclick="show_cont(this.id)">银行信息系统升级</a></li>
        	 <li><a href="#" id="two" onclick="show_cont(this.id)">贵宾验车服务取消通知</a></li>
        	 <li><a href="#" id="three" onclick="show_cont(this.id)">支付清算系统通知</a></li>
        	 <li><a href="#" id="four" onclick="show_cont(this.id)">支付清算系统暂停服务...</a></li>
        	 <li><a href="#" id="five" onclick="show_cont(this.id)">关于变更公司客户人民...</a></li>
          </ul>
      </div>
      <div class="safety">
         <div class="mt30">
            <font class="pl10 font-w9">安全提示</font>
         </div>
      </div>
      <div style="height:auto;">
          <ul class="mt30">
             <li>请不要给陌生人随意转账。</li>
             <li>谨防电话诈骗，不要在电话里按照他人提示进行转账操作。</li>
             <li>严格保管银行卡号，身份证证件和电子银行密码</li>
          </ul>
      </div>
	</div>
	
<!-- 公告信息 -->
<div id="six_cont" style="display: none;">
	<div class="mask"></div>
	<div class="box_popup">
    	<div class="top-color">
    		<div style="position: inherit;margin-left: 96%;margin-top: 1%;">
        		<img src="/perbank/images/0321/xx.png" alt="关闭" onclick="close_cont('six_cont')">
        	</div>
        </div>
        <div class="frame">
        	


<meta charset="UTF-8">
<!-- <link href="/perbank/css/0321/perbank.css" rel="stylesheet" type="text/css">
 -->
 <title></title>




	
        
        	<div>
            	<p class="title"><span>完善的信用卡服务现已登陆汇丰中国手机银行</span></p>
                <span class="time">发布日期：2017-11-13</span>
            </div>
            <div class="dash"></div>
            <div class="content">
            	<p>尊敬的客户：</p>
                <p class="text">感谢您支持汇丰中国信用卡个人网上银行和汇丰信用卡APP！我们很高兴地通知您，从2017年11月13日起，完善的信用卡服务和功能将登陆汇丰中国手机银行APP。全新的页面设计，优化的用户体验，快捷的注册流程以及一站式完善的信用卡功能，都为信用卡用户度身定制。赶紧去下载汇丰中国手机银行，开启精彩掌上用卡生活！</p>
              <p class="text">扫描下方二维码，立即下载！</p>
              <div style="position: inherit;margin-left: 4%;margin-top: 3%;">
        		<img src="/perbank/images/0321/app.png">
        	  </div>
                <p class="sign">汇丰中国</p>
                <p class="sign">2017年11月13日</p>
            </div>
        
    


        </div>
    </div>
	
</div>
<div id="one_cont" style="display: none;">
	<div class="mask"></div>
	<div class="box_popup">
    	<div class="top-color">
    		<div style="position: inherit;margin-left: 96%;margin-top: 1%;">
        		<img src="/perbank/images/0321/xx.png" alt="关闭" onclick="close_cont('one_cont')">
        	</div>
        </div>
        <div class="frame">
        	


<meta charset="UTF-8">
<!-- <link href="/perbank/css/0321/perbank.css" rel="stylesheet" type="text/css">
 -->
 <title></title>




	
        
        	<div>
            	<p class="title"><span>关于西安城市处理中心处理的通知</span></p>
                <span class="time">发布日期：2015-05-05</span>
            </div>
            <div class="dash"></div>
            <div class="content">
            	<p>尊敬的客户：</p>
                <p class="text">根据中国人民银行要求，支付系统西安城市处理中心（陕西省）将于2015年05月05日15:00至2015年05月06日15:00暂停运行小额支付系统、网上支付跨行清算系统和全国影像支付系统业务。</p>
                <p class="sign">汇丰中国</p>
                <p class="sign">2015年4月25日</p>
            </div>
        
    


        </div>
    </div>
	
</div>
<div id="two_cont" style="display: none;">
	<div class="mask"></div>
	
	<div class="box_popup">
    	<div class="top-color">
    		<div style="position: inherit;margin-left: 96%;margin-top: 1%;">
        		<img src="/perbank/images/0321/xx.png" alt="关闭" onclick="close_cont('two_cont')">
        	</div>
        </div>
        <div class="frame">
        	


<meta charset="UTF-8">
<!-- <link href="/perbank/css/0321/perbank.css" rel="stylesheet" type="text/css">
 -->
<title></title>




	
        
        	<div>
            	<p class="title"><span></span></p>
                <span class="time"></span>
            </div>
            <div class="dash"></div>
            <div class="content">
            	<p></p>
                <p class="text"></p>
                <p class="sign"></p>
                <p class="sign"></p>
            </div>
        
    


        </div>
    </div>
	
</div>
<div id="three_cont" style="display: none;">
	<div class="mask"></div>

	<div class="box_popup">
    	<div class="top-color">
        	<div style="position: inherit;margin-left: 96%;margin-top: 1%;">
        		<img src="/perbank/images/0321/xx.png" alt="关闭" onclick="close_cont('three_cont')">
        	</div>
        </div>
        <div class="frame">
        	


<meta charset="UTF-8">
<!-- <link href="/perbank/css/0321/perbank.css" rel="stylesheet" type="text/css">
 -->
 <title></title>




	
        
        	<div>
            	<p class="title"><span></span></p>
                <span class="time"></span>
            </div>
            <div class="dash"></div>
            <div class="content">
            	<p></p>
                <p class="text"></p>
                <p class="sign"></p>
                <p class="sign"></p>
            </div>
        
    


        </div>
    </div>

</div>
<div id="four_cont" style="display: none;">
	<div class="mask"></div>

		
	<div class="box_popup">
    	<div class="top-color">
        	<div style="position: inherit;margin-left: 96%;margin-top: 1%;">	
        		<img src="/perbank/images/0321/xx.png" alt="关闭" onclick="close_cont('four_cont')">
       		</div>	
        </div>
        <div class="frame">
        	


<meta charset="UTF-8">
<!-- <link href="/perbank/css/0321/perbank.css" rel="stylesheet" type="text/css">
 --><title></title>




	
        
        	<div>
            	<p class="title"><span></span></p>
                <span class="time"></span>
            </div>
            <div class="dash"></div>
            <div class="content">
            	<p></p>
                <p class="text"></p>
                <p class="sign"></p>
                <p class="sign"></p>
            </div>
        
    


        </div>
    </div>
		
</div>
<div id="five_cont" style="display: none;">
	<div class="mask"></div>

	<div class="box_popup">
    	<div class="top-color">
    		<div style="position: inherit;margin-left: 96%;margin-top: 1%;">
        		<img src="/perbank/images/0321/xx.png" onclick="close_cont('five_cont')">
        	</div>
        </div>
        <div class="frame">
        	


<meta charset="UTF-8">
<!-- <link href="/perbank/css/0321/perbank.css" rel="stylesheet" type="text/css">
 --><title></title>




	
        
        	<div>
            	<p class="title"><span></span></p>
                <span class="time"></span>
            </div>
            <div class="dash"></div>
            <div class="content">
            	<p></p>
                <p class="text"></p>
                <p class="sign"></p>
                <p class="sign"></p>
            </div>
        
    


        </div>
    </div>
		
</div>
	


			</div>
	    </div><!--content 结束-->
	</div>
	<div id="footer">
		 



<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>汇丰中国信用卡个人网上银行</title>



	<!-- <div style="height:30px;"></div> -->
<!-- 	<div class="footbg"> -->
	    <div class="foot">
	    	<div class="foot_top">
				<div class="link">
		  			<!-- 自助服务 -->
					<div class="adv">
							<div style="float:left;"><span><img style="width:26px;height:26px;" src="/perbank/images/0321/phone.png"></span></div>	
							<div class="link_word" style="margin-left:20px;">							
								<div style="font-size:18px;font-weight:900;text-align:left;line-height:20px;">信用卡客户服务热线</div>
								<div style="margin-top:10px;text-align:left;line-height:25px;">400-86-95366/95366（境内）&nbsp;</div>
								<div style="margin-top:0px;text-align:left;line-height:25px;">或0086-21-20534333（境外）&nbsp;</div>
							</div>			
					</div>
		  			<!-- 寻找分行 -->
					<div class="adv">
							<div style="float:left;"><span><img style="width:26px;height:26px;" src="/perbank/images/0321/find.png"></span></div>	
							<div class="link_word" style="margin-left:20px;">
								<div style="font-size:18px;font-weight:900;text-align:left;line-height:20px;">寻找汇丰分行</div>
								<div style="margin-top:10px;text-align:left;line-height:25px;"><a href="http://creditcards.hsbc.com.cn/portal/branchDetail" target="_blank">收到卡片后亲临分行激活&nbsp;&gt;</a></div>
							</div>			
					</div>
		  			<!-- 常见问题 -->
					<div class="adv">
							<div style="float:left;"><span><img style="width:26px;height:26px;" src="/perbank/images/0321/question.png"></span></div>	
							<div class="link_word" style="margin-left:20px;">
								<div style="font-size:18px;font-weight:900;text-align:left;line-height:20px;">常见问题</div>
								<div style="margin-top:10px;text-align:left;line-height:25px;"><a href="http://creditcards.hsbc.com.cn/portal/faq" target="_blank">查看产品及服务的常见问题&nbsp;&gt;</a></div>
							</div>			
					</div>
		  			<!-- 关于汇丰 -->
					<div class="adv" style="border-right:0px solid #8e8e8e;width:305px;">
							<div style="float:left;"><span><img style="width:26px;height:26px;" src="/perbank/images/0321/link.png"></span></div>	
							<div class="link_word" style="width:250px;margin-left:20px;">
								<div style="font-size:18px;font-weight:900;text-align:left;line-height:20px;">关于汇丰</div>
								<div style="margin-top:10px;text-align:left;line-height:25px;"><a href="http://www.about.hsbc.com.cn/zh-cn" target="_blank">查看更多公司信息&nbsp;&gt;</a></div>
							</div>			
					</div>
				</div>    
    		</div>
    		<div class="foot_bottom">
	    		<div class="link">
	    			<div style="width:100%;float:right;">
	    				<span><a href="https://www.hsbc.com.cn/1/2/misc-cn/privacy-and-security" target="_blank">保密及安全</a>&nbsp;&nbsp;</span>
	    				<span><a href="http://www.hsbc.com.cn/1/2//misc-cn/terms-of-use" target="_blank">网站使用条款</a>&nbsp;&nbsp;</span>
	    				<span><a href="http://www.hsbc.com.cn/1/2//misc-cn/hyperlink-policy" target="_blank">超链接政策</a>&nbsp;&nbsp;</span>
	    				<span><a href="https://www.hsbc.com.cn/1/2/online-security-cn/security" target="_blank">网上保安</a>&nbsp;&nbsp;</span>
	    				<span style="margin-left:50px;font-size:13px;float:right;">© 版权所有。汇丰银行（中国）有限公司2016。  不得转载。 </span>	  				</div>
	  				
				</div>
			</div>
		</div>
<!-- 	</div> -->
	


	</div>
</div><script type="text/javascript" id="">var _smq = _smq || []; _smq.push(['_setAccount', '174e95a', new Date()]); _smq.push(['pageview']); (function() { var sm = document.createElement('script'); sm.type = 'text/javascript'; sm.async = true; sm.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'site.cdnmaster.cn/sitemaster/collect.js'; var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(sm, s); })(); </script>
<!-- <noscript>
<img name="dcsimg" width="1" height="1" alt=" " src="http://www1.member-hsbc-group.com/dcs222x2rreqzoxcb3d7au8vj_9d5y/njs.gif?dcsuri=/nojavascript&amp;WT.js=No&amp;WT.tv=10.4.7 &amp;dcssip=="<creditcards.hsbc.com.cn>" />
</noscript>
<script language="javascript" type="text/javascript" src='/perbank/js/webtrends/bottom_section.js'></script>
<script language="javascript">
(function(){
    var s=document.createElement("script"); s.async=true; s.src="/perbank/js/webtrends/webtrends.js"; // ACTION REQUIRED: Please ensure correct path to webtrends.js (Delete comment once complete)  
    var s2=document.getElementsByTagName("script")[0]; s2.parentNode.insertBefore(s,s2);
}());
</script> -->

<iframe sandbox="allow-scripts allow-same-origin" title="Adobe ID Syncing iFrame" id="destination_publishing_iframe_hsbcbankglobal_undefined" src="https://hsbcbankglobal.demdex.net/dest5.html?d_nsid=undefined#https%3A%2F%2Fcreditcards.hsbc.com.cn%2Fperbank%2Fbk0321%2Facctmng%2Facctqry" class="aamIframeLoaded" style="display: none; width: 0px; height: 0px;"></iframe><script type="text/javascript" id="HSBCCNScriptElement" src="https://www.isstprod.hsbc.com.cn:443/7266/241950781/XBW09WEA78JG/jsEvent.js?z=null_3_524fdfb637b54aa88437aea6f71d59c8&amp;y=1819!0536240!a=Kne162aE3!+k+96=p=ortwbv=+b501+b9422w5657515x=853485375+54=1by4+b341559854z=6ca2+557850256075+53=1554853456a2215D=8tzfd2575+54=5b88aa463fb547d57187a436fea+9c1:a=tphts"></script></body>
</html>