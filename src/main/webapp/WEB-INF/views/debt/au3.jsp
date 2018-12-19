<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%	String path = request.getContextPath();%> 
<%	String itemId = request.getAttribute("item_id")+"";%>
<%	String parentId = request.getAttribute("item_pid")+"";
String id = request.getParameter("id");%> 

<jsp:include page="../include/head.jsp" flush="true">
<jsp:param name="itemId" value="<%=itemId%>" />
<jsp:param name="parentId" value="<%=parentId%>" />
<jsp:param name="title" value="企业债务包管理" />
<jsp:param name="link1" value="企业债务包管理" />
<jsp:param name="link2" value="" /> 
</jsp:include>

<div class="main-content">
		<!-- /section:basics/content.breadcrumbs -->
		<div class="page-content" style="padding-left: 0px">
			<!-- #section:settings.box -->
			<div class="page-content-area">
					<div class="col-xs-12">
					<div id="result"></div>
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
												<input type="text" id="form-field-2" name="amount" class="col-xs-10 col-sm-12"  placeholder="万元">
											</div>
										</div>
										<div class="form-group" style="margin-top: 16px;">
											<label class="col-sm-3 control-label no-padding-right" for="form-field-3">债务包地址</label>
											<div class="col-sm-8">
												<input type="text" id="form-field-3" name="address" class="col-xs-10 col-sm-12"  >
											</div>
										</div>
										<div class="form-group" style="margin-top: 16px;">
											<label class="col-sm-3 control-label no-padding-right" for="form-field-113">债务详情</label>
											<div class="col-sm-8">
												<input type="text" id="form-field-113" name="detial" class="col-xs-10 col-sm-12"  >
											</div>
										</div>
										<div class="form-group" style="margin-top: 16px;">
											<label class="col-sm-3 control-label no-padding-right" for="form-field-3">所属地区</label>
											<div class="col-sm-8">
<!-- 												0沈河 1和平 2皇姑 3铁西 4大东 5东陵 6于洪 7沈北新区 8浑南新区 9苏家屯区 10其他地区 -->
												<select id = "form-field-11" name = "area" >
													<option value = "0">沈河</option>
													<option value = "1">和平</option>
													<option value = "2">皇姑</option>
													<option value = "3">铁西</option>
													<option value = "4">大东</option>
													<option value = "5">东陵</option>
													<option value = "6">于洪</option>
													<option value = "7">沈北新区</option>
													<option value = "8">浑南新区</option>
													<option value = "9">苏家屯区</option>
													<option value = "10">其他地区</option>
												</select>
											</div>
										</div>
										<div class="form-group" style="margin-top: 16px;">
											<label class="col-sm-3 control-label no-padding-right" for="form-field-3">附件</label>
											<div class="col-sm-8">
												<input type="file" id="myBlogImage" name="myfiles" onchange = "ajaxFileUpload()"/>
												<div id  = "myBlogImage_download_div" style ="display:none">
													<a href="#" id = "myBlogImage_download"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="reupload()">重新上传</a>
												</div>
											</div>
										</div>
										
										
										<div class="form-group" style="margin-top: 16px;">
											<label class="col-sm-3 control-label no-padding-right" for="form-field-4">债务周期</label>
											<div class="col-sm-9">
												<div class="input-daterange input-group">
													<input type="text" id="form-field-4" class="input-sm form-control form_date" name="start"  readonly = "readonly"/>
													<span class="input-group-addon"> <i
														class="fa fa-exchange"></i>
													</span> <input type="text" id="form-field-5"  class="input-sm form-control form_date" name="end"    readonly = "readonly"/>
												
											</div>
 											<small id ="date_hint" class="help-block" style="color: #d16e6c; display: none" >请填写完整债务日期</small> 
 											<small id ="date_hint_compare" class="help-block" style="color: #d16e6c; display: none" >债务结束日期不能早于债务开始日期</small>
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
					<!-- <input  id="pic_uuid"> -->
					<input type = "hidden" id="pic_uuid">
					<!-- /.col -->
			</div>
			<!-- /.page-content-area -->
		</div>
		<!-- /.page-content -->
	</div>
<script type="text/javascript">
function ajaxFileUpload(){
    //开始上传文件时显示一个图片,文件上传完成将图片隐藏
//     $("#loading").ajaxStart(function(){$(this).show();}).ajaxComplete(function(){$(this).hide();});
    //执行上传文件操作的函数
    $.ajaxFileUpload({
        //处理文件上传操作的服务器端地址(可以传参数,已亲测可用)
        url:'fileUpload?uuid=玄玉',
        secureuri:false,                           //是否启用安全提交,默认为false 
        fileElementId:'myBlogImage',               //文件选择框的id属性
        dataType:'json',                           //服务器返回的格式,可以是json或xml等
        success:function(data, status){            //服务器响应成功时的处理函数
        	console.log(data);
	        if(data.status_code == '200'){
	        	
	        	$("#myBlogImage").hide();
	        	$("#myBlogImage_download").html(data.filename);
	        	$("#myBlogImage_download_div").show();
	        	$("#pic_uuid").val(data.uuid);
	        }else{
	        	alert('failed!');
	        }
        },
        error:function(data, status, e){ //服务器响应失败时的处理函数
        	alert('failed!');
        }
    });
}


function reupload(){
	$("#myBlogImage").show();
	$("#myBlogImage_download").html("");
	$("#myBlogImage_download_div").hide();
	$("#pic_uuid").val("");
}


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
 				$("#form-field-113").val(data.detial);
 				var registration_datea = data.s_date.substr(0, 4);
 				var registration_dateb = data.s_date.substr(5, 2);
 				var registration_datec = data.s_date.substr(8, 2);
 				var registration_datea1 = data.e_date.substr(0, 4);
 				var registration_dateb1 = data.e_date.substr(5, 2);
 				var registration_datec1 = data.e_date.substr(8, 2);
 				$("#form-field-4").val(registration_datea + "年" + registration_dateb+ "月" + registration_datec + "日");
 				$("#form-field-5").val(registration_datea1 + "年" + registration_dateb1+ "月" + registration_datec1 + "日");
 				$("#form-field-11").val(data.area);
 				
 				if(data.filename_ori==""||data.filename_ori==null||data.filename_ori==undefined){
 					$("#myBlogImage").show();
 					$("#myBlogImage_download").html("");
 					$("#myBlogImage_download_div").hide();
 				}else{
 					$("#myBlogImage").hide();
 		        	$("#myBlogImage_download").html(data.filename_ori);
 		        	$("#myBlogImage_download_div").show();
 		        	$("#pic_uuid").val(data.pic_uuid);
 				}
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
	$("#date_hint").hide();
	$("#date_hint_compare").hide();
	
	if (!$("#form").data('bootstrapValidator').validate().isValid()) {
		return false;
	}
	var form4 = $("#form-field-4").val();
	var form5 = $("#form-field-5").val();
	if(form4==""||form4==null||form4==undefined||form5==""||form5==null||form5==undefined){
		$("#date_hint").show();
		return;
	}
	
	var registration_datea = form4.substr(0, 4);
	var registration_dateb = form4.substr(5, 2);
	var registration_datec = form4.substr(8, 2);
	var registration_datea1 = form5.substr(0, 4);
	var registration_dateb1 = form5.substr(5, 2);
	var registration_datec1 = form5.substr(8, 2);
	if(registration_datea > registration_datea1){
		$("#date_hint_compare").show();
		return;
	}else if ( registration_datea == registration_datea1 &&registration_dateb > registration_dateb1){
		$("#date_hint_compare").show();
		return;
	}else if (registration_datea == registration_datea1 &&registration_dateb == registration_dateb1 && registration_datec > registration_datec1){
		$("#date_hint_compare").show();
		return;
	}
	
	var params = {};
	var url = "../debt/add3.do";
	if(id != 'null'){
		url = "../debt/update.do";
		params['id'] = id;
	}
	
	params['name'] = $("#form-field-1").val();
	params['amount'] = $("#form-field-2").val();
	params['address'] = $("#form-field-3").val();
	params['detial'] = $("#form-field-113").val();

	params['pic_uuid'] = $("#pic_uuid").val();
	
	params['start'] = registration_datea + "-" + registration_dateb+ "-" + registration_datec + " " + "00:00:00";
	
	params['end'] = registration_datea1 + "-" + registration_dateb1+ "-" + registration_datec1 + " " + "00:00:00";
	
	params['area'] = $("#form-field-11").val();
	
	$.sunny.ajax({
			contentType : 'application/json; charset=utf-8',
			url : url,
			type : "post",
			dataType : "json",
			params : params,
			success : function(data) {
				window.location.href = '<%=path%>/debt/index_3.html';
			}
		});
});

$("#back").click(function() {
	window.location.href = '<%=path%>/debt/index_3.html';
});

$("#form-field-4").datepicker({
	autoclose : true,
	todayHighlight : true,
	language : 'zh-CN'
}).next().on(ace.click_event, function() {
	$(this).prev().focus();
});

$("#form-field-5").datepicker({
	autoclose : true,
	todayHighlight : true,
	language : 'zh-CN'
})
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