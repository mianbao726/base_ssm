<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%	String path = request.getContextPath();%> 
<%	String itemId = request.getAttribute("item_id")+"";%>
<%	String parentId = request.getAttribute("item_pid")+"";
String id = request.getParameter("id");%> 

<jsp:include page="../include/head.jsp" flush="true">
<jsp:param name="itemId" value="<%=itemId%>" />
<jsp:param name="parentId" value="<%=parentId%>" />
<jsp:param name="title" value="人员管理" />
<jsp:param name="link1" value="人员管理" />
<jsp:param name="link2" value="" /> 
</jsp:include>

<div class="main-content">
		<!-- /section:basics/content.breadcrumbs -->
		<div class="page-content" style="padding-left: 0px">
			<!-- #section:settings.box -->
			<div class="page-content-area">
					<div class="col-xs-12">
						<!-- PAGE CONTENT BEGINS -->
						<div class="row">
							<div class="col-sm-7">
								<div class="col-lg-6" style="min-width: 500px; padding-left: 0px">
									<form class="form-horizontal new-form" role="form" id="form">
										<div class="form-group" style="margin-top: 16px;">
											<label class="col-sm-3 control-label no-padding-right" for="form-field-1">账号(电话号)</label>
											<div class="col-sm-6">
												<input type="text" id="form-field-1" name="name" class="col-xs-10 col-sm-12"  >
											</div>
										</div>
										<div class="form-group" style="margin-top: 16px;">
											<label class="col-sm-3 control-label no-padding-right" for="form-field-1">姓名</label>
											<div class="col-sm-6">
												<input type="text" id="form-field-11" name="realname" class="col-xs-10 col-sm-12"  >
											</div>
										</div>
										<div class="form-group" style="margin-top: 16px;">
											<label class="col-sm-3 control-label no-padding-right" for="form-field-1">住址</label>
											<div class="col-sm-6">
												<input type="text" id="form-field-12" name="address" class="col-xs-10 col-sm-12"  >
											</div>
										</div>
										<div class="form-group" style="margin-top: 16px;">
											<label class="col-sm-3 control-label no-padding-right" for="form-field-1">身份证号</label>
											<div class="col-sm-6">
												<input type="text" id="form-field-13" name="idcard_au" class="col-xs-10 col-sm-12"  >
											</div>
										</div>
										
										<div class="form-group" style="margin-top: 16px;" id ="pwd_cloud">
											<label class="col-sm-3 control-label no-padding-right" for="form-field-2">密码</label>
											<div class="col-sm-6">
												<input type="password" id="form-field-2" name="pwd" class="col-xs-10 col-sm-12"  >
											</div>
										</div>
										<div class="form-group" style="margin-top: 16px; display :none">
											<label class="col-sm-3 control-label no-padding-right" for="form-field-1">邮箱</label>
											<div class="col-sm-6">
												<input type="text" id="form-field-3" name="email" class="col-xs-10 col-sm-12"  >
											</div>
										</div>
										
										<div class="form-group" style="margin-top: 16px;">
											<label class="col-sm-3 control-label no-padding-right" for="form-field-1">年龄</label>
											<div class="col-sm-6">
												<input type="text" id="form-field-4" name="age" class="col-xs-10 col-sm-12"  >
											</div>
										</div>
										<div class="form-group" style="margin-top: 16px;">
											<label class="col-sm-3 control-label no-padding-right" for="form-field-1">个人简介</label>
											<div class="col-sm-8">
												<textarea class="form-control limited " id="form-field-14" name="Introduction" maxlength="500"></textarea>
											</div>
										</div>
										
										<div class="form-group" style="margin-top: 16px;">
											<label class="col-sm-3 control-label no-padding-right" for="form-field-1">性别</label>
											<div class="col-sm-9" >
											<div >
											<input type = "radio" name = "sex" id = "sex0" value = "0" checked  = "true"/><label for = "sex0">男</label><br/>
											<input type = "radio" name = "sex" id = "sex1" value = "1"/><label for = "sex1">女</label><br/>
											</div>
<!-- 											<small id ="role_info" class="help-block" style="color: #d16e6c; display: none" >至少选择一个角色</small> -->
											</div>
											
										</div>
										
										<div class="form-group" style="margin-top: 16px;" id ="role_cloud">
											<label class="col-sm-3 control-label no-padding-right" for="form-field-1">角色</label>
											<div class="col-sm-9" >
											<div id= "role_set">
											</div>
											<small id ="role_info" class="help-block" style="color: #d16e6c; display: none" >至少选择一个角色</small>
											</div>
											
										</div>
										<div class="form-group" style="margin-top: 16px; display:none" id ="role_cloud_edit">
											<label class="col-sm-3 control-label no-padding-right" for="form-field-1">角色</label>
											<div class="col-sm-8">
												<input type="text" readonly ="readonly" id="role_cloud_edit_label" name="role_cloud_edit_label" class="col-xs-10 col-sm-12"  >
											</div>
											
										</div>
										
										<div class="col-md-offset-1 col-md-9">
											<button class="btn btn-info" type="button" id="save">
												<i class="ace-icon fa fa-check bigger-110"></i> 确定添加
											</button>
											&nbsp; &nbsp; &nbsp;
											<button class="btn" type="reset" id="back">
												<i class="ace-icon fa fa-undo bigger-110"></i> 返 回
											</button>
										</div>
									</form>
								</div>
							</div>
						</div>
						<!-- PAGE CONTENT ENDS -->
					</div>
					<!-- /.col -->
			</div>
			<!-- /.page-content-area -->
		</div>
		<!-- /.page-content -->
	</div>
<script type="text/javascript">
var id = '<%=id %>';
// alert(id  +' ___  ' +(id != 'null'));
// alert(typeof(id)=="null");
// alert(id=="null");
var current_roleid ;
if(id != 'null'){
	var params = {};
	params['id'] = id;
			$.ajax({
 			contentType : 'application/json; charset=utf-8',
 			url : "../user/selectOne.do",
 			type : "post",
 			dataType : "json",
 			async:false,
 			data : JSON.stringify(params),
 			success : function(data) {
 				$("#form-field-1").val(data.username);
 				$("#form-field-3").val(data.email);
 				$("#form-field-4").val(data.age);
 				$("#form-field-11").val(data.realname);
 				$("#form-field-12").val(data.address);
 				$("#form-field-13").val(data.idcard);
 				$("#form-field-14").val(data.Introduction);
 				$("#pwd_cloud").hide();
 				$("#role_cloud").hide();
 				$("#role_cloud_edit").show();
 				$("#role_cloud_edit_label").val(data.role_name);
 				if(data.sex == 0){
	 				$("#sex0").attr("checked","checked");
 				}else{
 					$("#sex1").attr("checked","checked");
 				}
 				current_roleid=data.role_id;
 			}
 		});
}


$.sunny.ajax({
	contentType : 'application/json; charset=utf-8',
	url : "../role/getAllRole.do",
	type : "post",
	dataType : "json",
	data : JSON.stringify(params),
	success : function(data) {
		$.each(data.data,function(i,n){
// 			alert( current_roleid + '  ' +i.id );
// 			alert( );
			var chk = current_roleid == n.id ? ' checked = "checked" ':'';
			if(n.id != 1)
			$("#role_set").append('<input checked  = "true" type = "radio" name = "roles" id = "role_'+n.id+'" value = "'+n.id+'"  '+ chk +' /><label for = "role_'+n.id+'">'+n.role_name+'('+n.role_info+')</label><br/>');
		})
	}
});

//保存
$("#save").click(function() {
	$("#role_info").hide();
	if (!$("#form").data('bootstrapValidator').validate().isValid()) {
		return false;
	}
	var params = {};
	var url = "../user/add.do";
	if(id != 'null'){
		url = "../user/update.do";
		params['id'] = id;
	}
	
	params['age'] = $("#form-field-4").val();
	
	params['name'] = $("#form-field-1").val();
	params['email'] = $("#form-field-3").val();
	if(id != 'null'){
		
	}else{
		params['password'] = $("#form-field-2").val();
	}
	
	params['realname'] = $("#form-field-11").val();
	params['address'] = $("#form-field-12").val();
	params['idcard'] = $("#form-field-13").val();
	params['Introduction'] = $("#form-field-14").val();
	
	var chk_value_sex =[]; 
	$('input[name="sex"]:checked').each(function(){ 
		params['sex'] = $(this).val(); 
	}); 
	
	if(id != 'null'){
		
	}else{
		var chk_value =[]; 
		$('input[name="roles"]:checked').each(function(){ 
		  chk_value.push($(this).val()); 
		}); 
		if(chk_value.length==0 ){
			
			$("#role_info").show();
			
			return false;
		}else{
			params['role'] = chk_value;
		}
	}
	
	
	
	$.sunny.ajax({
			contentType : 'application/json; charset=utf-8',
			url : url,
			type : "post",
			dataType : "json",
			params : params,
			success : function(data) {
				window.location.href = '<%=path%>/user/index.html';
			}
		});
});

$("#back").click(function() {
	window.location.href = '<%=path%>/user/index.html';
});


var dataTables;
jQuery(function($) {
	$('#form')
			.bootstrapValidator(
					{
						message : 'This value is not valid',
						feedbackIcons : {
							valid : 'glyphicon glyphicon-ok',
							invalid : 'glyphicon glyphicon-remove',
							validating : 'glyphicon glyphicon-refresh'
						},
						fields : {
							//添加考勤地点
							age : {
								validators : {
									notEmpty : {
										message : '年龄不能为空'
									},
									regexp : {
										regexp : /^([0-9]{1,3})$/,
										message : '请填写3位以内数字'
									}
								}
							},
							name : {
								validators : {
									notEmpty : {
										message : '用户名（电话号）不能为空'
									},
									regexp : {
										regexp : /^([0-9a-zA-Z]{1,11})$/,
										message : '请填写11位以内字符'
									}
								}
							},
							password : {
								validators : {
									notEmpty : {
										message : '密码不能为空'
									},
									regexp : {
										regexp : /^([0-9a-zA-Z]{1,10})$/,
										message : '请填写10位以内字符(只能是数字及大小写字母)'
									}
								}
							},
							realname : {
								validators : {
									notEmpty : {
										message : '真实不能为空'
									},
									regexp : {
										regexp : /^([a-zA-Z0-9\u4e00-\u9fa5]{1,10})$/,
										message : '请填写正确姓名（10个汉字以内）'
									}
								}
							},
							address : {
								validators : {
									notEmpty : {
										message : '地址不能为空'
									},
									regexp : {
										regexp : /^([0-9a-zA-Z\u4e00-\u9fa5]{1,50})$/,
										message : '请填写50位以内字符'
									}
								}
							},
							idcard_au : {
								validators : {
									notEmpty : {
										message : '身份证号不能为空'
									},
									regexp : {
										regexp : /^([0-9Xx]{1,21})$/,
										message : '请填写正确身份证号'
									}
								}
							},
							
						}
					});
});
	</script>	