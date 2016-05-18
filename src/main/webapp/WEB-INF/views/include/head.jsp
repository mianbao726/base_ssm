<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% String path = request.getContextPath();%>
<% String title=request.getParameter("title"); %>
<% String link1=request.getParameter("link1"); %>
<% String link2=request.getParameter("link2"); %>
<% String itemId = request.getParameter("itemId"); %>
<% String parentId = request.getParameter("parentId"); %>

<!DOCTYPE html>
<html lang="en">
<head>
<title><%=title%></title>
<jsp:include page="header.jsp" flush="true">
<jsp:param name="title" value="<%=title%>" />
</jsp:include>
</head>
<jsp:include page="loading.jsp" flush="true">
<jsp:param name="title" value="<%=title%>" />
</jsp:include>
<body class="no-skin">
<div id="navbar" class="navbar navbar-default">
			<script type="text/javascript">
				try {
					ace.settings.check('navbar', 'fixed')
				} catch (e) {}
			</script>

			<div class="navbar-container" id="navbar-container">
				<!-- #section:basics/sidebar.mobile.toggle -->
				<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler">
					<span class="sr-only">Toggle sidebar</span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>
				</button>

				<!-- /section:basics/sidebar.mobile.toggle -->
				<div class="navbar-header pull-left">
					<!-- #section:basics/navbar.layout.brand -->
					<a href="#" class="navbar-brand">
						<small>
							<i class="ace-icon fa fa-leaf green"></i> <span class="red">SUNNY</span> <span class="white"
									id="id-text2">Application</span> 
						</small>
					</a>
				</div>

				<!-- #section:basics/navbar.dropdown -->
				<div class="navbar-buttons navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
												<!-- #section:basics/navbar.user_menu -->
						<li class="light-blue">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<span class="user-info">
									<small>欢迎你,</small>
									<span id="loginUser"></span>
								</span>

								<i class="ace-icon fa fa-caret-down"></i>
							</a>

							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
							
								<li>
									<a href="#" onclick="goEditPWD()">
										<i class="ace-icon fa fa-cog"></i> 修改密码
									</a>
								</li>

								<li class="divider"></li>

								<li>
									<a href="#" onclick="logout()">
										<i class="ace-icon fa fa-power-off"></i> 退出登录
									</a>
								</li>
								
								<script type="text/javascript">
								function logout(){
									window.location.href = '<%=path%>/login.html';
								}
								
								function goEditPWD(){
									window.location.href = '<%=path%>/zk/user_pwd.action';
								}
								
								$(function(){
									var params = {};
									$.sunny.ajax({
										  url: '<%=path%>/user/getUserInfo.do',
										  type:"post",
										  dataType:"json",
										  params:params,
										  success:function(data){
											  $("#loginUser").html(data.username);	
										  }
									});
								});
							
                                </script>
							</ul>
						</li>

						<!-- /section:basics/navbar.user_menu -->
					</ul>
				</div>

				<!-- /section:basics/navbar.dropdown -->
			</div>
			<!-- /.navbar-container -->
		</div>
		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try {
					ace.settings.check('main-container', 'fixed')
				} catch (e) {}
			</script>
 <jsp:include page="left.jsp" flush="true">
  <jsp:param name="itemId" value="<%=itemId %>"/>
 <jsp:param name="parentId" value="<%=parentId %>"/>
 </jsp:include>
 </div>
<div class="main-content">
  <jsp:include page="title.jsp" flush="true">
 <jsp:param name="link1" value="<%=link1 %>"/>
 <jsp:param name="link2" value="<%=link2 %>"/>
 </jsp:include>
