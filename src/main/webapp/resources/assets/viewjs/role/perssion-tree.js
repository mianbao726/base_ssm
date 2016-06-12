$(function() {
	function addHoverDom(treeId, treeNode) {
		var sObj = $("#" + treeNode.tId + "_span");
		if (treeNode.editNameFlag || $("#removeBtn_" + treeNode.tId).length > 0)
			return;
		var addStr = "<span class='button remove' id='removeBtn_"
				+ treeNode.tId
				+ "' title='删除' onfocus='this.blur();'></span>";

		addStr += "<span class='button add' id='addBtn_" + treeNode.tId
				+ "'></span>";
		addStr += "<span class='button edit' id='editBtn_" + treeNode.tId
				+ "'></span>";
		sObj.after(addStr);
		// 修改部门
		var editBtn = $("#editBtn_" + treeNode.tId);
		if (editBtn){
			editBtn.bind("click", function() {
				var params = {};
				params['id'] = treeNode.id;
				$("#au_flag").val("1");
				$.sunny.ajax({
					url : current_path+"/role/getPermissonInfo.do",
					type : "post",
					dataType : "json",
					params : params,
					async : false,
					success : function(data) {
						clearHintInfo();
						add_new_permission();
						$("#now_editing").html(
								"正在修改<b>&nbsp;<" + treeNode.action_name + ">&nbsp;</b>权限");
						$("#now_editing_root").html(
								"正在修改<b>&nbsp;<" + treeNode.action_name + ">&nbsp;</b>根菜单");

						$("#gloable_pid").val(treeNode.id);

						$("#w_action_name").val(data.obj.action_name);
						$("#w_action_url").val(data.obj.action_url);
						$("#w_sort_num").val(data.obj.sort_num);
						$("#w_help").val(data.obj.help);
						$("#w_action_pic").val(data.obj.action_pic);

						$("#edit_current_action_id").val(data.obj.id);

						$("#preview_logo").removeClass();
						$("#preview_logo").addClass("menu-icon");
						$("#preview_logo").addClass("fa");
						$("#preview_logo").addClass(
						$("#w_action_pic option:selected").text());

						$("#resource_type").hide();
						
						if (data.obj.action_level == "1" && data.obj.pid == 0) {
							current_level= 0;
							$("#type000").attr('checked', true);
						} else if (data.obj.action_level == "1" && data.obj.pid != 0) {
							current_level= 1;
							$("#type001").attr('checked', true);
						} else if (data.obj.action_level == "2") {
							current_level= 2;
							$("#type002").attr('checked', true);
						} else if (data.obj.action_level == "3") {
							current_level= 3;
							$("#type003").attr('checked', true);
						} else if (data.obj.action_level == "4") {
							current_level= 4;
							$("#type004").attr('checked', true);
						}
						// 显示隐藏相关输入框
						sh_inputs();
					}
				})
			});
		}
		// 添加子部门
		var addBtn = $("#addBtn_" + treeNode.tId);
		if (addBtn)
			addBtn.bind("click", function() {
				current_level= -1;
				clearHintInfo();
				$("#resource_type").show();
				add_new_permission();
				$("#au_flag").val("0");
				$("#now_editing").html(
						"正在为<b>&nbsp;<" + treeNode.action_name
								+ ">&nbsp;</b>添加");
				$("#now_editing_root").html(
						"正在为<b>&nbsp;<" + treeNode.action_name + ">&nbsp;</b>添加");
				$("#gloable_pid").val(treeNode.id);
			});
			
		// 删除部门
		var removeBtn = $("#removeBtn_" + treeNode.tId);
		if (removeBtn)
			removeBtn.bind("click", function() {
				$.sunny.confirm("确定删除22'" + treeNode.action_name + "'以及子资源?",
						function(result) {
							if (result) {
								var ids = [];
								ids.push(treeNode.id);
								var params = {
									ids : ids
								};
								$.sunny.ajax({
									url : current_path+"/role/deleteModule.do",
									type : "post",
									dataType : "json",
									params : params,
									success : function(menuData) {
//										$.fn.zTree.init($("#tree"), setting);
										if((attid == '')){
											window.location.href = current_path+'/role/au.html';
										}else{
											window.location.href = current_path+'/role/au.html?id='+attid;
										}
//										$("#loading_hint").css("");// 隐藏等待提示
									}
								});
							}
						});

			});
	}
	;
	
	// 修改权限
	$("#edit_permission_sigle").click(function() {
		
		var b01 = false;

		$('#permission_name_hint').hide();

		if ('' == $('#form-field-1_1').val()) {
			b02 = true;
			$('#location_place_name_hint').show();
		}
		if ('' == $('#form-field-2').val()) {
			b03 = true;
			$('#location_valid_circle_hint').show();
		}

		if ('' == $('#place').val()) {
			b05 = true;
			$('#location_valid_place_hint').show();
		}

		if (b01 || b02 || b03 || b04 || b05) {
			return false;
		}
		$.sunny.ajax({
			url : "../../attendanceLocation/addAttendance.do",
			type : "post",
			dataType : "json",
			params : $("#form-horizontal").serializeObject(),
			success : function(menuData) {
				$("#dakapp_address").modal('hide');
				refreshLocations();
				// 清空数据
			}
		});
	});

	// 添加新权限
	function add_new_permission() {
		$("#add_new_permission").modal('show');
		$("#now_editing_root").hide();
		$("#now_editing").show();
		$("#w_action_url_grp").show();
		$("#w_action_pic_grp").hide();
		$("#now_editing_root").hide();
		$("#w_help").val("");
		$("#w_action_url").val("");
		$("#w_sort_num").val("");
		$("#w_action_name").val("");
		$("#default_type").prop("checked", "checked");
	}

	function removeHoverDom(treeId, treeNode) {
		$("#addBtn_" + treeNode.tId).unbind().remove();
		$("#removeBtn_" + treeNode.tId).unbind().remove();
		$("#editBtn_" + treeNode.tId).unbind().remove();
	}
	;
	var setting = {
		async : {
			enable : true,
			type : "post",
			dataType: "json",
			url : '../role/getWebModuleTree.do',
			autoParam : [ "id=pid" ],
			dataFilter : ajaxDataFilter,
			otherParam: ["roleid", $("#edit_current_id").val()]
		},
		check : {
			enable : true
		},
		view : {
			addHoverDom : addHoverDom,
			removeHoverDom : removeHoverDom,
			dblClickExpand : false,
			showLine : true,
			selectedMulti : true
		},
		data : {
			key : {
				name : "action_name"
			},
			simpleData : {
				idKey : "id",
				pIdKey : "pid",
				enable : true
			}
		},
		callback : {
			onClick : showMsg,
			onAsyncSuccess : zTreeOnAsyncSuccess
		}
	};
	$.fn.zTree.init($("#tree"), setting);
	function ajaxDataFilter(treeId, parentNode, responseData) {
		return responseData.data_list;

	}
	function zTreeOnAsyncSuccess() {
		$("#loading_hint").slideToggle();// 隐藏等待提示
	}
	function showMsg(event, treeId, treeNode, clickFlag) {
		var treeObj = $.fn.zTree.getZTreeObj("tree");
		var nodes = treeObj.getCheckedNodes(true);
		for (var i = 0; i < nodes.length; i++) {
			treeObj.checkNode(nodes[i], false, false);
		}
		var node = treeObj.getSelectedNodes();
		treeObj.checkNode(node[0], true, true);
	}

	// 保存
	$("#save").click(function() {
		if (!$("#form").data('bootstrapValidator').validate().isValid()) {
			return false;
		}
		var params = $("#form").serializeObject();

		var treeObj = $.fn.zTree.getZTreeObj("tree");
		var nodes = treeObj.getCheckedNodes(true);
		params['nodes'] = nodes;
		var url;
		if (addEditFlag) {// 添加
			url = "../role/addRole.do";
		} else {
			url = "../role/updateRole.do";
			params['id'] = $("#edit_current_id").val();
		}
		$.sunny.ajax({
			url : url,
			type : "post",
			dataType : "json",
			disableAll : true,
			disableHeight : document.body.scrollHeight,
			disableMsg : "保存中，请稍后!",
			params : params,
			success : function(data) {
				window.location.href = current_path+'/role/index.html';
			}
		});

	});

});

function clearHintInfo(){
	$("#w_action_name_hint").hide();
	$("#w_action_url_hint").hide();
	$("#w_sort_num_hint").hide();
}