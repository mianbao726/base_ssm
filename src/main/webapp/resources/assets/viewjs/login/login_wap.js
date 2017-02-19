jQuery(function($) {

	$('body').attr('class', 'login-layout light-login');
	$('#id-text2').attr('class', 'grey');
	$('#id-company-text').attr('class', 'blue');

	$(document).on('click', '.toolbar a[data-target]', function(e) {
		e.preventDefault();
		var target = $(this).data('target');
		$('.widget-box.visible').removeClass('visible');// hide others
		$(target).addClass('visible');// show target
	});

	$("#new_account").click(function() {
		$("#register_form").data('bootstrapValidator').resetForm();
		$("#register_form")[0].reset()
	});

	$("#now_login").click(function() {
		$("#login_form").data('bootstrapValidator').resetForm();
		$("#login_form")[0].reset()
	});
	$("#go_login").click(function() {
		$("#login_form").data('bootstrapValidator').resetForm();
		$("#login_form")[0].reset()
	});
	$("#go_reset_pwd").click(function() {
		$("#reset_pwd").data('bootstrapValidator').resetForm();
		$("#reset_pwd")[0].reset()
	});
	
	
	$.sunny.ajax({
		contentType : 'application/json; charset=utf-8',
		url : "role/getAllRole.do",
		type : "post",
		dataType : "json",
		success : function(data) {
			$.each(data.data,function(i,n){
					$("#login_as").append('<option value = "'+n.id+'">'+n.role_name+'</option>');
			})
		}
	});

	// register button
	$("#register").click(
			function() {
				if (!$("#register_form").data('bootstrapValidator').validate()
						.isValid()) {
					return false;
				}
				var params = $("#register_form").serializeObject();
				$.sunny.ajax({
					url : "user/register.do",
					type : "post",
					params : params,
					async : false,
					success : function(data) {
						if(data.status_code == 200){
							$("#go_login").click();
						}
					}
				});
				
			});
	// login button
	$("#login_btn").click(function() {
		$("#login_info").html("");
		if (!$("#login_form").data('bootstrapValidator').validate().isValid()) {
			return false;
		}
		var params = $("#login_form").serializeObject();
		$.sunny.ajax({
			url : "login.do",
			type : "post",
			params : params,
			success : function(data) {
				if(data.status_code == 200){
					window.location.href = "home/index.html";
				}else{
					$("#login_info").html(data.status_info);
					$("#login_form").data('bootstrapValidator').resetForm();
				}
			}
		});
	});

	$("#register_reset").click(function() {
		$("#register_form").data('bootstrapValidator').resetForm();
	});

	// 重置密码
	$('#reset_pwd').bootstrapValidator({
		fields : {}
	});
	// 登陆
	$('#login_form').bootstrapValidator({
		fields : {}
	});

	// 注册
	$('#register_form')
			.bootstrapValidator(
					{
						fields : {
							email : {
								validators : {
									callback : {
										message : '邮箱地址已经被注册',
										callback : function(value, validator) {
											var email = validator
													.getFieldElements('email')
													.val();
											console.log("email  :  " + email);
											if (email == "") {
												console.log("email  :  null ");
												return true;
											} else if (new RegExp(
													"[a-z0-9A-Z]{1,}[@][a-z0-9A-Z]{1,}[.][0-9a-zA-Z]{1,}")
													.test(email)) {
												console.log("email  matched ");
												return checkEmail(email);
											} else {
												console
														.log("email  : not matched ");
												return true;
											}
										}
									}
								}
							},
							username : {
								validators : {
									callback : {
										message : '用户名已经被注册',
										callback : function(value, validator) {
											var username = validator
													.getFieldElements(
															'username').val();
											if (username == "") {
												return true;
											} else if (new RegExp(
													"[a-z0-9A-Z]{5,}")
													.test(username)) {
												return checkUsername(username);
											} else {
												return true;
											}
										}
									}
								}
							}
						}
					});

	$("#bootbox-regular")
			.click(
					function() {

						bootbox
								.dialog({
									message : "<span class='bigger-110'>用户协议 <br> 1.111111111111111<br> 1.111111111111111<br> 1.111111111111111<br> 1.111111111111111<br> 1.111111111111111</span>",
									buttons : {
										"success" : {
											"label" : "<i class='ace-icon fa fa-check'></i> 同&nbsp;意！",
											"className" : "btn-sm btn-success",
											"callback" : function() {
												$("#agree").attr("checked",
														"checked");
												$("#register_form").data(
														'bootstrapValidator')
														.resetForm();
											}
										},
										"danger" : {
											"label" : "不同意",
											"className" : "btn-sm btn-danger",
											"callback" : function() {
											}
										}
									}
								});
					});

	// end
});

function checkEmail(email) {
	var flag = false;
	var params = {};
	params['email'] = email;
	$.sunny.ajax({
		url : "user/checkUniqueEmail.do",
		type : "post",
		dataType : "json",
		params : params,
		async : false,
		success : function(data) {
			flag = "200" == data.status_code ? true : false;
		}
	});
	return flag;
};

function checkUsername(username) {
	var flag = false;
	var params = {};
	params['username'] = username;
	$.sunny.ajax({
		url : "user/checkUniqueUsername.do",
		type : "post",
		dataType : "json",
		params : params,
		async : false,
		success : function(data) {
			flag = "200" == data.status_code ? true : false;
		}
	});
	return flag;
};
