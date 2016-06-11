//资源类型的改变对页面的调整
function sh_inputs() {
	var val;
	if(-1 == current_level){//add
		val = $("input[name='w_action_level']:checked").val();
	}else{//edit
		val = current_level;
	}
	
//	var val = current_level;
	$("#w_action_url_grp").show();
	$("#w_action_pic_grp").show();
	$("#now_editing_root").hide();
	$("#now_editing").show();
	if (0 == val) {// 根菜单
		$("#now_editing_root").show();
		$("#now_editing").hide();
		$("#w_action_url_grp").hide();
	} else if (1 == val) {// 子菜单
		$("#w_action_pic_grp").hide();
	} else if (2 == val) {// 按钮类型
		$("#w_action_url_grp").hide();
		$("#w_action_pic_grp").hide();
	} else {// 请求 || 移动端
		$("#w_action_pic_grp").hide();
	}
}
// 添加权限的check
function a_check() {
	var bool01 = false, bool02 = false,bool03 = false;
	$("#w_action_name_hint").hide();
	$("#w_action_url_hint").hide();
	$("#w_sort_num_hint").hide();
	if ("" == $("#w_action_name").val()) {
		$("#w_action_name_hint").show();
		bool01 = true;
	}
//	var val = $("input[name='w_action_level']:checked").val();
	
	var val;
	if(-1 == current_level){//add
		val = $("input[name='w_action_level']:checked").val();
	}else{//edit
		val = current_level;
	}
	if (1 == val || 3 == val || 4 == val) {// 根菜单
		if ("" == $("#w_action_url").val()) {
			bool02 = true;
			$("#w_action_url_hint").show();
		}
	}
	
	var str=/^([0-9]\d{0,})$/;
	var r =$("#w_sort_num").val().match(str);
	if(null==r){
		$("#w_sort_num_hint").show();
		bool03 = true;
	}
	if (bool01 || bool02 || bool03) {
		return true;
	} else {
		return false;
	}
}
// 保存权限
function save_permissoin() {
	if (!a_check()) {
		var params = $("#from_permission").serializeObject();
		params['pid'] = $("#gloable_pid").val();
		var url = current_path+"/role/addModule.do";//添加url
		if('1' == $("#au_flag").val()){//修改url
			url = current_path+"/role/updateModule.do";
			params['id'] = $('#edit_current_action_id').val();
		}
		$.sunny.ajax({
			url : url,
			type : "post",
			dataType : "json",
			params : params,
			success : function(data) {
				$("#add_new_permission").modal('hide');
				var id = $("#edit_current_id").val();
				if((attid == '')){
					window.location.href = current_path+'/role/au.html';
				}else{
					window.location.href = current_path+'/role/au.html?id='+attid;
				}
				
			}
		});
	}
}
$('#w_action_pic').change(function(){
	$("#preview_logo").removeClass();
	$("#preview_logo").addClass("menu-icon");
	$("#preview_logo").addClass("fa");
	$("#preview_logo").addClass($("#w_action_pic option:selected").text());
});