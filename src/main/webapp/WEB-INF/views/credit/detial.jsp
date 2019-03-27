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
    

    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath}/assets/default/build/css/custom.min.css" rel="stylesheet">
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
              
              <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu" >
                  <li><a><i class="fa fa-home"></i> Home <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="index.html">Dashboard</a></li>
                      <li><a href="index2.html">Dashboard2</a></li>
                      <li><a href="index3.html">Dashboard3</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-edit"></i> Forms <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="form.html">General Form</a></li>
                      <li><a href="form_advanced.html">Advanced Components</a></li>
                      <li><a href="form_validation.html">Form Validation</a></li>
                      <li><a href="form_wizards.html">Form Wizard</a></li>
                      <li><a href="form_upload.html">Form Upload</a></li>
                      <li><a href="form_buttons.html">Form Buttons</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-desktop"></i> UI Elements <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="general_elements.html">General Elements</a></li>
                      <li><a href="media_gallery.html">Media Gallery</a></li>
                      <li><a href="typography.html">Typography</a></li>
                      <li><a href="icons.html">Icons</a></li>
                      <li><a href="glyphicons.html">Glyphicons</a></li>
                      <li><a href="widgets.html">Widgets</a></li>
                      <li><a href="invoice.html">Invoice</a></li>
                      <li><a href="inbox.html">Inbox</a></li>
                      <li><a href="calendar.html">Calendar</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-table"></i> Tables <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="tables.html">Tables</a></li>
                      <li><a href="tables_dynamic.html">Table Dynamic</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-bar-chart-o"></i> Data Presentation <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="chartjs.html">Chart JS</a></li>
                      <li><a href="chartjs2.html">Chart JS2</a></li>
                      <li><a href="morisjs.html">Moris JS</a></li>
                      <li><a href="echarts.html">ECharts</a></li>
                      <li><a href="other_charts.html">Other Charts</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-clone"></i>Layouts <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="fixed_sidebar.html">Fixed Sidebar</a></li>
                      <li><a href="fixed_footer.html">Fixed Footer</a></li>
                    </ul>
                  </li>
                </ul>
              </div>
              <div class="menu_section">
                <h3>Live On</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-bug"></i> Additional Pages <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="e_commerce.html">E-commerce</a></li>
                      <li><a href="projects.html">Projects</a></li>
                      <li><a href="project_detail.html">Project Detail</a></li>
                      <li><a href="contacts.html">Contacts</a></li>
                      <li><a href="profile.html">Profile</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-windows"></i> Extras <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="page_403.html">403 Error</a></li>
                      <li><a href="page_404.html">404 Error</a></li>
                      <li><a href="page_500.html">500 Error</a></li>
                      <li><a href="plain_page.html">Plain Page</a></li>
                      <li><a href="login.html">Login Page</a></li>
                      <li><a href="pricing_tables.html">Pricing Tables</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-sitemap"></i> Multilevel Menu <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                        <li><a href="#level1_1">Level One</a>
                        <li><a>Level One<span class="fa fa-chevron-down"></span></a>
                          <ul class="nav child_menu">
                            <li class="sub_menu"><a href="level2.html">Level Two</a>
                            </li>
                            <li><a href="#level2_1">Level Two</a>
                            </li>
                            <li><a href="#level2_2">Level Two</a>
                            </li>
                          </ul>
                        </li>
                        <li><a href="#level1_2">Level One</a>
                        </li>
                    </ul>
                  </li>                  
                  <li><a href="javascript:void(0)"><i class="fa fa-laptop"></i> Landing Page <span class="label label-success pull-right">Coming Soon</span></a></li>
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
                          name<strong>See All Alerts</strong>
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
              <span class="count_top"><i class="fa fa-user"></i> Total cost</span>
              <div class="count" id ="total_cost">0</div>
              <span class="count_bottom"><i class="green">0% </i> From last Week</span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-clock-o"></i>Total fee cost</span>
              <div class="count red" id = "total_fee_cost">0</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>3% </i> From last Week</span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Total repay</span>
              <div class="count green" id ="total_repay">0</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Week</span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Total Females</span>
              <div class="count">4,567</div>
              <span class="count_bottom"><i class="red"><i class="fa fa-sort-desc"></i>12% </i> From last Week</span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Total Collections</span>
              <div class="count">2,315</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Week</span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Total Connections</span>
              <div class="count">7,325</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Week</span>
            </div>
          </div>
          <!-- /top tiles -->
				
				<div class="row" id="searh_all_block" style="display:none">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>
									高级搜索 <small>Advanced Search</small>
								</h2>
								<ul class="nav navbar-right panel_toolbox">
									<li><a class="collapse-link"><i
											class="fa fa-chevron-up" title="收放"></i></a></li>
									<li><a class="close-link_xx"><i class="fa fa-refresh"></i></a>
									</li>
									<li onclick="javascript:$('#searh_all_block').toggle();"><a class="close-link1"><i class="fa fa-close"></i></a>
                    				</li>
								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
							<div class="col-md-4">
										Date Range Picker
										<form class="form-horizontal">
											<fieldset>
												<div class="control-group">
													<div class="controls">
														<div class="input-prepend input-group">
															<span class="add-on input-group-addon"><i
																class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>
															<input type="text" style="width: 200px"
																name="reservation" id="reservation" class="form-control"
																value="01/01/2016 - 01/25/2016" />
														</div>
													</div>
												</div>
											</fieldset>
										</form>
									</div>
							</div>
						</div>
					</div>
				</div>
				


				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>
									信用卡信息 <small>Credit card information</small>
								</h2>
								<ul class="nav navbar-right panel_toolbox">
									<li><a class="collapse-link"><i
											class="fa fa-chevron-up" title="收放"></i></a></li>
									<li><a class="collapse-link-xx"><i class="fa fa-file"
											title="新增"></i></a></li>
									<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-expanded="false"><i
											class="fa fa-wrench"></i></a>
										<ul class="dropdown-menu" role="menu">
											<li id="search_all"><a href="#">高级搜索</a></li>
											<li><a href="#">近期项目</a></li>
										</ul></li>
									<li><a class="close-link_xx"><i class="fa fa-refresh"></i></a>
									</li>
								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<table id="datatable-xx"
									class="table table-striped dt-responsive nowrap projects"
									cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>卡号</th>
											<th>金额</th>
											<th>消费时间</th>
											<th>备注</th>
											<th></th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
				</div>

				<br />

        </div>
        <!-- /page content -->
<!-- modal start -->
  <!-- 调整账单的modal -->
           <div class="x_content" >

                  <!-- modals -->
                  <!-- Small modal -->
<!--                   <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">Small modal</button> -->

                  <div  id = "modal-modal-record-detial" class="modal fade modal-record-detial" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                      <div class="modal-content">

                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                          </button>
<!--                           <h4 class="modal-title" id="myModalLabel2">bill info</h4> -->
                          <img src='' height='70' width='70' class='profile_img'  id = "bankpic">
                        <label class="" style ="font-size: xx-large;"  id="cardno">
                        </label>
                        </div>
                        <div class="modal-body">
                          <div class="x_content">
                    <br />
                    <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
<!--                       <div class="form-group"> -->
<!--                         <label class="control-label col-md-3 col-sm-3 col-xs-12">消费时间</label> -->
<!--                         <div id="myreportrange" class="col-md-6 col-sm-9 col-xs-12"  style="background: #fff; cursor: pointer; padding: 5px 10px; border: 0px solid #ccc"> -->
<!--                            <input type="text" id="detial_time" required="required" class="form-control col-md-7 col-xs-12"> -->
<!-- 									<i class="glyphicon glyphicon-calendar fa fa-calendar"></i> -->
<!-- 		                          <span id = "detial_time">December 30, 2014 - January 28, 2015</span> <b class="caret"></b> -->
<!--                         </div> -->
<!--                       </div> -->
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">消费时间</label>
                       <div class="col-md-6 col-sm-9 col-xs-12">
                                <input type="text" class="form-control has-feedback-left" id="my_single_cal2" placeholder="First Name" aria-describedby="inputSuccess2Status2">
                                <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                                <span id="inputSuccess2Status2" class="sr-only">(success)</span>
                                <span id="my_single_cal2_info" class="sr-only" ></span>
                                <span id="record_id" class="sr-only" >(success)</span>
                              </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">消费金额</label>
                        <div class="col-md-6 col-sm-9 col-xs-12">
                           <input type="text" id="detial_amount" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">备注</label>
                        <div class="col-md-6 col-sm-9 col-xs-12" id ="editable-select-div">
                          <select class="select2_single form-control" tabindex="-1"  id="editable-select" >
                            <option></option>
                          </select>
                        </div>
                        
                      </div>
                    </form>
                  </div>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                          <button type="button" class="btn btn-primary" id = "save_record_info">Save changes</button>
                        </div>

                      </div>
                    </div>
                  </div>
                  <!-- /modals -->
                </div>
          <!-- 调整账单modal end -->
<!-- modal end -->
        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>
    <!-- hidden start -->
    <input id = "path" type = "hidden" value = "${pageContext.request.contextPath}" />
    <!-- hidden end -->

    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/assets/default/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/assets/default/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="${pageContext.request.contextPath}/assets/default/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="${pageContext.request.contextPath}/assets/default/vendors/nprogress/nprogress.js"></script>
    <!-- Chart.js -->
    <script src="${pageContext.request.contextPath}/assets/default/vendors/Chart.js/dist/Chart.min.js"></script>
    <!-- gauge.js -->
    <script src="${pageContext.request.contextPath}/assets/default/vendors/gauge.js/dist/gauge.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="${pageContext.request.contextPath}/assets/default/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="${pageContext.request.contextPath}/assets/default/vendors/iCheck/icheck.min.js"></script>
    <!-- Skycons -->
    <script src="${pageContext.request.contextPath}/assets/default/vendors/skycons/skycons.js"></script>
    <!-- Flot -->
    <script src="${pageContext.request.contextPath}/assets/default/vendors/Flot/jquery.flot.js"></script>
    <script src="${pageContext.request.contextPath}/assets/default/vendors/Flot/jquery.flot.pie.js"></script>
    <script src="${pageContext.request.contextPath}/assets/default/vendors/Flot/jquery.flot.time.js"></script>
    <script src="${pageContext.request.contextPath}/assets/default/vendors/Flot/jquery.flot.stack.js"></script>
    <script src="${pageContext.request.contextPath}/assets/default/vendors/Flot/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="${pageContext.request.contextPath}/assets/default/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="${pageContext.request.contextPath}/assets/default/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/default/vendors/flot.curvedlines/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="${pageContext.request.contextPath}/assets/default/vendors/DateJS/build/date.js"></script>
    <!-- JQVMap -->
    <script src="${pageContext.request.contextPath}/assets/default/vendors/jqvmap/dist/jquery.vmap.js"></script>
    <script src="${pageContext.request.contextPath}/assets/default/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
    <script src="${pageContext.request.contextPath}/assets/default/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="${pageContext.request.contextPath}/assets/default/vendors/moment/min/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/default/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    
    
    <!-- Datatables -->
    <script src="${pageContext.request.contextPath}/assets/default/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/default/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/default/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/default/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/default/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/default/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/default/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/default/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/default/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/default/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/default/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/assets/default/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/default/vendors/jszip/dist/jszip.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/default/vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/default/vendors/pdfmake/build/vfs_fonts.js"></script>
    
    <!-- jquery-editable-select-master -->
    <script src="${pageContext.request.contextPath}/assets/default/additional/jquery-editable-select-master/jquery-editable-select.min.js"></script>
    <link href="${pageContext.request.contextPath}/assets/default/additional/jquery-editable-select-master/jquery-editable-select.min.css" rel="stylesheet">
    
    <script src="${pageContext.request.contextPath}/assets/default/vendors/jsencrypt/jsencrypt.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/xx/xx.js"></script>
	<script>
	
	 document.onkeydown = function(e){
		    var event = e || window.event;  
		    var code = event.keyCode || event.which || event.charCode;
		    if (code == 13) {
		    	if($('#editable-select').is(":focus")){//点击回车 且 焦点在备注输入框上
		    		var remark = $('#editable-select').val();
		    		//检查是否在当前备注库中
		    		var params = {};
					params['remark']=$("#editable-select").val();
					$.wj.ajax({
						url: '<%=path%>/credit/addRemark.do',
						params:params,
						 success:function(data){
							 if(data.duplicate == 1){// 1 插入成功  重新加载信息,  0 表示不成功
								  $("#editable-select").remove();
								  $("#editable-select-div").append("<select class='select2_single form-control' tabindex='-1'  id='editable-select' >  <option></option> </select>")
								  setRmarks(data);
								  $("#editable-select").val(remark);
								  //加入新选项 ,   先清空之前的 然后重新加载.
								  
								  //加入撤销功能TODO
							 }
						  }
					});
		    	}
		    }
		};
		//可选的选项
		var remarks;
		//获取可选备注项目
		$.wj.ajax({
			  url: '<%=path%>/credit/getRemarks.do',
			  success:function(data){
				  remarks = data;
				  setRmarks(data);
			  }
		});
	
		function setRmarks(data){
// 			 $("#editable-select").empty();
			 $.each(data.remarks, function(key, val){   
				 $("#editable-select").append("<option value='"+val.id+"'>"+val.name+"</option>");
			  }); 
			$('#editable-select').editableSelect();
		}
		
	$("#search_all").click(function(){
		$("#searh_all_block").toggle();
	});
	
	var i =0;
	$(document).ready(function(){
		$("#reservation").change(function(){
	 		i++;
	 		if(i>3){
	 			var filter = {};
	 			filter['reservation'] = $("#reservation").val(); 
	 			table.settings()[0].ajax.data=$.wj.p(filter);
	 			$('#datatable-xx').DataTable().ajax.reload();
	 		}
		});
	});

	
	var date=new Date;
	 var year=date.getFullYear(); 
	 var month=date.getMonth()+1;
	 var day = date.getDate(); //获取当前日(1-31)
	 month =(10> month? "0"+month:month); 
	 day =(10> day? "0"+day:day); 
	 var mydate_s = (month.toString()+"/01/"+year.toString());
	 var mydate_e = (month.toString()+"/+"+day+"+/"+year.toString());
	 $("#reservation").val(mydate_s+ " - "+mydate_e);
	 
	var id = '<%=id %>';
		$(function(){
			var params = {};
				$.wj.ajax({
			      contenttype : 'application/json; charset=utf-8',
			      async: false,
				  url: '<%=path%>/user/menu.do',
				  type:"post",
				  dataType:"json",
				  params:params,
				  success:function(data){
					  $.wj.c(data.list);
					 $.wj.left(data.list);
				  }
			});
		});
		
		
     </script>
      <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/assets/default/build/js/custom.min.js"></script>
    
    <script>
    var Totalnumber =0;
    var TotalFeenumber =0;
    var TotalRepaynumber =0;
    var filter = {};
	filter['target'] = id; 
	console.log(filter);
    var table = $('#datatable-xx').DataTable({
    	"fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
    			if(aData.amount >0){
    				if(aData.safty_cost_fee==0){
//     					Totalnumber =  $.wj.cal_float(Totalnumber+aData.amount);
    				}
//else{
//     					TotalFeenumber =  $.wj.cal_float(TotalFeenumber+aData.safty_cost_fee);
//     				}
//     			}else {
//     				TotalRepaynumber =  $.wj.cal_float(TotalRepaynumber+aData.amount);
    			}
            }, 
            "drawCallback": function( settings) {
    			$("#total_cost").html(Totalnumber);
    			$("#total_fee_cost").html(TotalFeenumber);
    			$("#total_repay").html(TotalRepaynumber.toString().replace("-",""));
    			Totalnumber=0;
    			TotalFeenumber=0;
    			TotalRepaynumber=0;
            }, 
    		"language" : {
    			"info" : "&nbsp;",
    			"oPaginate" : {
    				"sPrevious" : " &laquo; ",
    				"sNext" : " &raquo;",
    			},
    			"infoEmpty" : "没有符合条件的记录!",
    			"lengthMenu" : "显示 _MENU_ 条",
    			"sZeroRecords" : "没有找到匹配的记录",
    			"sInfoEmpty" : "",
   				"sSearch" : "快速检索：",
    		},
    		dom: "Bfrtip",
    		buttons: [
						{
						    text: '返回',
						    action: function ( e, dt, node, config ) {
						    	$.wj.location(BASE+"/credit/index.html");
						        this.disable(); // disable button
						    },
						    className: " btn-primary"
						},
						{
						  extend: "copy",
						  text: '复制到剪贴板',
				            key: {
				                key: 'c',
				                altKey: true
				            },
						  className: " btn-info"
						},
						{
						  extend: "csv",
						  text: '导出',
						  className: " btn-warning"
						},
						{
						  extend: "print",
						  text: '打印',
						  className: " btn-success"
						},
					  ],
//     		"pagingType" : "full_numbers",//用于指定分页器风格 "full_numbers"" or ""two_button""， default ""two_button""
//     		"bAutoWidth" : false, //是否主动策画表格各列宽度
    		"ajax" : {
    			"url" :  '<%=path%>/credit/getdetialdata.html',
    			"type" : "POST",
    			"dataType" : "json",
//     			"data":$.wj.p(filter)
    		},
    		
    		"processing" : true,
//     		"serverSide" : true,
//     		"bLengthChange" : false,
    		"bSort" : true, // 排序功能
//     		"searching" : false,
//     		"dom" : '<"top">t<"bottom"lip><"clear">',
    		"order": [[2, 'desc']],
    		"columns" : [ 
    			{"mData" : "cardno"},
    			{"mData" : "amount"},
   				{"mData" : "cr_date"},
    			{"mData" : "remark"},
    			{"mData" : "remark"},
    			
    		 ],
            "columnDefs": [
				{"render": function(data, type, row){
					var tail = "";
					return "<img src='${pageContext.request.contextPath}/assets/default/production/bank/"+row.bank+".jpg' height='30' width='30' class='profile_img'>&nbsp;&nbsp;"+row.cardno;
				  },
				   "orderable": false,
				   "targets": 0
					},
				{"render": function(data, type, row){
					if(row.safty_cost_fee>0){
// 						return row.amount+"(<font color='red'>"+row.safty_cost_fee+"</font>)";
						return "<font color='red'>"+row.safty_cost_fee+"</font>";
					}else if (row.amount <0){
						return "<font color='green'>"+row.amount.toString().replace('-','')+"</font>";
					}else{
						return row.amount+"";
					}
				  },
				   "orderable": false,
				   "targets": 1
					},
				{"render": function(data, type, row){
					if(row.safty_cost_fee>0){
						return row.remark + "    <font color='red'>water！<b>" +row.amount+"</b>   => ( cost:<b>"+row.safty_cost_fee+"</b>)   </font>" ;
// 						return "<font color='red'>"+row.safty_cost_fee+"</font>";
					}else if (row.amount <0){
						return row.remark;
					}else{
						return row.remark;
					}
				  },
				   "orderable": false,
				   "targets": 3
					},
				{"render": function(data, type, row){
					return '<div class="btn-group">'+'<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target=".modal-record-detial"'+
					'  onclick="edit_detial(\''+row.id+'\',\''+row.cr_date+'\',\''+row.amount+'\',\''+row.bank+'\',\''+row.cardno+'\',\''+row.remark+'\')"><i class="fa fa-align-left"></i>&nbsp;detial</a>'+'</div>';
				  },
				   "orderable": false,
				   "targets": 4
					},
            	]
    	});
    
    function edit_detial(id, cr_date,amount,bank ,cardno,remark){
    	
//     	alert($("#path").val());
    	$("#bankpic").attr("src" , $("#path").val()+"/assets/default/production/bank/"+bank+".jpg");
    	$("#cardno").html(cardno);
    	$("#detial_time").html(cr_date);
    	$("#my_single_cal2_info").html(cr_date);
    	$("#detial_amount").val(amount);
    	$("#editable-select").val(remark);
    	$("#record_id").html(id);
    }
    	 
    function detial(id){
    	$.wj.location(BASE+"/credit/detial.html?id="+id);
	};
	table.draw();
    table.buttons( '.csv' ).disable();
    
    
    
    var cb = function(start, end, label) {
		  console.log(start.toISOString(), end.toISOString(), label);
		  $('#myreportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
		};

		var optionSet1 = {
		  startDate: moment().subtract(29, 'days'),
		  endDate: moment(),
		  minDate: '01/01/2012',
		  maxDate: '12/31/2015',
		  dateLimit: {
			days: 60
		  },
		  showDropdowns: true,
		  showWeekNumbers: true,
		  timePicker: false,
		  timePickerIncrement: 1,
		  timePicker12Hour: true,
		  ranges: {
			'Today': [moment(), moment()],
			'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
			'Last 7 Days': [moment().subtract(6, 'days'), moment()],
			'Last 30 Days': [moment().subtract(29, 'days'), moment()],
			'This Month': [moment().startOf('month'), moment().endOf('month')],
			'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
		  },
		  opens: 'left',
		  buttonClasses: ['btn btn-default'],
		  applyClass: 'btn-small btn-primary',
		  cancelClass: 'btn-small',
		  format: 'MM/DD/YYYY',
		  separator: ' to ',
		  locale: {
			applyLabel: 'Submit',
			cancelLabel: 'Clear',
			fromLabel: 'From',
			toLabel: 'To',
			customRangeLabel: 'Custom',
			daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
			monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
			firstDay: 1
		  }
		};
		
// 		$('#reportrange span').html(moment().subtract(29, 'days').format('MMMM D, YYYY') + ' - ' + moment().format('MMMM D, YYYY'));
		$('#myreportrange').daterangepicker(optionSet1, cb);
		
		$('#my_single_cal2').daterangepicker({
			  singleDatePicker: true,
			  timePicker: true, //显示时间
			  locale: {
				  format: 'YYYY/MM/DD h:mm A', //设置显示格式
// 		            applyLabel: '确定', //确定按钮文本
// 		            cancelLabel: '取消', //取消按钮文本
// 		            daysOfWeek: ['日', '一', '二', '三', '四', '五', '六'],
// 		            monthNames: ['一月', '二月', '三月', '四月', '五月', '六月',
// 		                '七月', '八月', '九月', '十月', '十一月', '十二月'
// 		            ],
// 		            firstDay: 1
		        },
			  singleClasses: "picker_2"
			}, function(start, end, label) {
				$('#my_single_cal2_info').html(start.format( 'YYYY/MM/DD HH:mm:ss'));
			  console.log(start.toISOString(), end.toISOString(), label);
			});
<%--     var id = '<%=id %>'; --%>
// 	alert(id+"22");
		$("#save_record_info").click(function(){
// 			alert(23);
			var params = {};
			params['my_single_cal2_info'] = $("#my_single_cal2_info").html();
			params['detial_amount'] = $("#detial_amount").val();
			params['editable-select'] = $("#editable-select").val();
			params['id'] = $("#record_id").html();
			$.wj.ajax({
			      url: '<%=path%>/credit/updateRecord.do',
				  params:params,
				  success:function(data){
					  $("#modal-modal-record-detial").modal('hide');
					  $('#datatable-xx').DataTable().ajax.reload();
					  $.wj.ajax({
						  url: '<%=path%>/credit/getRemarks.do',
						  success:function(datar){
							  remarks = datar;
							  $("#editable-select").remove();
							  $("#editable-select-div").append("<select class='select2_single form-control' tabindex='-1'  id='editable-select' >  <option></option> </select>")
							  setRmarks(datar);
						  }
					});
					  
				  }
			});
		});

// 	table.ajax.reloadData({'filter':filter});
    </script>
  </body>
</html>
