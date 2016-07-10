<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%	String path = request.getContextPath();%> 
<%	String itemId = request.getAttribute("item_id")+"";%>
<%	String parentId = request.getAttribute("item_pid")+"";%> 

<jsp:include page="../include/head.jsp" flush="true">
<jsp:param name="itemId" value="<%=itemId%>" />
<jsp:param name="parentId" value="<%=parentId%>" />
<jsp:param name="title" value="课时管理" />
<jsp:param name="link1" value="课时管理" />
<jsp:param name="link2" value="" /> 
</jsp:include>
<div class="main-content">
	<div class="page-content">
		<div class="page-content-area">
			<p>
				<button class="btn btn-info btn-sm" id="addEN">
					<i class="fa fa-plus"></i> 英语课
				</button>
				<button class="btn btn-success btn-sm" id="addGEOG">
					<i class="fa fa-plus"></i> 地理课
				</button>
			</p>
			<div class="row">
				<div class="widget-body">
												<div class="widget-main padding-24">
													<div class="row">
														<div class="col-sm-6">
															<div class="row">
																<div class="col-xs-11 label label-lg label-info arrowed-in arrowed-right">
																	<b>当前月&nbsp;&nbsp;(&nbsp;<label id = "current_month" style="color: #F94E8F"></label>&nbsp;)</b>
																</div>
															</div>

															<div class="row">
																<ul class="list-unstyled spaced" id = "current_month_detial">
																	
																</ul>
															</div>
														</div><!-- /.col -->

														<div class="col-sm-6">
															<div class="row">
																<div class="col-xs-11 label label-lg label-success arrowed-in arrowed-right">
																	<b >上个月&nbsp;&nbsp;(&nbsp;<label id = "pre_month" style="color: #F94E8F">></label>&nbsp;)</b>
																</div>
															</div>

															<div class="row">
																<ul class="list-unstyled spaced" id = "pre_month_detial">
																	
																</ul>
															</div>
														</div><!-- /.col -->
													</div><!-- /.row -->

													<div class="space"></div>

													<div>
														<table class="table table-striped table-bordered">
															<thead>
																<tr>
																	<th class="center">#</th>
																	<th>Product</th>
																	<th class="hidden-xs">Description</th>
																	<th class="hidden-480">Discount</th>
																	<th>Total</th>
																</tr>
															</thead>

															<tbody>
																<tr>
																	<td class="center">1</td>

																	<td>
																		<a href="#">google.com</a>
																	</td>
																	<td class="hidden-xs">
																		1 year domain registration
																	</td>
																	<td class="hidden-480"> --- </td>
																	<td>$10</td>
																</tr>

																<tr>
																	<td class="center">2</td>

																	<td>
																		<a href="#">yahoo.com</a>
																	</td>
																	<td class="hidden-xs">
																		5 year domain registration
																	</td>
																	<td class="hidden-480"> 5% </td>
																	<td>$45</td>
																</tr>

															</tbody>
														</table>
													</div>

													<div class="hr hr8 hr-double hr-dotted"></div>

													<div class="row">
														<div class="col-sm-5 pull-right">
															<h4 class="pull-right">
																Total amount :
																<span class="red">$395</span>
															</h4>
														</div>
														<div class="col-sm-7 pull-left"> Extra Information </div>
													</div>

													<div class="space-6"></div>
													<div class="well">
														Thank you for choosing Ace Company products.
													</div>
												</div>
											</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	var d_operate = "insert";
	
	var dataTables;
	/***新增人员页面跳转***/
	$(function(){ 
		$.sunny.ajax({
			  url: '<%=path%>/course/getCount.do',
			  type:"post",
			  dataType:"json",
			  success:function(data){
				  $("#current_month").html(data[0].month);
				  $("#pre_month").html(data[2].month);
				  $("#current_month_detial").append("<li><i class='ace-icon fa fa-caret-right blue'></i>"+data[0].name+"&nbsp;&nbsp;:&nbsp;&nbsp;<b class='red'>"+data[0].count+"</b></li>");
				  $("#current_month_detial").append("<li><i class='ace-icon fa fa-caret-right blue'></i>"+data[1].name+"&nbsp;&nbsp;:&nbsp;&nbsp;<b class='red'>"+data[1].count+"</b></li>");
				  $("#pre_month_detial").append("<li><i class='ace-icon fa fa-caret-right blue'></i>"+data[2].name+"&nbsp;&nbsp;:&nbsp;&nbsp;<b class='red'>"+data[2].count+"</b></li>");
				  $("#pre_month_detial").append("<li><i class='ace-icon fa fa-caret-right blue'></i>"+data[3].name+"&nbsp;&nbsp;:&nbsp;&nbsp;<b class='red'>"+data[3].count+"</b></li>");
			  }
		});
		
		$("#addEN").click(function(){
			$.sunny.confirm("确定添加英语课时?", function(result) {
				if(result) {
					$.sunny.ajax({
						  url: '<%=path%>/course/addEN.do',
						  type:"post",
						  dataType:"json",
						  success:function(menuData){
							  //重新加载表格
							  location.reload();
						  }
					});
				}
			});
		});
		
		$("#addGEOG").click(function(){
			$.sunny.confirm("确定添加地理课时?", function(result) {
				if(result) {
					$.sunny.ajax({
						  url: '<%=path%>/course/addGEOG.do',
						  type:"post",
						  dataType:"json",
						  success:function(menuData){
							  //重新加载表格
							  location.reload();
						  }
					});
				}
			});
		});
	}); 
			
	</script>	