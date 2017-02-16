<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%	String path = request.getContextPath();%> 
<%	String itemId = request.getAttribute("item_id")+"";%>
<%	String parentId = request.getAttribute("item_pid")+"";
String id = request.getParameter("id");%> 

<jsp:include page="../include/head.jsp" flush="true">
<jsp:param name="itemId" value="<%=itemId%>" />
<jsp:param name="parentId" value="<%=parentId%>" />
<jsp:param name="title" value="债务包管理" />
<jsp:param name="link1" value="债务包管理" />
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
											<label class="col-sm-3 control-label no-padding-right" for="form-field-1">债务包名称</label>
											<div class="col-sm-8">
												<input type="text" id="form-field-1" name="name" class="col-xs-10 col-sm-12"  >
											</div>
										</div>
										<div class="form-group" style="margin-top: 16px;">
											<label class="col-sm-3 control-label no-padding-right" for="form-field-2">债务包金额</label>
											<div class="col-sm-8">
												<input type="text" id="form-field-2" name="amount" class="col-xs-10 col-sm-12"  >
											</div>
										</div>
										<div class="form-group" style="margin-top: 16px;">
											<label class="col-sm-3 control-label no-padding-right" for="form-field-3">债务包地址</label>
											<div class="col-sm-8">
												<input type="text" id="form-field-3" name="address" class="col-xs-10 col-sm-12"  >
											</div>
										</div>
										<div class="form-group" style="margin-top: 16px;">
											<label class="col-sm-3 control-label no-padding-right" for="form-field-4">债务周期</label>
											<div class="col-sm-8">
												<div class="input-daterange input-group">
													<input type="text" id="form-field-4" class="input-sm form-control form_date" name="start"  readonly = "readonly"/>
													<span class="input-group-addon"> <i
														class="fa fa-exchange"></i>
													</span> <input type="text" id="form-field-5"  class="input-sm form-control form_date" name="end"    readonly = "readonly"/>
												</div>
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
 			url : "../debt/selectOne.do",
 			type : "post",
 			dataType : "json",
 			async:false,
 			data : JSON.stringify(params),
 			success : function(data) {
 				$("#form-field-1").val(data.name);
 				$("#form-field-2").val(data.amount);
 				$("#form-field-3").val(data.address);
 				$("#form-field-4").val(data.s_date);
 				$("#form-field-5").val(data.e_date);
 			}
 		});
}
	
// 	$('.form_date').datetimepicker({
//         language:  'zh-CN',
//         weekStart: 1,
//         todayBtn:  1,
// 		autoclose: 1,
// 		todayHighlight: 1,
// 		startView: 2,
// 		minView: 2,
// 		forceParse: 0
//     });
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
	if (!$("#form").data('bootstrapValidator').validate().isValid()) {
		return false;
	}
	var params = {};
	var url = "../debt/add.do";
	if(id != 'null'){
		url = "../debt/update.do";
		params['id'] = id;
	}
	
	params['name'] = $("#form-field-1").val();
	params['amount'] = $("#form-field-2").val();
	params['address'] = $("#form-field-3").val();
	params['start'] = $("#form-field-4").val();
	params['end'] = $("#form-field-5").val();
	$.sunny.ajax({
			contentType : 'application/json; charset=utf-8',
			url : url,
			type : "post",
			dataType : "json",
			params : params,
			success : function(data) {
				window.location.href = '<%=path%>/debt/index_1.html';
			}
		});
});

$("#back").click(function() {
	window.location.href = '<%=path%>/debt/index_1.html';
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
							name : {
								validators: {
									stringLength: {
				                        min: 1,
				                        max: 30,
				                        message: '债务包名称在1-30之间'
				                    },
				                    notEmpty: {
				                        message: '债务包名称不能为空'
				                    }
				                }
							},
							amount : {
								validators : {
									notEmpty : {
										message : '债务金额不能为空'
									},
									regexp : {
										regexp : /^([0-9]{1,20})$/,
										message : '请填写20位以内数字'
									}
								}
							},
							address : {
								validators : {
									notEmpty : {
										message : '地址不能为空'
									},
									stringLength: {
				                        min: 1,
				                        max: 50,
				                        message: '地址在1-50之间'
				                    },
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