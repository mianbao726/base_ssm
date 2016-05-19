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
										<!-- 打卡制度 -->
										<div class="form-group" style="margin-top: 16px;">
											<label class="col-sm-3 control-label no-padding-right" for="form-field-1">名称</label>
											<div class="col-sm-6">
												<input type="text" id="form-field-1" name="name" class="col-xs-10 col-sm-12"  readonly="readonly">
											</div>
										</div>
										<div class="form-group" style="margin-top: 16px;">
											<label class="col-sm-3 control-label no-padding-right" for="form-field-1">邮箱</label>
											<div class="col-sm-6">
												<input type="text" id="form-field-3" name="email" class="col-xs-10 col-sm-12"  readonly="readonly">
											</div>
										</div>
										
										<div class="form-group" style="margin-top: 16px;">
											<label class="col-sm-3 control-label no-padding-right" for="form-field-1">年龄</label>
											<div class="col-sm-6">
												<input type="text" id="form-field-4" name="age" class="col-xs-10 col-sm-12"  >
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
if(id != 'null'){
	var params = {};
	params['id'] = id;
			$.ajax({
 			contentType : 'application/json; charset=utf-8',
 			url : "../user/selectOne.do",
 			type : "post",
 			dataType : "json",
 			data : JSON.stringify(params),
 			success : function(data) {
 				$("#form-field-1").val(data.username);
 				$("#form-field-3").val(data.email);
 				$("#form-field-4").val(data.age);
 			}
 		});
}

//保存
$("#save").click(function() {
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
							}
							
						}
					});
});
	</script>	