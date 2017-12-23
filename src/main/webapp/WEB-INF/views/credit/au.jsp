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
    
    <!-- Bootstrap Colorpicker -->
    <link href="${pageContext.request.contextPath}/assets/default/vendors/mjolnic-bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/default/vendors/cropper/dist/cropper.min.css" rel="stylesheet">
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
          <!-- /top tiles -->

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Form Design <small>different form elements</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
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
                            <lable id = "consumption_type">消费</lable>
                          </div>
                        </div>
                      </div>
                      
                      
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button class="btn btn-primary" type="button">Cancel</button>
						  <button class="btn btn-primary" type="reset">Reset</button>
                          <button type="button" class="btn btn-success" id ="pay">Submit</button>
                        </div>
                      </div>
                      
                    </form>
                  </div>
                </div>
              </div>
            </div>
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
    
       <!-- jQuery Tags Input -->
    <script src="${pageContext.request.contextPath}/assets/default/vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
    
    <!-- jquery.inputmask -->
    <script src="${pageContext.request.contextPath}/assets/default/vendors/jquery.inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
    <!-- Bootstrap Colorpicker -->
    <script src="${pageContext.request.contextPath}/assets/default/vendors/mjolnic-bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
    
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
		});
		
		$("#type").change(function(){
			if(document.querySelector('#type').checked){
				$("#consumption_type").html("消费");
			}else{
				$("#consumption_type").html("日常消费");
			}
		});
		
		  //tags input
		function init_TagsInput11() {
			if(typeof $.fn.tagsInput !== 'undefined'){
				$('#tags_1').tagsInput({
				  width: 'auto'
				});
			}
		  };
		  
		  var creditData ;
		  var select_flag = 0;
		  var first_init_flag =0;
		  //tags input
// 			function init_selects() {
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
// 			  };

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
			
			
		  
		  $("#pay").click(function(){
				var params = {};
				params['bank'] = $("#bank").val(); 
				params['cardno'] = $("#cardno").val(); 
				params['amount'] = $("#amount").val(); 
				params['type'] = document.querySelector('#type').checked; 
				params['remark'] = $("#remark").val(); 
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
		
		$(document).ready(function() {
			init_TagsInput11();
// 			init_selects();
		});
		
     </script>
      <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/assets/default/build/js/custom.min.js"></script>
    
    <script>
    
    </script>
  </body>
</html>
