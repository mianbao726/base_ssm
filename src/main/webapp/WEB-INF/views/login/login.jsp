<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="../include/header.jsp" flush="true" />
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>jqGrid - Ace Admin</title>

</head>
<body class="login-layout">

	<div class="main-container">
		<div class="main-content">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1">
					<div class="login-container">
						<div class="center">
							<h1>
								<i class="ace-icon fa fa-leaf green"></i> <span class="red">SUNNY</span> <span class="white"
									id="id-text2">Application</span>
							</h1>
							<h4 class="blue" id="id-company-text">&copy; zhuwj726@gmail.com&nbsp;&nbsp;:&nbsp;)</h4>
						</div>

						<div class="space-6"></div>

						<div class="position-relative">
							<div id="login-box" class="login-box visible widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header blue lighter bigger">
											<i class="ace-icon fa fa-coffee green"></i> 欢迎登陆
										</h4>

										<div class="space-6"></div>
										

										<form id = "login_form" method="post" class="form-horizontal"
											data-bv-message="This value is not valid"
											data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
											data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
											data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">
											<fieldset>
											
												<label class="block clearfix  col-sm-13 form-group"> <span class="block input-icon input-icon-right">
														<input type="text" class="form-control" placeholder="用户名" 
														data-bv-notempty="true"
														name = "username"
														data-bv-notempty-message="用户名不能为空" /> <i
														class="ace-icon fa fa-user"></i>
												</span>
												</label> 
												<label class="block clearfix col-sm-13 form-group"> <span class="block input-icon input-icon-right">
														<input type="password" class="form-control"
														data-bv-notempty="true"
														name = "password"
														data-bv-notempty-message="密码不能为空" 
														 placeholder="密 码" /> <i
														class="ace-icon fa fa-lock"></i>
												</span>
												</label>
												
												<label class="block clearfix col-sm-13 form-group"> <span class="block input-icon input-icon-right">
														<select id = "login_as" name = "login_as">
														</select>
												<span class="help-button" data-rel="popover" data-trigger="hover" data-placement="right" data-content="帮助信息 ！！！ ！！！.">?</span>		
												</span>
												
												</label>
												
												
												
												
												<label id ="login_info" style="color: red"></label>
												<div class="space"></div>

												<div class="clearfix">
													<!-- <label class="inline" > <input type="checkbox" class="ace" /> <span class="lbl">
															十天内免登录&nbsp;&nbsp;</span>
													</label> -->

													<button type="button" id = "login_btn" class="width-30 pull-right btn btn-sm btn-primary">
														<i class="ace-icon fa fa-key"></i> <span class="bigger-110">登&nbsp;&nbsp;陆</span>
													</button>
												</div>

												<div class="space-4"></div>
											</fieldset>
										</form>

										<div class="social-or-login center">
											<span class="bigger-110">或者使用以下方式登陆</span>
										</div>

										<div class="space-6"></div>

										<div class="social-login center">
											<a class="btn btn-primary"> <i class="ace-icon fa fa-facebook other-icon"></i>
											</a> <a class="btn btn-info"> <i class="ace-icon fa fa-twitter other-icon"></i>
											</a> <a class="btn btn-danger"> <i class="ace-icon fa fa-google-plus other-icon"></i>
											</a>
										</div>
									</div>
									<!-- /.widget-main -->

									<div class="toolbar clearfix">
										<div style="display: none">
											<a href="#" data-target="#forgot-box" id = "go_reset_pwd" class="forgot-password-link"> <i
												class="ace-icon fa fa-arrow-left"></i> 忘记密码?
											</a>
										</div>

										<div>
											<a href="#" id = "new_account" data-target="#signup-box" class="user-signup-link"> 注册新账号 <i
												class="ace-icon fa fa-arrow-right"></i>
											</a>
										</div>
									</div>
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.login-box -->

							<div id="forgot-box" class="forgot-box widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header red lighter bigger">
											<i class="ace-icon fa fa-key"></i> 重置密码
										</h4>

										<div class="space-6"></div>
										<p>请输入注册时的邮箱</p>

										<form id = "reset_pwd">
											<fieldset>
												<label class="block clearfix"> <span class="block input-icon input-icon-right">
														<input type="email" class="form-control" placeholder="邮箱地址" /> <i
														class="ace-icon fa fa-envelope"></i>
												</span>
												</label>

												<div class="clearfix">
													<button type="button" class="width-30 pull-right btn btn-sm btn-danger">
														<i class="ace-icon fa fa-lightbulb-o"></i> <span class="bigger-110">发&nbsp;&nbsp;送!</span>
													</button>
												</div>
											</fieldset>
										</form>
									</div>
									<!-- /.widget-main -->

									<div class="toolbar center">
										<a href="#" data-target="#login-box" id= "go_login" class="back-to-login-link"> 立即登陆 <i
											class="ace-icon fa fa-arrow-right"></i>
										</a>
									</div>
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.forgot-box -->

							<div id="signup-box" class="signup-box widget-box no-border">
								<div class="widget-body">
									<div class="widget-main">
										<h4 class="header green lighter bigger">
											<i class="ace-icon fa fa-users blue"></i> 新用户注册
										</h4>

										<div class="space-6"></div>
										<p>请填写以下信息:</p>

										<form id="register_form" method="post" class="form-horizontal"
											data-bv-message="This value is not valid"
											data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
											data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
											data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">
											<fieldset>
												<label class="block clearfix col-sm-13 form-group"> <span
													class="block input-icon input-icon-right"> <input type="text"
														class="form-control" name="email" placeholder="邮箱地址"
														data-bv-notempty="true"
														data-bv-notempty-message="请填写邮箱地址" 
														data-bv-emailaddress="true"
														data-bv-emailaddress-message="请输入正确邮箱" /> <i class="ace-icon fa fa-envelope"></i>
												</span>
												</label> <label class="block clearfix col-sm-13 form-group"> <span
													class="block input-icon input-icon-right"> <input type="text"
														class="form-control" placeholder="用户名" name="username"
														data-bv-notempty="true"
														data-bv-notempty-message="用户名不能为空" 
														
														pattern="^[\w_]{5,20}$"
                										data-bv-regexp-message="只能输入5-20位字母数字下划线"
														/>
														<i class="ace-icon fa fa-user"></i>
												</span>
												</label> <label class="block clearfix col-sm-13 form-group"> <span
													class="block input-icon input-icon-right"> <input type="password"
														class="form-control" placeholder="密码" name="password" 
														
														data-bv-notempty="true"
														data-bv-notempty-message="请填写密码" 
														
														data-bv-different="true"
														data-bv-different-field="username" 
														data-bv-different-message="密码不能和账号一致"
														
														pattern="^[\w_]{6,30}$"
                										data-bv-regexp-message="只能输入6-30位字母数字下划线"
														 /> <i class="ace-icon fa fa-lock"></i>
												</span>
												</label> <label class="block clearfix col-sm-13 form-group"> <span
													class="block input-icon input-icon-right"> <input type="password"
														class="form-control" placeholder="确认密码" name="confirmPassword" data-bv-notempty="true"
														data-bv-notempty-message="请填写密码" data-bv-identical="true"
														data-bv-identical-field="password" data-bv-identical-message="两次密码不一致" />
														<i class="ace-icon fa fa-retweet"></i>
												</span>
												</label>

												<div class="form-group">
													<div class="block col-lg-13">
														<div class="checkbox">
															<label> <input type="checkbox" name="languages[]" value="english"
																id = "agree"
																data-bv-message="请接受用户使用协议" data-bv-notempty="true" /> <span
																class="lbl"> 我接受 <a href="javascript:;" id = "bootbox-regular">用户协议</a>
															</span>
															</label>
														</div>
													</div>
												</div>
												<div class="space-24"></div>

												<div class="clearfix">
													<button type="reset" class="width-40 pull-left btn btn-sm" id="register_reset">
														<i class="ace-icon fa fa-refresh"></i> <span class="bigger-110">重新填写</span>
													</button>

													<button type="button" class="width-55 pull-right btn btn-sm btn-success" id="register">
														<span class="bigger-110">注&nbsp;&nbsp;册</span> <i
															class="ace-icon fa fa-arrow-right icon-on-right"></i>
													</button>
												</div>
											</fieldset>
										</form>
									</div>

									<div class="toolbar center">
										<a href="#" data-target="#login-box" id="now_login" class="back-to-login-link"> <i
											class="ace-icon fa fa-arrow-left"></i> 立即登陆
										</a>
									</div>
								</div>
								<!-- /.widget-body -->
							</div>
							<!-- /.signup-box -->
						</div>
						<!-- /.position-relative -->

						<!--
 						<div class="navbar-fixed-top align-right">
							<br /> &nbsp; <a id="btn-login-dark" href="#">Dark</a> &nbsp; <span class="blue">/</span> &nbsp; <a id="btn-login-blur" href="#">Blur</a> &nbsp; <span class="blue">/</span> &nbsp; <a id="btn-login-light" href="#">Light</a> &nbsp; &nbsp; &nbsp;
						</div>
 						-->
					</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/viewjs/login/login.js"></script>
</body>