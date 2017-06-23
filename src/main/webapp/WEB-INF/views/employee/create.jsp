<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>xx</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/default/vendors/bootstrap/dist/css/bootstrap.min.css" />
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/assets/default/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath}/assets/default/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="${pageContext.request.contextPath}/assets/default/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
	
    <!-- bootstrap-progressbar -->
    <link href="${pageContext.request.contextPath}/assets/default/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="${pageContext.request.contextPath}/assets/default/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="${pageContext.request.contextPath}/assets/default/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    
    
    <!-- Datatables -->
    <link href="${pageContext.request.contextPath}/assets/default/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/default/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/default/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/default/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/default/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
    
    <!-- Bootstrap Colorpicker -->
    <link href="${pageContext.request.contextPath}/assets/default/vendors/mjolnic-bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/default/vendors/cropper/dist/cropper.min.css" rel="stylesheet">
        <!-- Switchery -->
    <link href="${pageContext.request.contextPath}/assets/default/vendors/switchery/dist/switchery.min.css" rel="stylesheet">
	<!-- Ion.RangeSlider -->
    <link href="${pageContext.request.contextPath}/assets/default/vendors/normalize-css/normalize.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/default/vendors/ion.rangeSlider/css/ion.rangeSlider.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/default/vendors/ion.rangeSlider/css/ion.rangeSlider.skinFlat.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath}/assets/default/build/css/custom.min.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="${pageContext.request.contextPath}/assets/default/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>Gentelella Alela!</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="${pageContext.request.contextPath}/assets/default/production/images/img.jpg" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Welcome,</span>
                <h2>wj zhu</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />
            
            
            
            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>sweet project</h3>
                <ul class="nav side-menu" id = "sweet_menu">
                </ul>
              </div>
              
            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.html">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="${pageContext.request.contextPath}/assets/default/production/images/img.jpg" alt="">John Doe
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="javascript:;"> Profile</a></li>
                    <li>
                      <a href="javascript:;">
                        <span class="badge bg-red pull-right">50%</span>
                        <span>Settings</span>
                      </a>
                    </li>
                    <li><a href="javascript:;">Help</a></li>
                    <li><a href="login.html"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                  </ul>
                </li>

                <li role="presentation" class="dropdown">
                  <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-envelope-o"></i>
                    <span class="badge bg-green">6</span>
                  </a>
                  <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                    <li>
                      <a>
                        <span class="image"><img src="${pageContext.request.contextPath}/assets/default/production/images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="${pageContext.request.contextPath}/assets/default/production/images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="${pageContext.request.contextPath}/assets/default/production/images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="${pageContext.request.contextPath}/assets/default/production/images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <div class="text-center">
                        <a>
                          <strong>See All Alerts</strong>
                          <i class="fa fa-angle-right"></i>
                        </a>
                      </div>
                    </li>
                  </ul>
                </li>
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
			<div class="right_col" role="main">
				<!-- top tiles -->
				<div class="row tile_count">
					<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
						<span class="count_top"><i class="fa fa-user"></i> Total
							Users</span>
						<div class="count">2500</div>
						<span class="count_bottom"><i class="green">4% </i> From
							last Week</span>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
						<span class="count_top"><i class="fa fa-clock-o"></i>
							Average Time</span>
						<div class="count">123.50</div>
						<span class="count_bottom"><i class="green"><i
								class="fa fa-sort-asc"></i>3% </i> From last Week</span>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
						<span class="count_top"><i class="fa fa-user"></i> Total
							Males</span>
						<div class="count green">2,500</div>
						<span class="count_bottom"><i class="green"><i
								class="fa fa-sort-asc"></i>34% </i> From last Week</span>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
						<span class="count_top"><i class="fa fa-user"></i> Total
							Females</span>
						<div class="count">4,567</div>
						<span class="count_bottom"><i class="red"><i
								class="fa fa-sort-desc"></i>12% </i> From last Week</span>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
						<span class="count_top"><i class="fa fa-user"></i> Total
							Collections</span>
						<div class="count">2,315</div>
						<span class="count_bottom"><i class="green"><i
								class="fa fa-sort-asc"></i>34% </i> From last Week</span>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
						<span class="count_top"><i class="fa fa-user"></i> Total
							Connections</span>
						<div class="count">7,325</div>
						<span class="count_bottom"><i class="green"><i
								class="fa fa-sort-asc"></i>34% </i> From last Week</span>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>
									Form Design <small>different form elements</small>
								</h2>
								<ul class="nav navbar-right panel_toolbox">
									<li><a class="collapse-link"><i
											class="fa fa-chevron-up"></i></a></li>
									<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-expanded="false"><i
											class="fa fa-wrench"></i></a>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#">Settings 1</a></li>
											<li><a href="#">Settings 2</a></li>
										</ul></li>
									<li><a class="close-link"><i class="fa fa-close"></i></a>
									</li>
								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<br />
								<form id="demo-form" data-parsley-validate
									class="form-horizontal form-label-left">
									<p>
										For alternative validation library
										<code>parsleyJS</code>
										check out in the <a href="form.html">form page</a>
									</p>
									<span class="section">Personal Info</span>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="first_name">名字<span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input type="text" id="first_name"
												class="form-control  has-feedback-left col-md-7 col-xs-12"
												data-parsley-trigger="change" required
												data-parsley-required-message="请填写名字"
												pattern="/^[\u4e00-\u9fa5]{1,20}$/"
												data-parsley-pattern-message="请填写1-20汉字" />
											<span class="fa fa-user form-control-feedback left"
												aria-hidden="true"></span>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="email">姓氏<span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input type="text" class="form-control has-feedback-left"
												id="last_name"
												name="last_name" data-parsley-trigger="change" required
												data-parsley-required-message="请填写姓氏"
												pattern="/^[\u4e00-\u9fa5]{1,20}$/"
												data-parsley-pattern-message="请填写1-20汉字">
											<span class="fa fa-user form-control-feedback left"
												aria-hidden="true"></span>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="email">邮箱<span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input type="email" class="form-control has-feedback-left"
												id="email"
												name="email" placeholder="请填写邮箱(ps:30个字符之内)"
												data-parsley-trigger="change" required
												data-parsley-required-message="请填写邮箱"
												data-parsley-email-message="请填写邮箱">
											<span class="fa fa-user form-control-feedback left"
												aria-hidden="true"></span>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="position">职务<span class="required">*</span>
										</label>
										<div class="col-md-3 col-sm-6 col-xs-6">
											<select id="position" class="form-control" required
												data-parsley-required-message="请选择职务">
												<option value="">Choose option</option>
												<option value="employee">employee</option>
												<option value="leader">leader</option>
												<option value="boss">boss</option>
											</select>
										</div>
									</div>


									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="email">办公地址<span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input type="text" class="form-control has-feedback-left"
												id="office"
												name="email" data-parsley-trigger="change" required
												placeholder="请填写办公地址(ps:30个字符之内)"
												data-parsley-required-message="请填写办公地址" maxlength="30"
												data-parsley-maxlength-message="请填写30以内字符">
											<span class="fa fa-user form-control-feedback left"
												aria-hidden="true"></span>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="email">年龄<span class="required">*</span>
										</label>
										<div class="col-md-2 col-sm-6 col-xs-12">
											<input type="text" class="form-control has-feedback-left"
												id="age"
												name="email" data-parsley-trigger="change" required
												data-parsley-required-message="请填写年龄"
												data-parsley-type="integer"
												data-parsley-type-message="请输入整数"
												data-parsley-range="[18,300]"
												data-parsley-range-message="18-300岁可入职" placeholder="请填写年龄">
											<span class="fa fa-user form-control-feedback left"
												aria-hidden="true"></span>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="email">入职时间<span class="required">*</span>
										</label>
										<div class="col-md-3 col-sm-6 col-xs-12">
											<input type="text" class="form-control has-feedback-left"
												id="start_date"
												id="single_cal4" placeholder="First Name"
												aria-describedby="inputSuccess2Status4"> <span
												class="fa fa-calendar-o form-control-feedback left"
												aria-hidden="true"></span> <span id="inputSuccess2Status4"
												class="sr-only">(success)</span>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="email">薪水<span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input type="number" class="form-control has-feedback-left"
												id="salary"
												name="email" data-parsley-trigger="change" required=""
												data-parsley-type="number">
											<span class="fa fa-user form-control-feedback left"
												aria-hidden="true"></span>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-md-3 col-sm-3 col-xs-12"
											for="email">分机号码<span class="required">*</span>
										</label>
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input type="text" class="form-control has-feedback-left"
												id="extn"
												name="email" data-parsley-trigger="change" required="">
											<span class="fa fa-user form-control-feedback left"
												aria-hidden="true"></span>
										</div>
									</div>

									<div class="ln_solid"></div>
									<div class="x_content">
										<div class="form-group">
											<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
												<div class="btn-group">
													<button  id ="back"  data-toggle="dropdown" class="btn btn-primary"
														type="button" aria-expanded="false">返回上一页</button>
												</div>
												<div class="btn-group">
													<button data-toggle="dropdown" class="btn btn-warning"
														type="button" aria-expanded="false">重置表单</button>
												</div>
												<!-- Split button -->
												<div class="btn-group">
													<button id ="save" type="button" class="btn btn-success">保存</button>
													<button type="button"
														class="btn btn-success dropdown-toggle"
														data-toggle="dropdown" aria-expanded="false">
														<span class="caret"></span> <span class="sr-only">Toggle Dropdown</span>
													</button>
													<ul class="dropdown-menu" role="menu">
														<li><a href="#">暂存</a></li>
														<li><a href="#">校验表单</a></li>
														<li><a href="#">强制保存</a></li>
														<li class="divider"></li>
														<li><a href="#">联系客服</a></li>
													</ul>
												</div>
												<div class="btn-group">
													<button data-toggle="dropdown"
														class="btn btn-info dropdown-toggle " type="button"
														aria-expanded="false">
														更多操作 <span class="caret"></span>
													</button>
													<ul role="menu" class="dropdown-menu">
														<li><a href="#">Action</a></li>
														<li><a href="#">Another action</a></li>
														<li><a href="#">Something else here</a></li>
														<li class="divider"></li>
														<li><a href="#">Separated link</a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<br />
			</div>

			<!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
           contact <a href="http://www.whatgoogle.com">whatgoogle</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/assets/default/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/assets/default/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="${pageContext.request.contextPath}/assets/default/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="${pageContext.request.contextPath}/assets/default/vendors/nprogress/nprogress.js"></script>
	<!-- validator -->
<%--     <script src="${pageContext.request.contextPath}/assets/default/vendors/validator/validator.js"></script>   --%>
	<script src="${pageContext.request.contextPath}/assets/default/vendors/parsleyjs/dist/parsley.min.js"></script>
	
	<!-- DateJS -->
    <script src="${pageContext.request.contextPath}/assets/default/vendors/DateJS/build/date.js"></script>
	<!-- bootstrap-daterangepicker -->
    <script src="${pageContext.request.contextPath}/assets/default/vendors/moment/min/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/default/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    
     
    <script src="${pageContext.request.contextPath}/assets/xx/xx.js"></script>
	<script>
	var id = '<%=id %>';
		$(function(){
			var params = {};
				$.xx.ajax({
			      contenttype : 'application/json; charset=utf-8',
			      async: false,
				  url: '<%=path%>/user/menu.do',
					type : "post",
					dataType : "json",
					params : params,
					success : function(data) {
						$.xx.c(data.list);
						$.xx.left(data.list);
					}
			});
		});

		//tags input
		function init_TagsInput11() {
			if (typeof $.fn.tagsInput !== 'undefined') {
				$('#tags_1').tagsInput({
					width : 'auto'
				});
			}
		};

		$(document).ready(function() {
			init_TagsInput11();
			$("#save").click(function(){
				var params = {};
				params['first_name']=$("#first_name").val();
				if(id != 'null'){
					params['id']=id;
				}
				$.xx.ajax({
			      contenttype : 'application/json; charset=utf-8',
			      async: false,
				    url: id != 'null' ? '<%=path%>/employee/update.ht' : '<%=path%>/employee/create.htm',
					type : "post",
					dataType : "json",
					params : params,
					success : function(data) {
						$.xx.location(BASE+"/employee/index.html");
					}
			});
			});
			$("#back").click(function(){
				$.xx.location(BASE+"/employee/index.html");
			});
			
			if(id != 'null'){
				var params = {};
				params['id']=id;
				$.xx.ajax({
			      contenttype : 'application/json; charset=utf-8',
			      async: false,
				  url: '<%=path%>/employee/update.htm',
					type : "post",
					dataType : "json",
					params : params,
					success : function(data) {
// 						$.xx.location(BASE+"/employee/index.html");
						$("#first_name").val(data.data.first_name);
						$("#last_name").val(data.data.last_name);
						$("#email").val(data.data.email);
						$("#position").val(data.data.position);
						$("#office").val(data.data.office);
						$("#age").val(data.data.age);
						$("#start_date").val(data.data.start_date);
						$("#salary").val(data.data.salary);
						$("#extn").val(data.data.extn);
					}
			});
			}
		});
		$('#single_cal4').daterangepicker(
				{
					locale : {
						applyLabel : '确定',
						cancelLabel : '取消',
						fromLabel : '起始时间',
						toLabel : '结束时间',
						customRangeLabel : '自定义',
						daysOfWeek : [ '日', '一', '二', '三', '四', '五', '六' ],
						monthNames : [ '一月', '二月', '三月', '四月', '五月', '六月',
								'七月', '八月', '九月', '十月', '十一月', '十二月' ],
						firstDay : 1
					},
					singleDatePicker : true,
					singleClasses : "picker_4",
					format : 'YYYY-MM-DD'
				}, function(start, end, label) {
					console.log(start.toISOString(), end.toISOString(), label);
				});

		$(function() {
			$('#demo-form').parsley().on('field:validated', function() {
				var ok = $('.parsley-error').length === 0;
				$('.bs-callout-info').toggleClass('hidden', !ok);
				$('.bs-callout-warning').toggleClass('hidden', ok);
			}).on('form:submit', function() {
				return false; // Don't submit form for this demo
			});
		});
	</script>
      <!-- Custom Theme Scripts -->
<%--     <script src="${pageContext.request.contextPath}/assets/default/build/js/custom.min.js"></script> --%>
    
    <script>
    
    </script>
  </body>
</html>
