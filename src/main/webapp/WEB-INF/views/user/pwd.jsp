<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%	String path = request.getContextPath();%> 
<%	String itemId = request.getAttribute("item_id")+"";%>
<%	String parentId = request.getAttribute("item_pid")+"";
String id = request.getParameter("id");%> 

<jsp:include page="../include/head.jsp" flush="true">
<jsp:param name="itemId" value="<%=itemId%>" />
<jsp:param name="parentId" value="<%=parentId%>" />
<jsp:param name="title" value="人员管理" />
<jsp:param name="link1" value="修改密码" />
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
											<label class="col-sm-3 control-label no-padding-right" for="formfield1">原密码</label>
											<div class="col-sm-6">
												<input type="password" id="formfield1" name="pwd" class="col-xs-10 col-sm-12"  >
											</div>
											<small id ="pwd_ori" class="help-block" style="color: #d16e6c; display:none" >原密码不正确</small>
										</div>
										<div class="form-group" style="margin-top: 16px;">
											<label class="col-sm-3 control-label no-padding-right" for="formfield2">新密码</label>
											<div class="col-sm-6">
												<input type="password" id="formfield2" name="pwd1" class="col-xs-10 col-sm-12"  >
											</div>
										</div>
										<div class="form-group" style="margin-top: 16px;">
											<label class="col-sm-3 control-label no-padding-right" for="formfield3">重复密码</label>
											<div class="col-sm-6">
												<input type="password" id="formfield3" name="pwd2" class="col-xs-10 col-sm-12"  >
											</div>
											<small id ="pwd_rep" class="help-block" style="color: #d16e6c; display:none" >两次输入的密码不一样</small>
										</div>
										
										<div class="col-md-offset-1 col-md-9">
											<button class="btn btn-info" type="button" id="save">
												<i class="ace-icon fa fa-check bigger-110"></i> 确定
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
 				$("#formfield1").val(data.username);
 				$("#formfield3").val(data.email);
 				$("#form-field-4").val(data.age);
 				current_roleid=data.role_id;
 			}
 		});
}

//保存
$("#save").click(function() {
	$("#pwd_ori").hide();
	$("#pwd_rep").hide();
	if (!$("#form").data('bootstrapValidator').validate().isValid()) {
		return false;
	}
	
	var formfield1 = $("#formfield1").val();
	var formfield2 = $("#formfield2").val();
	var formfield3 = $("#formfield3").val();
	if(formfield2 != formfield3){
		$("#pwd_rep").show();
		return;
	}
	var params = {};
	params['pwd_ori'] = $("#formfield1").val();
	params['pwd_new'] = $("#formfield2").val();
	$.ajax({
			contentType : 'application/json; charset=utf-8',
			url : "../user/editpwd.do",
			type : "post",
			dataType : "json",
 			data : JSON.stringify(params),
			success : function(data) {
				if(200!=data.status_code){
					bootbox.alert({
						buttons : {
							ok : {
								label : '关闭',
								className : 'btn-sm btn-danger'
							}
						},
						message : "密码修改失败，原密码输入错误！",
						title : "操作失败"
					});
				}else{
					$("#formfield1").val("");
					$("#formfield2").val("");
					$("#formfield3").val("");
					bootbox.alert({
						buttons : {
							ok : {
								label : '关闭',
								className : 'btn-sm btn-danger'
							}
						},
						message : "密码修改成功！",
						title : "操作成功"
					});
					
				}
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
							formfield1 : {
								validators : {
									notEmpty : {
										message : '原密码不能为空'
									},
									regexp : {
										regexp : /^([0-9a-zA-Z]{1,10})$/,
										message : '请填写10位以内字符(只能是数字及大小写字母)'
									}
								}
							},
							formfield2 : {
								validators : {
									notEmpty : {
										message : '新密码不能为空'
									},
									regexp : {
										regexp : /^([0-9a-zA-Z]{1,10})$/,
										message : '请填写10位以内字符(只能是数字及大小写字母)'
									}
								}
							},
							formfield3 : {
								validators : {
									notEmpty : {
										message : '重复密码不能为空'
									},
									regexp : {
										regexp : /^([0-9a-zA-Z]{1,10})$/,
										message : '请填写10位以内字符(只能是数字及大小写字母)'
									}
								}
							},
							
						}
					});
});
	</script>	