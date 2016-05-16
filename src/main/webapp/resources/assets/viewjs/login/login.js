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

	// register button
	$("#register").click(
			function() {
				if (!$("#register_form").data('bootstrapValidator').validate()
						.isValid()) {
					return false;
				}
				alert("success");
			});

	$("#register_reset").click(function() {
		$("#register_form").data('bootstrapValidator').resetForm();
	});

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
											if (email == "") {
												return true;
											} else if (new RegExp(
													"[a-z0-9A-Z]{1,}[@][a-z0-9A-Z]{1,}[.][0-9a-zA-Z]{1,}")
													.test(email)) {
												return checkEmail(email);
											} else {
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

	$("#bootbox-regular").click(function() {
		
		bootbox.dialog({
			message: "<span class='bigger-110'>用户协议 <br> 1.111111111111111<br> 1.111111111111111<br> 1.111111111111111<br> 1.111111111111111<br> 1.111111111111111</span>",
			buttons: 			
			{
				"success" :
				 {
					"label" : "<i class='ace-icon fa fa-check'></i> 同&nbsp;意！",
					"className" : "btn-sm btn-success",
					"callback": function() {
						$("#agree").attr("checked" , "checked");
						$("#register_form").data('bootstrapValidator').resetForm();
					}
				},
				"danger" :
				{
					"label" : "不同意",
					"className" : "btn-sm btn-danger",
					"callback": function() {
						//Example.show("uh oh, look out!");
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
	params['user_name'] = email;
	$.ajax({
		url : "../user/checkUniqueEmail.do",
		type : "post",
		dataType : "json",
		data : params,
		async : false,
		success : function(data) {
			flag = "200" == data.code ? true : false;
		}
	})
	return flag;
};

function checkUsername(user_name) {
	var flag = false;
	var params = {};
	params['user_name'] = user_name;
	$.ajax({
		url : "../user/checkUniqueUsername.do",
		type : "post",
		dataType : "json",
		data : params,
		async : false,
		success : function(data) {
			flag = "200" == data.code ? true : false;
		}
	})
	return flag;
};
