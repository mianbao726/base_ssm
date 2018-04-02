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
    
    
    <!-- Switchery -->
    <link href="${pageContext.request.contextPath}/assets/default/vendors/switchery/dist/switchery.min.css" rel="stylesheet">

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
              <span class="count_top"><i class="fa fa-user"></i> Total Users</span>
              <div class="count">2500</div>
              <span class="count_bottom"><i class="green">4% </i> From last Week</span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-clock-o"></i> Average Time</span>
              <div class="count">123.50</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>3% </i> From last Week</span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Total Males</span>
              <div class="count green">2,500</div>
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
          
          <!-- 输入消费金额的modal -->
           <div class="x_content">

                  <!-- modals -->
                  <!-- Small modal -->
<!--                   <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">Small modal</button> -->

                  <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                      <div class="modal-content">

                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                          </button>
                          <h4 class="modal-title" id="myModalLabel2">pay</h4>
                        </div>
                        <div class="modal-body">
                          
                          <div class="x_content">
                    <br />
                    <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">

                      
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">银行</label>
                        <div class="col-md-6 col-sm-9 col-xs-12">
                          <select class="form-control" id = "bank">
                          </select>
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">卡号</label>
                        <div class="col-md-6 col-sm-9 col-xs-12">
                          <select class="form-control" id = "cardno">
<!--                             <option value ="5201690317587529">交行7529（家乐福）</option> -->
<!--                             <option value ="6222530319933730">交行3730（航空卡）</option> -->
<!--                             <option value ="6225758224851922">招商1922（迅雷）</option> -->
<!--                             <option value ="5236497912127035">招商7035（环球卡）</option> -->
                          </select>
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">金额</label>
                        <div class="col-md-6 col-sm-9 col-xs-12">
                           <input type="text" id="amount" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">备注</label>
                        <div class="col-md-6 col-sm-9 col-xs-12">
                           <input type="text" id="remark" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">类型</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <div class="">
                            <label>
                              <input id ="type" type="checkbox" class="js-switch" checked />  
                            </label>
                            <lable id = "consumption_type">pay</lable>
                          </div>
                        </div>
                      </div>
                      
                    </form>
                  </div>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                          <button type="button" class="btn btn-primary" id = "pay">Save changes</button>
                        </div>

                      </div>
                    </div>
                  </div>
                  <!-- /modals -->
                </div>
          <!-- 输入金额的modal end -->
          
          
          <!-- 调整账单的modal -->
           <div class="x_content">

                  <!-- modals -->
                  <!-- Small modal -->
<!--                   <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">Small modal</button> -->

                  <div class="modal fade bs-example-modal-sm-amount" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                      <div class="modal-content">

                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
                          </button>
                          <h4 class="modal-title" id="myModalLabel2">bill info</h4>
                        </div>
                        <div class="modal-body">
                          <div class="x_content">
                    <br />
                    <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">账单金额</label>
                        <div class="col-md-6 col-sm-9 col-xs-12">
                           <input type="text" id="bill_amount" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">未出账单金额</label>
                        <div class="col-md-6 col-sm-9 col-xs-12">
                           <input type="text" id="pre_bill_amount" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">剩余额度</label>
                        <div class="col-md-6 col-sm-9 col-xs-12">
                           <input type="text" id="remaining_credit" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                    </form>
                  </div>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                          <button type="button" class="btn btn-primary" id = "save_bill_info">Save changes</button>
                        </div>

                      </div>
                    </div>
                  </div>
                  <!-- /modals -->
                </div>
          <!-- 调整账单modal end -->

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>CRUD genernate <small>different form elements</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up" title="收放"></i></a>
                      </li>
                      <li><a class="collapse-link-xx"><i class="fa fa-file" title="新增"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">高级搜索</a>
                          </li>
                          <li><a href="#">近期项目</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link_xx"><i class="fa fa-refresh"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                  	<table id="datatable-xx" class="table table-striped dt-responsive nowrap projects" cellspacing="0" width="100%">
                      <thead>
                        <tr>
                          <th>bank</th>
                          <th>bill_amount</th>
                          <th>remaining quota</th>
                          <th>quota</th>
                          <th>temp</th>
                          <th>touched</th>
                          <th>operation</th>
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
    
    
    
    
      <!-- Switchery -->
    <script src="${pageContext.request.contextPath}/assets/default/vendors/switchery/dist/switchery.min.js"></script>
   
   
   
    <script src="${pageContext.request.contextPath}/assets/xx/xx.js"></script>
	<script>
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
			$("#gen_code").click(function(){
				var params = {};
				params['target'] = $("#col0001").val(); 
				$.wj.ajax({
			      contenttype : 'application/json; charset=utf-8',
			      async: false,
				  url: '<%=path%>/CRUD/gen001.html',
				  type:"post",
				  dataType:"json",
				  params:params,
				  success:function(data){
					 $.wj.c(data);
				  }
			});
			});
		});
		
		
		//银行卡信息
		var bankData;
		
		//加载下拉框
		  var creditData ;
		  var select_flag = 0;
		  var first_init_flag =0;
		$.wj.ajax({
				      contenttype : 'application/json; charset=utf-8',
				      async: false,
					  url: '<%=path%>/credit/getCreditInfos.do',
					  type:"post",
					  dataType:"json",
					  success:function(data){
						  creditData = data;
						  setOptions(data,"");
// 						  $.each(data.creditCardInfo, function(key, val){   
// 								var keys = key.split("_");
// 								$("#bank").append("<option value='"+keys[0]+"'>"+keys[1]+"</option>");
// 								$.each(val,function(){
// 									var cardi = this.split("_");
// // 									if("" != mapkey && cardi[0] == mapkey)
// 										$("#cardno").append("<option value='"+cardi[0]+"' rel = '"+keys[0]+"'>"+keys[2]+cardi[0].substring(12)+"("+cardi[1]+")"+"</option>");
// 								});
// 							  }); 
					  }
				});
		function setOptions(data,selected_key){
			$("#cardno").empty();
			 $.each(data.creditCardInfo, function(key, val){   
				var keys = key.split("_");
				if(0 == first_init_flag)
					$("#bank").append("<option value='"+keys[0]+"'>"+keys[1]+"</option>");
				$.each(val,function(){
					var cardi = this.split("_");
					if(0==select_flag || keys[0] == selected_key)
						$("#cardno").append("<option value='"+cardi[0]+"' rel = '"+keys[0]+"'>"+keys[2]+cardi[0].substring(12)+"("+cardi[1]+")"+"</option>");
				});
			  }); 
			 first_init_flag =1;
		}
		
		$("#cardno").change(function(){
			$("#bank ").val($("#cardno").find("option:selected").attr("rel"));
		});
		
		$("#bank").change(function(){
			select_flag = 1;
			setOptions(creditData,$("#bank").find("option:selected").val());
		});
		
		$("#type").change(function(){
			if(document.querySelector('#type').checked){
				$("#consumption_type").html("pay");
			}else{
				$("#consumption_type").html("消费");
			}
		});
		
		 $("#pay").click(function(){
// 				var params = {};
// 				params['bank'] = $("#bank").val(); 
// 				params['cardno'] = $("#cardno").val(); 
// 				params['amount'] = $("#amount").val(); 
// 				params['type'] = document.querySelector('#type').checked; 
// 				params['remark'] = $("#remark").val(); 
				console.log(params);
				$.wj.ajax({
			      contenttype : 'application/json; charset=utf-8',
			      async: false,
				  url: '<%=path%>/credit/pay.do',
				  type:"post",
				  dataType:"json",
				  params:params,
				  success:function(data){
					  $.wj.location(BASE+"/credit/index.html");
				  }
			    });
			});
		 
     </script>
      <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/assets/default/build/js/custom.min.js"></script>
    
    <script>
    var table = $('#datatable-xx').DataTable({
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
						    text: 'spend',
						    action: function ( e, dt, node, config ) {
						    	$.wj.location(BASE+"/credit/au.html");
						        this.disable(); // disable button
						    },
						    className: " btn-info"
						},
						{
						    text: 'repay',
						    action: function ( e, dt, node, config ) {
						    	$.wj.location(BASE+"/example1/au1.html");
						        this.disable(); // disable button
						    },
						    className: " btn-success"
						},
						{
						    text: 'water',
						    action: function ( e, dt, node, config ) {
						    	$.wj.location(BASE+"/example1/au2.html");
						        this.disable(); // disable button
						    },
						    className: " btn-danger"
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
// 						{
// 						  extend: "excel",
// 						  className: "btn-sm"
// 						},
// 						{
// 						  extend: "pdfHtml5",
// 						  className: "btn-sm"
// 						},
						{
						  extend: "print",
						  text: '打印',
						  className: " btn-success"
						},
					  ],
//     		"pagingType" : "full_numbers",//用于指定分页器风格 "full_numbers"" or ""two_button""， default ""two_button""
//     		"bAutoWidth" : false, //是否主动策画表格各列宽度
    		"ajax" : {
    			"url" :  '<%=path%>/credit/getdata.html',
    			"type" : "POST",
    			"dataType" : "json"
    		},
    		
    		"processing" : true,
//     		"serverSide" : true,
//     		"bLengthChange" : false,
//     		"bSort" : false, // 排序功能
//     		"searching" : false,
//     		"dom" : '<"top">t<"bottom"lip><"clear">',
			"paging": false,
    		"order": [[5, 'desc']],
    		"columns" : [ 
   				{"mData" : "name"},
    			{"mData" : "month_bill_date"},
    			{"mData" : "remaining_credit"},
    			{"mData" : "total_credit"},
    			{"mData" : "bill_date"},
    			{"mData" : "touch_date"},
    			{"mData" : "touch_date"},
    		 ],
//     		 "preDrawCallback" : function(settings) {
//     					one = 1;
//     				},
            "columnDefs": [
    		    {"render": function(data, type, row){    
    		    	return '<div class="btn-group">'+
		                    '<button data-toggle="dropdown" class="btn btn-success dropdown-toggle btn-xs" type="button">pay<span class="caret"></span>'+
		                    '</button>'+
		                    '<ul role="menu" class="dropdown-menu">'+
		                      '<li><a href="#" data-toggle="modal" data-target=".bs-example-modal-sm" onclick="setDefaultBankInfo(\''+row.code+'\')">spend</a>'+
		                      '</li>'+
		                      '<li><a href="#">repay</a>'+
		                      '</li>'+
		                      '<li><a href="#">check</a>'+
		                      '</li>'+
		                      '<li class="divider"></li>'+
		                      '<li><a href="#">water</a>'+
		                      '</li>'+
		                      '<li class="divider"></li>'+
		                      '<li><a href="#" data-toggle="modal" data-target=".bs-example-modal-sm-amount" onclick="setBillInfo(\''+row.code+'\',\''+row.bill_amount+'\',\''+row.pre_bill_amount+'\',\''+row.remaining_credit+'\')">set.bill</a>'+
		                      '</li>'+
		                    '</ul>'+
		                    '</div>&nbsp;'+
				    '<div class="btn-group">'+'<a href="#" class="btn btn-primary btn-xs" onclick ="detial(\''+row.code+'\')"><i class="fa fa-align-left"></i>&nbsp;detial</a>'+'</div>'+
//                 	'&nbsp;<div class="btn-group">'+'<a href="#" class="btn btn-info btn-xs"><i class="fa fa-rmb"></i>&nbsp;add</a>'+'</div>&nbsp;'+
// 					'<div class="btn-group">'+'<a href="#" class="btn btn-success btn-xs"><i class="fa fa-repeat"></i>&nbsp;repay</a>'+'</div>&nbsp;'+
// 					'<div class="btn-group">'+'<a href="#" class="btn btn-danger btn-xs"><i class="fa fa-money"></i>&nbsp;pay</a>'+'</div>&nbsp;'+
					'';
    		    },
                 "orderable": false,
                 "targets": 6
             	}, 
	           	
	            {"render": function(data, type, row){
	            	var tail = "";
	            	if(row.problem_money != '0'){
	            		tail = "(<font color = 'red' >"+row.problem_money+"</font>)";
	            	}
// 	           		return row.remaining_credit+" ("+row.remaining_credit_percentage+"%)";
					return "<img src='${pageContext.request.contextPath}/assets/default/production/bank/"+row.code+".jpg' height='30' width='30' class='profile_img'>&nbsp;&nbsp;"+row.name
					//+"("+row.count+")" //卡片数量
					+ tail;
	  		    },
	               "orderable": false,
	               "targets": 0
	           	},
	            {"render": function(data, type, row){
	            	
	           		return $.wj.formatMoney(row.bill_amount)+" (<font color = '#5cb85c'>"+$.wj.formatMoney(row.pre_bill_amount)+"</font>)";
	  		    },
	               "orderable": false,
	               "targets": 1
	           	},
 				{"render": function(data, type, row){
	            	
	           		return $.wj.formatMoney(row.remaining_credit)+"(<font color = 'red'>"+$.wj.formatNumnber(row.remaining_credit/row.total_credit*100)+"%</font>)";
	  		    },
	               "orderable": false,
	               "targets": 2
	           	},
	           	
 				{"render": function(data, type, row){
	            	if(null == row.temporary_credit || "0" == row.temporary_credit){
		           		return $.wj.formatMoney(row.total_credit);
	            	}else{
	            		return $.wj.formatMoney(row.total_credit)+" ("+$.wj.formatMoney(row.temporary_credit)+")";
	            	}
	  		    },
	               "orderable": false,
	               "targets": 3
	           	},
	           	
// 	           	{"render": function(data, type, row){
// 	            	if(null == row.temporary_credit || "0" == row.temporary_credit){
// 		           		return $.wj.formatMoney(row.total_credit);
// 	            	}else{
// 	            		return $.wj.formatMoney(row.total_credit)+" ("+$.wj.formatMoney(row.temporary_credit)+")";
// 	            	}
// 	  		    },
// 	               "orderable": false,
// 	               "targets": 4
// 	           	},
	           	
	           	{"render": function(data, type, row){
	           		if("" == row.fee_free_day_count || null == row.fee_free_day_count){
	           			return "0";
	           		}else{
		            	return row.fee_free_day_count;
	           		}
	  		    },
	               "orderable": false,
	               "targets": 4
	           	},
	           	
            	]
    	});
    
    function detial(id){
    	$.wj.location(BASE+"/credit/detial.html?id="+id);
	};
	
	function setDefaultBankInfo(bankType){
		$("#bank").val(bankType);
		$("#bank").change();
	};
	
	var current_bank;
	function setBillInfo(bankType,bill_amount,pre_bill_amount,remaining_credit){
		current_bank = bankType ;
		if(0==bill_amount){
			$("#bill_amount").attr("placeholder","0");
		}else{
			$("#bill_amount").val(bill_amount);
		}
		if(0==pre_bill_amount){
			$("#pre_bill_amount").attr("placeholder","0");
		}else{
			$("#pre_bill_amount").val(pre_bill_amount);
		}
		if(0==remaining_credit){
			$("#remaining_credit").attr("placeholder","0");
		}else{
			$("#remaining_credit").val(remaining_credit);
		}
		
	};
	
	$("#save_bill_info").click(function(){
		var params = {};
		
		params['current_bank'] = current_bank; 
		params['bill_amount'] = ""==$("#bill_amount").val()?0:$("#bill_amount").val(); 
		params['pre_bill_amount'] = ""==$("#pre_bill_amount").val()?0:$("#pre_bill_amount").val(); 
		params['remaining_credit'] = ""==$("#remaining_credit").val()?0:$("#remaining_credit").val(); 
		$.wj.ajax({
	      contenttype : 'application/json; charset=utf-8',
	      async: false,
		  url: '<%=path%>/credit/setBillInfo.do',
		  type:"post",
		  dataType:"json",
		  params:params,
		  success:function(data){
			  $.wj.location(BASE+"/credit/index.html");
		  },
	    });
	});
    
    table.buttons( '.csv' ).disable();
    </script>
  </body>
</html>
