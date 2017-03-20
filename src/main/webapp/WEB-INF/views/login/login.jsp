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

    <title>Gentelella Alela! | </title>

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
		$.xx.c(params);
		$.xx.ajax({
			  url: "user/login.do",
			  type:"post",
			  dataType:"json",
			  params:params,
			  success:function(data){
// 				  alert(data.status_code);
					window.location.href = "<%=path%>/dashboard.html";
			  }
		});
    }
//     $.xx.ajax({
// 		CONTENTTYPE : 'APPLICATION/JSON; CHARSET=UTF-8',
// 		URL : "ROLE/GETALLROLE.DO",
// 		TYPE : "POST",
// 		DATATYPE : "JSON",
// 		SUCCESS : FUNCTION(DATA) {
// 		}
// 	});
    </script>
  </head>

  <body class="login">
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            <form>
              <h1>Login Form</h1>
              <div>
                <input type="text" class="form-control" placeholder="Username" required="" value = "xx" id = "user_name"/>
              </div>
              <div>
                <input type="password" class="form-control" placeholder="Password" required="" value = "111111" id = "password"/>
              </div>
              <div>
                <a class="btn btn-default " href="javascript:login();" id ="btn_login">Log in</a>
                <a class="reset_pass" href="#">Lost your password?</a>
              </div>

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

        <div id="register" class="animate form registration_form">
          <section class="login_content">
            <form>
              <h1>Create Account</h1>
              <div>
                <input type="text" class="form-control" placeholder="Username" required="" />
              </div>
              <div>
                <input type="email" class="form-control" placeholder="Email" required="" />
              </div>
              <div>
                <input type="password" class="form-control" placeholder="Password" required="" />
              </div>
              <div>
                <a class="btn btn-default submit" href="index.html">Submit</a>
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">Already a member ?
                  <a href="#signin" class="to_register"> Log in </a>
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
      </div>
    </div>
  </body>
</html>