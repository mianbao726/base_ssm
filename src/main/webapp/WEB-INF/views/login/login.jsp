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
    <!-- iCheck -->
    <link href="${pageContext.request.contextPath}/assets/default/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="${pageContext.request.contextPath}/assets/default/vendors/animate.css/animate.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath}/assets/default/build/css/custom.min.css" rel="stylesheet">
    
    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/assets/default/vendors/jquery/dist/jquery.min.js"></script>
     <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/assets/default/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="${pageContext.request.contextPath}/assets/default/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="${pageContext.request.contextPath}/assets/default/vendors/nprogress/nprogress.js"></script>
    <!-- iCheck -->
    <script src="${pageContext.request.contextPath}/assets/default/vendors/iCheck/icheck.min.js"></script>
    <!-- Parsley -->
    <script src="${pageContext.request.contextPath}/assets/default/vendors/parsleyjs/dist/parsley.min.js"></script>
        <!-- jsencrypt 加密  -->
     <script src="${pageContext.request.contextPath}/assets/default/vendors/jsencrypt/jsencrypt.min.js"></script>
        <!-- xx.js -->
    <script src="${pageContext.request.contextPath}/assets/xx/xx.js"></script>
    <!-- Custom Theme Scripts -->
<%--     <script src="${pageContext.request.contextPath}/assets/default/build/
s/custom.min.js"></script> --%>
    <!-- validator -->
     <style type="text/css">
        .input-val {
            width: 200px;
            background: #ffffff;
            /* padding: 0 0px; */
            margin-top: 10px;
            border-radius: 5px;
            border: none;
            border: 1px solid rgba(0,0,0,.2);
            font-size: 13px;
        }

        .ipt {
            border: 1px solid #d3d3d3;
            padding: 10px 10px;
            width: 290px;
            border-radius: 4px;
            padding-left: 35px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
        }

            .ipt:focus {
                border-color: #66afe9;
                outline: 0;
                -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
                box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
            }
    </style>
    <script type="text/javascript">
	    var show_num = [];
	    $(function () {
	        draw(show_num);//加载验证码
	
	        //看不清楚重新获取验证码
	        $("#canvas").on('click', function () {
	            draw(show_num);
	        })
	
	        $("#submit").click(function () {
	            check(); //数据提交前先检查验证码是否填写正确
	        })
	    })
	
	    function draw(show_num) {
	        var canvas_width = $('#canvas').width();
	        var canvas_height = $('#canvas').height();
	        var canvas = document.getElementById("canvas");//获取到canvas的对象，演员
	        var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
	        canvas.width = canvas_width;
	        canvas.height = canvas_height;
	        var sCode = "A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
	        var aCode = sCode.split(",");
	        var aLength = aCode.length;//获取到数组的长度
	
	        for (var i = 0; i <= 3; i++) {
	            var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
	            var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度
	            var txt = aCode[j];//得到随机的一个内容
	            show_num[i] = txt.toLowerCase();
	            var x = 10 + i * 20;//文字在canvas上的x坐标
	            var y = 20 + Math.random() * 8;//文字在canvas上的y坐标
	            context.font = "bold 23px 微软雅黑";
	            context.translate(x, y);
	            context.rotate(deg);
	            context.fillStyle = randomColor();
	            context.fillText(txt, 0, 0);
	            context.rotate(-deg);
	            context.translate(-x, -y);
	        }
	        for (var i = 0; i <= 5; i++) { //验证码上显示线条
	            context.strokeStyle = randomColor();
	            context.beginPath();
	            context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
	            context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
	            context.stroke();
	        }
	        for (var i = 0; i <= 30; i++) { //验证码上显示小点
	            context.strokeStyle = randomColor();
	            context.beginPath();
	            var x = Math.random() * canvas_width;
	            var y = Math.random() * canvas_height;
	            context.moveTo(x, y);
	            context.lineTo(x + 1, y + 1);
	            context.stroke();
	        }
	    }
	
	    function randomColor() {//得到随机的颜色值
	        var r = Math.floor(Math.random() * 256);
	        var g = Math.floor(Math.random() * 256);
	        var b = Math.floor(Math.random() * 256);
	        return "rgb(" + r + "," + g + "," + b + ")";
	    }
	
	
	
	    function check() {
	        var val = $(".input-val").val().toLowerCase();
	        var num = show_num.join("");
	        if (val == "") {
	            alert("请输入验证码");
	            return false;
	        } else if (val != num) {
	            alert('验证码错误！请重新输入！');
	            $(".input-val").val('');
	            setTimeout(function () {
	                draw(show_num);
	            }, 1000)

	            return false;
	        }
	        return true;
	    }
	</script>
    <script>
//     $("#registerForm").validate();
    
    function login(){
    	return ;
//     	var check_info = check();
//     	if(!check_info)return;
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

	<body class="login">
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>
      <div class="login_wrapper">
		        <div class="animate form login_form">
		          <section class="login_content">
		            <form id = "registerForm" novalidate>
		              <h1>Login Form</h1>
		              <div class="item form-group">
		<!--                 <input type="text"  placeholder="Username"    value = "xx" id = "user_name" -->
		<!--                 data-validate-length-range="6" data-validate-words="2" -->
		<!--                 class="form-control col-md-7 col-xs-12" -->
		<!--                  /> -->
		<!-- 				<input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="both name(s) e.g Jon Doe" required="required" type="text"> -->
						<input type="text" id="telephone" name="phone" required="required" data-validate-length="6,8"class="form-control col-md-7 col-xs-12">
		              </div>
		              <div>
		                <input type="password" class="form-control" placeholder="Password"  value = "111111" id = "password"/>
		              </div>
		              <div>
				        <input type="text" value="" placeholder="请输入验证码" class="input-val ipt" />
				        <canvas id="canvas" width="100" height="43"></canvas>
		              </div>
		              <div class="code">
				        <span class="v_logo"></span>
				
				    </div>
		                <button class="btn btn-default "  href="#" onclick="login()" id ="btn_login">Log in</button>
		                <a class="reset_pass" href="#">Lost your password?</a>
		              <div class="clearfix"></div>
		              <div class="separator">
		                <p class="change_link">New to site?
		                  <a href="#signup" class="to_register"> Create Account </a>
		                </p>
		
		                <div class="clearfix"></div>
		                <br />
		
		                <div>
		                  <h1><i class="fa fa-paw"></i> Gentelella Alela!</h1>
		                  <p>©2016 All Rights Reserved. Gentelella Alela! is a Bootstrap 3 template. Privacy and Terms</p>
		                </div>
		              </div>
		            </form>
		          </section>
		        </div>

<!--         <div id="register" class="animate form registration_form"> -->
<!--           <section class="login_content"> -->
<!--             <form> -->
<!--               <h1>Create Account</h1> -->
<!--               <div> -->
<!--                 <input type="text" class="form-control" placeholder="Username" required="" /> -->
<!--               </div> -->
<!--               <div> -->
<!--                 <input type="email" class="form-control" placeholder="Email" required="" /> -->
<!--               </div> -->
<!--               <div> -->
<!--                 <input type="password" class="form-control" placeholder="Password" required="" /> -->
<!--               </div> -->
<!--               <div> -->
<!--                 <a class="btn btn-default submit" href="index.html">Submit</a> -->
<!--               </div> -->

<!--               <div class="clearfix"></div> -->

<!--               <div class="separator"> -->
<!--                 <p class="change_link">Already a member ? -->
<!--                   <a href="#signin" class="to_register"> Log in </a> -->
<!--                 </p> -->

<!--                 <div class="clearfix"></div> -->
<!--                 <br /> -->

<!--                 <div> -->
<!--                   <h1><i class="fa fa-paw"></i> Gentelella Alela!</h1> -->
<!--                   <p>©2016 All Rights Reserved. Gentelella Alela! is a Bootstrap 3 template. Privacy and Terms</p> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </form> -->
<!--           </section> -->
<!--         </div> -->
      </div>
    </div>
  </body>
</html>