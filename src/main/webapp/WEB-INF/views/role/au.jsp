<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%	String path = request.getContextPath();%> 
<%	String itemId = request.getAttribute("item_id")+"";%>
<%	String parentId = request.getAttribute("item_pid")+"";%> 

<jsp:include page="../include/head.jsp" flush="true">
<jsp:param name="itemId" value="<%=itemId%>" />
<jsp:param name="parentId" value="<%=parentId%>" />
<jsp:param name="title" value="角色管理" />
<jsp:param name="link1" value="角色管理" />
<jsp:param name="link2" value="角色信息维护" /> 
</jsp:include>
<style type="text/css">
.ztree li a {
	padding-left: 5px;
}
</style>
			<div class="col-sm-12" style="background-color: white;overflow-x:hidden">
				<form class="form-horizontal" role="form" id="form">
					<div class="widget-box" style="margin-bottom: 16px;">
						<div class="widget-header">
							<h4>角色信息</h4>
							
						</div>
						<!-- hidden area start -->
						<input type="hidden" id = "gloable_pid"><!-- pid -->
						<input type="hidden" id = "edit_current_id"><!-- edit current id -->
						<input type="hidden" id = "edit_current_action_id"><!-- edit current id -->
						<input type="hidden" id = "au_flag"><!-- current permission add(0)/update(1) flag -->
						<!-- hidden area end -->
						<div class="widget-body">
							<div class="widget-main">
								<div class="form-group" style="margin-top: 16px;">
									<label class="col-sm-2 text-left" for="form-field-1"
										style="width: 150px;">角色名称</label>
									<div class="col-sm-3">
										<input type="text" id="role_name" name="role_name"
											maxlength="50" placeholder="" class="col-xs-10 col-sm-12">
									</div>
								</div>

								<div class="form-group" style="margin-top: 16px;">
									<label class="col-sm-2 text-left" for="form-field-1"
										style="width: 150px;">角色描述</label>
									<div class="col-sm-3">
										<input type="text" id="role_info" name="role_info"
											maxlength="50" placeholder="" class="col-xs-10 col-sm-12">
									</div>
								</div>
								
								<div class="form-group" style="margin-top: 16px;">
									<label class="col-sm-2 text-left" for="form-field-1"
										style="width: 150px;">角色主页</label>
									<div class="col-sm-3">
										<input type="text" id="role_main" name="role_main"
											maxlength="50" placeholder="" class="col-xs-10 col-sm-12">
									</div>
								</div>
								

								<div class="form-group"
									style="margin-top: 16px; margin-right: 20px; margin-left: 20px">
									<div class="widget-box widget-color-blue2">
										<div class="widget-header">
											<h4 class="widget-title lighter smaller">功能管理</h4>
										</div>
										<div  id = "loading_hint" style="">
										<i class="ace-icon fa fa-spinner fa-spin orange bigger-125"></i>
											正在载入中&nbsp;&nbsp;^o^
										</div>
										<div class="widget-body">
											<div class="widget-main" style="overflow: auto; width: 100%;">
												<ul id="tree" class="ztree"
													style="width: 100%; height: 300px; overflow: auto;"></ul>
											</div>
										</div>
									</div>
								</div>



								<!-- 编辑单个权限 start -->
								<div class="modal fade" id="edit_permission" tabindex="-1"
									role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog" style="width: 900px;">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<h4 class="modal-title" id="myModalLabel">修改权限</h4>
											</div>
											<div class="modal-body">
												<div class="row" style="padding-top: 30px;">
													<div class="col-sm-12">
														<form class="form-horizontal" id="form-horizontal">
															<div class="form-group">
																<label class="col-sm-3 control-label no-padding-right"
																	for="form-field-1" style="width: 120px;">权限名称
																	<span class="red">*</span>
																</label>
																<div class="col-sm-9">
																	<input type="text" name="name" id="action_"
																		class="col-xs-10 col-sm-5">
																		<small id = "permission_name_hint" data-bv-validator="notEmpty"  data-bv-result="INVALID" style="margin-left: 130px;color: #d16e6c">请输入权限名称</small>
																</div>
															</div>
														</form>
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">取消</button>
												<button type="button" class="btn btn-primary"
													id = "edit_permission_sigle">确定</button>
											</div>
										</div>
									</div>

								</div>
								<!-- 编辑单个权限 end -->


								<div class="form-group" style="margin-top: 16px; display: none">
									<label class="col-sm-2 text-left" for="form-field-1"
										style="width: 150px;">选取权限</label>
									<div class="col-sm-3">
										<span id="countPerson">已选择权限0个</span> <a
											href="javascript:void(0);" class="btn btn-xs btn-success"
											data-toggle="modal" id="selectTd"> <i
											class="fa fa-pencil-square-o"></i> 选取权限
										</a>
									</div>
								</div>


								<!-- 添加新权限 start -->
								<div class="modal fade" id="add_new_permission" tabindex="-1"
									role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog" style="width: 900px;">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<h4 class="modal-title" id="now_editing">添加新权限</h4>
												<h4 class="modal-title" id="now_editing_root" style="display: none">正在添加根菜单</h4>
											</div>
											<div class="widget-body">
												<div class="widget-main">
													<form class="form-horizontal" role="form" id ="from_permission">
														<div class="form-group">
															<label class="col-sm-2 control-label no-padding-right"
																for="form-field-1"> 资源名称：</label>

															<div class="col-sm-9">
																<input type="text" id="w_action_name"
																	name="w_action_name" placeholder="请输入权限名称"
																	class="col-xs-10 col-sm-5" />
																	<small id = "w_action_name_hint" data-bv-validator="notEmpty"  data-bv-result="INVALID" style="color: #d16e6c;margin-left: 10px;font-size: larger;;display: none">权限名称不能为空</small>
															</div>
														</div>
														
														<div class="form-group" id = "resource_type">
															<label class="col-sm-2 control-label no-padding-right"
																for="form-field-1"> 资源类型： </label>
															<div class="radio">
																<label class=""> <input type="radio" onclick="sh_inputs()"
																	name="w_action_level" class="ace" value="0"
																	id = "type000"
																	/> <span class="lbl">根菜单</span>
																</label>
																<label class=""> <input type="radio" 
																	name="w_action_level" class="ace" value="1"  onclick="sh_inputs()" id ="default_type"
																	id = "type001"
																	checked="checked" /> <span class="lbl" >子菜单</span>
																</label>
																 <label class=""> <input type="radio" onclick="sh_inputs()"
																		id = "type002"
																	name="w_action_level" class="ace" value="2" /> <span
																	class="lbl"> 按钮</span>
																</label> <label class=""> <input type="radio" onclick="sh_inputs()"
																	id = "type003"
																	name="w_action_level" class="ace" value="3" /> <span
																	class="lbl"> 请求</span>
																</label> <label class=""> <input type="radio" onclick="sh_inputs()"
																	id = "type004"
																	name="w_action_level" class="ace" value="4" /> <span
																	class="lbl"> 移动端</span>
																</label>
															</div>
														</div>
														<div class="form-group" id = "w_action_url_grp">
															<label class="col-sm-2 control-label no-padding-right"
																for="form-field-1"> 资源链接：</label>

															<div class="col-sm-9">
																<input type="text" id="w_action_url" name="w_action_url" style="width: 400px"
																	placeholder="请输入资源(package/page.jsp)或url(package/method.do)"
																	class="col-xs-10 col-sm-5" />
															<small id = "w_action_url_hint" data-bv-validator="notEmpty"  data-bv-result="INVALID" style="color: #d16e6c;margin-left: 10px;font-size: larger;display: none">资源链接不可为空</small>
															</div>
														</div>
														<div class="form-group" id = "w_action_pic_grp" style="display: none">
															<label class="col-sm-2 control-label no-padding-right"
																for="form-field-1"> 资源图标：</label>
															<div class="col-sm-3" >
																<select class="form-control" id="w_action_pic"
																	name="w_action_pic">
																	<option value="fa-tachometer">fa-tachometer</option>
																	<option value="fa-desktop">fa-desktop</option>
																	<option value="fa-list">fa-list</option>
																	<option value="fa-pencil-square-o">fa-pencil-square-o</option>
																	<option value="fa-list-alt">fa-list-alt</option>
																	<option value="fa-calendar">fa-calendar</option>
																	<option value="fa-picture-o">fa-picture-o</option>
																	<option value="fa-tag">fa-tag</option>
																	<option value="fa-file-o">fa-file-o</option>
																</select>
																预览效果&nbsp;=>&nbsp;&nbsp;<i id="preview_logo" class="menu-icon fa fa-desktop"></i>
															</div>
														</div>
														<div class="form-group">
															<label class="col-sm-2 control-label no-padding-right"
																for="form-field-tags">排序：</label>
															<div class="col-sm-5">
																<div class="inline">
																	<input type="text" id="w_sort_num" name = "w_sort_num"
																		placeholder="" />
																		<small id = "w_sort_num_hint" data-bv-validator="notEmpty"  data-bv-result="INVALID" style="color: #d16e6c;margin-left: 10px;font-size: larger;display: none">请填写数字,至少一位</small>
																</div>
															</div>
														</div>
														<div class="form-group">
															<label class="col-sm-2 control-label no-padding-right"
																for="form-field-1"> 帮助信息：</label>
															<div class="col-sm-6">
																<textarea class="form-control" id="w_help" name="w_help"
																	placeholder="备注"></textarea>
															</div>

														</div>
													</form>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">取消</button>
												<button type="button" class="btn btn-primary"
													onclick="save_permissoin()">确定</button>
											</div>
										</div>
									</div>

								</div>
								<!-- 添加新权限 end -->

							</div>
						</div>
					</div>
					<div class="clearfix form-actions">
						<div class="col-md-offset-1 col-md-9">
							<button class="btn btn-info btn-sm" type="button" id="save">
								<i class="fa fa-floppy-o"></i> 保 存
							</button>

							&nbsp; &nbsp; &nbsp;
							<button class="btn btn-sm" type="reset" id="back">
								<i class="icon-undo bigger-110"></i> 返 回
							</button>

						</div>
					</div>
				</form>
			</div>

<script type="text/javascript">

/*********************************************datatables 权限开始************************************************************/
var datatables;	

 //权限id
	var chargeIds = new Array();
//产品id
	var goodsIds = new Array();
	<!--编辑页面-->
	//
	var current_path = '<%=path%>';
	var attid = '${param.id}';
	var current_level= -1;
	//add=>true  edit=>false
	var addEditFlag = (attid == '');
	if(!addEditFlag){
		var params = {};
		params['id'] = attid;
		$.sunny.ajax({
		  url: "../role/getRoleInfo.do",
		  type:"post",
		  dataType:"json",
		  params:params,
		  async:false,
		  success:function(data){
			  $("#role_name").val(data.info.role_name);
			  $("#role_info").val(data.info.role_info);
			  $("#role_main").val(data.info.role_main);
			  $("#edit_current_id").val(attid);
			  }
		});	  
	}
	
	$(function(){	
		
		/**************************************************验证js开始******************************************************/
		$('#form').bootstrapValidator({
	        message: 'This value is not valid',
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	        	role_name: {
	                validators: {
	                	notEmpty: {
	                        message: '角色不可以为空'
	                    },
	                }
	            },
	            role_info: {
	                validators: {
	                	notEmpty: {
	                        message: '角色描述不可以为空'
	                    },
	                }
	            }/* ,
	            role_main: {
	                validators: {
	                	notEmpty: {
	                        message: '角色主页不可以为空'
	                    },
	                }
	            } */
	            
	            
	        }
	    });
		/**************************************************验证js结束******************************************************/	
		$("input[name='ace1']").click(function(){
			var role_id = $("input[name='ace1']:checked").val();
			if(role_id=="99"){
				$("input[name='ace2']").removeAttr("disabled");
				$("input[name='ace2']:first").prop('checked', true);
			}else{
				$("input[name='ace2']").prop("disabled","disabled");
				$("input[name='ace2']").prop('checked', false);
			}
		})
		$("input[name='ace2']").click(function(){
			var role_id = $("input[name='ace1']:checked").val();
			if(role_id!="99"){
				$("input[name='ace2']").prop('checked', false);
			}
		})
		
		//权限多选框
		$("#selectTd").click(function(){
				
				$("#selectTdDlg").modal('show');
				
		})
		
		//产品多选框
		$("#selectCp").click(function(){
				
				$("#selectCpDlg").modal('show');
				
		})
		
		//返回
		$("#back").click(function() {
			window.location.href = '<%=path%>/role/index.html';
		});
	})
	
	function shocharids (){
		var s="";
		for( var i =0 ; i < channleIds.length ; i ++){
			s = s + " -- " + channleIds[i];
		}
		
		//alert(s);
	}
	//选择的权限
	var perSelectOnCheckOn= new Array();
	
	
	function deleteArrElement(arr , tar){
		var tempChargeIDs = new Array();
		for( var i =0 ;i < arr.length ;i++){
			if(i== tar){
				continue;
			}else{
				tempChargeIDs.push(arr[i]);
			}
		}
		return tempChargeIDs;
	}
	
	
	function checkAll_channel(){
		if($("#checkAll").prop('checked')){//选中新的
			$("input[rel=pol]").each(function(){
				addCheckOnCharge("ch_check"+$(this).val(),$(this).val());
			});
			
		}else{//取消以选中
			$("input[rel=pol]").each(function(){
				addCheckOnCharge("ch_check"+$(this).val(),$(this).val());
			});
		}
	}
	
	
		//选取权限
	function addCheckOnCharge(id,checkid){
			if($("#"+id).prop('checked')){//选中新的
				for( var i =0 ; i < channleIds.length ; i ++){
					if(channleIds[i] == checkid){
						channleIds = deleteArrElement(channleIds , i); 
						$('#countPerson').html('已选择权限'+channleIds.length+'个');
						break;
					}
				}
			}else{//取消以选中
				var tempFlag = true;
				for( var i =0 ; i < channleIds.length ; i ++){
					if(channleIds[i] == checkid){
						tempFlag= false;
						break;
					}
				}
				if(tempFlag){
					channleIds.push(checkid);
					$('#countPerson').html('已选择权限'+channleIds.length+'个');
				}
			}
// 		}
	}
		//权限id
		var channleIds = new Array() ;
		//权限数量
		var c;
		//确定权限
		function saveTd(){
			c=0;
			channleIds = new Array();
			$("input[type=checkbox][name=channle]:checked").each(function(){
// 	 			alert($(this).val());
				channleIds.push($(this).val());
// 				alert(channleIds[0]);
				c++;
			});
			$('#countPerson').html('已选择权限'+c+'个');
			$("#selectTdDlg").modal('hide');
		}
		
	var goodsSelectOnCheckOn= new Array();
		//选取产品
		function addCheckOnGoods(id ,checkid){
// 	 		alert(id+"  " + $("#"+checkid).prop('checked'));
// 	 		alert($("#"+checkid).prop('checked'));
			//$("#"+checkid).prop('checked')  false 选中      true不选中
			
			if(!$("#"+checkid).prop('checked')){
				goodsSelectOnCheckOn.push(checkid);
				
			}else{
				for(var i = 0 ;i<goodsSelectOnCheckOn.length ; i++){
					if(goodsSelectOnCheckOn[i] == checkid){
						goodsSelectOnCheckOn.splice(i, 1);
						break;
					}
						
				}
			}
		}
		//确定产品
		function saveCp(){
			var checks = document.getElementsByName("id");
			n = 0;
			for(i=0;i<checks.length;i++){
				if(checks[i].checked)
					n++;
			}
	 		$('#countGoods').html('已选择产品'+n+'个');
			$("#selectCpDlg").modal('hide');
		}
	
	/***sousuo***/
	$("#queryTd").click(
		function(){
		var permission_name = $("#permission_name").val();
		var filter = [];
		if (permission_name != "") {
			var rcc = {};
			rcc.key = 't.permission_name';
			rcc.mode = "%", rcc.value = permission_name;
			filter.push(rcc);
		}
		datatables.ajax.reloadData({
			'filter' : filter
		});
	});
	
</script>
	<!-- 当前页面专用 start -->
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/z-tree/js/jquery.ztree.all-3.5.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/fuelux/data/fuelux.tree-sample-demo-data.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/fuelux/fuelux.tree.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/z-tree/css/zTreeStyle/metro.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/viewjs/role/au-new-permission.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/viewjs/role/perssion-tree.js"></script>
	<!-- 当前页面专用 end -->
						