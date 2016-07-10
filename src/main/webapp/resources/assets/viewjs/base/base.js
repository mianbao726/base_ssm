// header start
function logout() {
	window.location.href = BASE + '/login.html';
}

function goEditPWD() {
	window.location.href = BASE + '/zk/user_pwd.action';
}

$(function() {
	var params = {};
	$.sunny.ajax({
		url : BASE + '/user/getUserInfo.do',
		type : "post",
		dataType : "json",
		params : params,
		success : function(data) {
			$("#loginUser").html(data.username);
		}
	});
});

//header end