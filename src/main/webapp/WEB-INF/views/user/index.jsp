<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%	String path = request.getContextPath();%> 
<%	String itemId = request.getAttribute("item_id")+"";%>
<%	String parentId = request.getAttribute("item_pid")+"";%> 

<jsp:include page="../include/head.jsp" flush="true">
<jsp:param name="itemId" value="<%=itemId%>" />
<jsp:param name="parentId" value="<%=parentId%>" />
<jsp:param name="title" value="人员管理" />
<jsp:param name="link1" value="人员管理" />
<jsp:param name="link2" value="" /> 
</jsp:include>
<div class="main-content">
	<div class="page-content">
		<div class="page-content-area">
			<div class="row">
				<div class="col-sm-12">
					<table id="example" class="table table-striped table-bordered table-hover dataTable" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th style="width: 200px;">用户名</th>
								<th>邮箱</th>
								<th>注册时间</th>
								<th>年龄</th>
								<th style="width: 120px;">操作</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	var d_operate = "insert";
	
	var dataTables;
	/***新增人员页面跳转***/
	$("#addRole").click(function(){
// 		window.location.href="addRole.jsp?operate="+operate;
		window.location.href = '<%=path%>/zk/role_au.action';
	});
	$("#leadingInUser").click(function(){
		window.location.href="leadingInUser.jsp";
	});
	$(function(){				
		/***dataTables开始***/
		dataTables =  $('#example').DataTable({
	        	"language": {
					"info" : "&nbsp;",
	                "paginate": {
	                    "sFirst": "首页",
	                    "sPrevious": " &laquo; ",
	                    "sNext": " &raquo;",
	                    "sLast": " 尾页 "
	                },
	                "emptyTable": "没有符合条件的记录!",
	                "lengthMenu": "显示 _MENU_ 条",
	                "sZeroRecords":"没有找到匹配的记录",
	                "sInfoEmpty":""
	            },
	            "pagingType": "full_numbers",//用于指定分页器风格 "full_numbers"" or ""two_button""， default ""two_button""
	            "bAutoWidth": false,			 //是否主动策画表格各列宽度
	            "ajax": {
	                "url": '<%=path%>/user/index.do',
	                "type": "POST",
	                "dataType": "json"
	            },
	            "processing" : true,
				"serverSide" : true,
				"bLengthChange" : false,
				"bSort" : false, // 排序功能
				"searching" : false,
	            "dom": '<"top">t<"bottom"lip><"clear">',
	            "order": [[0, 'asc']],
	            "columns": [
	                        {"data":"username"},
	                        {"data":"email"},
							{"data":"create_at"},
							{"data":"age"},
	                       ],
                 "columnDefs": [
					{
					    "render": function(data, type, row){
					    	if (row.age == '') {
					    		return '<span class="badge badge-info">暂未填写</span>'; 
							}else {
								return row.age; 	
							}                        	 
					    },
					    "orderable": false,
					    "targets": 3
					},
                    {
                     "render": function(data, type, row){
               			 return '<input class="btn btn-xs btn-success" type="button" value="编辑" onclick="updateRole(\''+row.id+'\')">&nbsp;<input class="btn btn-xs btn-danger" type="button" value="删除" onclick="delRole(\''+row.id+'\')">'                        	 
                     },
                     "orderable": false,
                     "targets": 4
                 }]
	        } );
			dataTables.on('draw.dt',function(){  
		    });
			//全选
			$('table th input:checkbox').on('click' , function(){
				var that = this;
				$(this).closest('table').find('tr > td:first-child input:checkbox')
				.each(function(){
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});				
			});
			/***删除用户***/
			$("#delete").click(function(){
				var data = dataTables.rows('.selected').data();
				var ids=new Array();
		    	var i=0;
		        $('input[name="cbSingle"]:checked').each(function(){
		            var cbSingles=$(this).val();
		           	ids[i] = cbSingles;
		           	i = i+1;
		        });
		        if("" == ids){
		        	$.sunny.alert('提示信息','请选择需要删除的选项！');
		        	return;
		        }
				var params = {ids: ids};
				$.sunny.confirm("确定删除当前"+ids.length+"条记录?", function(result) {
					if(result) {
						$.sunny.ajax({
							  url: "../../base/delUser.do",
							  type:"post",
							  dataType:"json",
							  params:params,
							  success:function(menuData){
								  //重新加载表格
								  dataTables.ajax.reloadData({'filter':null});
							  }
								  
						});
					}

				});

			});
			
			/***查询用户***/
			$("#serach").click(function(){
				var username = $("#username").val();
				var filter = [];
				if(username!=""){
		        	var c = {};        	
		        	c.key = 'a.username';
		        	c.mode = "%",
		        	c.value = username;
		        	filter.push(c);
				}
	        	dataTables.ajax.reloadData({'filter':filter});				
				
			})
			


		/***获取上级部门列表select***/
		
		var operate = "insert";
		/***新增部门开始***/
		$( "#addDept" ).click(function(){
			var params = {};
			params['department_name'] = $("#department_name").val();
			params['pid'] = $("#pid").eq(0).find("option:selected").val();
			params['company_id'] = '1';
			params['level'] = $("#pid").eq(0).find("option:selected").prop('class');	
			var url = "../../base/addDept.do";
			if(d_operate == "update"){
				if($("#pid").eq(0).find("option:selected").val() == $("#department_id").val()){
					$.sunny.alert('提示信息','不可选择本部门！');
					return false;	
				}
				params['id'] = $("#department_id").val();			
				url = "../../base/updateDept.do";
			}
			if($("#department_name").val()==""){
				$.sunny.alert('提示信息','部门名称不可以为空');
				return false;
			}
			$.sunny.ajax({
				  url: url,
				  type:"post",
				  dataType:"json",
				  params:params,
				  success:function(data){
						$.sunny.alert('提示信息','保存成功');
						$('#myModal').modal('hide');
						$.fn.zTree.init($("#tree"), setting);
						cancel();
				  }
			});
		})
		/*********************************************机构zTree树列表开始*******************************************************/
	    function addHoverDom(treeId, treeNode) {
	        var sObj = $("#" + treeNode.tId + "_span");
	        if (treeNode.editNameFlag || $("#removeBtn_"+treeNode.tId).length>0) return;
	        var addStr = "<span class='button remove' id='removeBtn_" + treeNode.tId+ "' title='add node' onfocus='this.blur();'></span>";
	
// 	        addStr += "<span class='button add' id='addBtn_" + treeNode.tId + "'></span>";
	        addStr += "<span class='button edit' id='editBtn_" + treeNode.tId + "'></span>";
	        sObj.after(addStr);
	        //修改部门
	        var editBtn = $("#editBtn_"+treeNode.tId);
	        if (editBtn) editBtn.bind("click", function(){
	        	$("#department_name").val(treeNode.department_name);
	        	var select = $("select[name=pid] option");
	        	$.each(select,function(i,n){
	        		if($(n).val()==treeNode.pid){
	        			$(n).prop("selected", "selected");
	        		}
	        	})
	        	d_operate = "update";
	        	$("#department_id").val(treeNode.id);
	        	$('#myModal').modal('show');
	            return false;
	        });
	        //删除部门
	        var removeBtn = $("#removeBtn_"+treeNode.tId);
	        if (removeBtn) removeBtn.bind("click", function(){
	        	if(treeNode.children==undefined){
		    		$.sunny.confirm("确定删除'"+treeNode.department_name+"'部门吗?", function(result) {
		    			if(result) {
			    				var ids = [];		
			    				ids.push(treeNode.id);	
			    				var params = {ids: ids};
			    				var filter = [];
			    				var a = {};        	
					        	a.key = 'b.department_id';
					        	a.value = treeNode.id;
					        	filter.push(a);
					        	var params1 = {filter: filter};
			    				$.sunny.ajax({
			    					  url: "../../base/getUserPageList.do",
			    					  type:"post",
			    					  dataType:"json",
			    					  params:params1,
			    					  async: false,
			    					  success:function(data){
			    						  if(data.data.length == 0){
		   							  		  $.sunny.ajax({
					    					  url: "../../base/delDept.do",
					    					  type:"post",
					    					  dataType:"json",
					    					  params:params,
					    					  success:function(menuData){
					    						  $.fn.zTree.init($("#tree"), setting);
					    					  }
						    				  });	  
			    						  }else{
			    							  $.sunny.alert('提示信息','存在员工，不可以删除!');
			    						  }
			    					  }
			    				});
		    			}
		    		});
	        	}else{
					$.sunny.alert('提示信息','存在子机构,不可以删除');
				}

	        });
	    };
	
	    function removeHoverDom(treeId, treeNode) {
	        $("#addBtn_"+treeNode.tId).unbind().remove();
	        $("#removeBtn_"+treeNode.tId).unbind().remove();
	        $("#editBtn_"+treeNode.tId).unbind().remove();
	    };
  		var setting = {
  				async: {
  					enable: true,
  					type: "post",
  					url:"../../base/getDeptForCompany.do",
  					dataFilter: ajaxDataFilter
  				},
  				view: {
  		            addHoverDom: addHoverDom,
  		            removeHoverDom: removeHoverDom,
  		            dblClickExpand: false,
  		            showLine: true,
  		            selectedMulti: false
  		        },
  				data: {
  					key: {
  						name:"department_name"
  					},
  					simpleData: {
  						idKey: "id",
  						pIdKey: "pid",
  						enable: true
  					}
  				},
  				callback: {
  					onClick:showMsg,
  					onAsyncSuccess: zTreeOnAsyncSuccess
  				}
  		};

        function ajaxDataFilter(treeId, parentNode, responseData){
    		return responseData.data_list;
    	
    	}
        function zTreeOnAsyncSuccess(){
            var treeObj = $.fn.zTree.getZTreeObj("tree");
            var node = treeObj.getNodeByTId('1');
            if (node != null) {
            	treeObj.selectNode(node);
            	treeObj.expandNode(node, true, false, true);
            }
        }
    	function showMsg(event, treeId, treeNode, clickFlag) { 
    		var filter = [];
//     		if(treeNode.pid!=null){
            	var c = {};        	
            	c.key = 'b.department_id';
            	c.value = treeNode.id;
            	filter.push(c);	
//     		}
        	dataTables.ajax.reloadData({'filter':filter});
    	}

	})
	//用户(停用/启用)
	function updateUserStatus(user_id,is_available){
		var ids = [];		
		ids.push(user_id);	
		var params = {ids: ids};
		var message = "";
		if(is_available=="0"){
			message = "停用";
			is_available = "1";
		}else{
			message = "启用";
			is_available = "0";
		}
		params['is_available'] = is_available;
		$.sunny.confirm("确定"+message+"当前"+ids.length+"条记录?", function(result) {
			if(result) {
				$.sunny.ajax({
					  url: "../base/updateUserStatus.do",
					  type:"post",
					  dataType:"json",
					  params:params,
					  success:function(menuData){
						  dataTables.ajax.reloadData({'filter':null});
					  }
						  
				});	
			}

		});
				
	}
	
	function updateUserBind(user_id,is_bind){
		var params = {};
		var message = "";
		if(is_bind=="0"){
			message = "与设备绑定";
			is_bind = "1";
		}else{
			message = "与设备解绑";
			is_bind = "0";
		}
		params['user_id'] = user_id;
		params['is_bind'] = is_bind;
		$.sunny.confirm("确定当前用户"+message+"?", function(result) {
			if(result) {
				$.sunny.ajax({
					  url: "../base/updateUserBind.do",
					  type:"post",
					  dataType:"json",
					  params:params,
					  success:function(menuData){
						  dataTables.ajax.reloadData({'filter':null});
					  }
						  
				});	
			}

		});
	}
	function delUser(user_id){
		var ids = [];		
		ids.push(user_id);	
		var params = {ids: ids};
		$.sunny.confirm("确定删除当前"+ids.length+"条记录?", function(result) {
			if(result) {
				$.sunny.ajax({
					  url: "../base/delUser.do",
					  type:"post",
					  dataType:"json",
					  params:params,
					  success:function(menuData){
						  dataTables.ajax.reloadData({'filter':null});
					  }
						  
				});
			}

		});

	}
	function updateRole(id){
// 		window.location.href="ADDROLE.jsp?operate="+operate+"&id="+id;
		window.location.href = '<%=path%>/user/au.html?id='+id;
	}
	/*******刪除******/
	function delRole(id){
		var params = {id: id};
		$.sunny.confirm("确定删除当前条记录? ", function(result) {
			if(result) {
				$.sunny.ajax({
					  url: '<%=path%>/user/delete.do',
					  type:"post",
					  dataType:"json",
					  params:params,
					  success:function(ret){
						  window.location.reload();
							
					  }
				});;
			}
		});
	}
	
	function cancel(){
		d_operate = "insert";
		$("#department_name").val("");
	}
	</script>	