<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%	String path = request.getContextPath();%> 
<%	String itemId = request.getAttribute("item_id")+"";%>
<%	String parentId = request.getAttribute("item_pid")+"";%> 

<jsp:include page="../include/head.jsp" flush="true">
<jsp:param name="itemId" value="<%=itemId%>" />
<jsp:param name="parentId" value="<%=parentId%>" />
<jsp:param name="title" value="企业债务包管理" />
<jsp:param name="link1" value="企业债务包管理" />
<jsp:param name="link2" value="" /> 
</jsp:include>
<div class="main-content">
	<div class="page-content">
	
	<div class="tab-content">
			<div id="maintab1" class="tab-pane in active">
				<form class="form-inline well well-sm" id="form_a">
					<div>
						<div class="form-group">
							<label style="width: 100px;">债务包名称：</label>
							<div class="input-group">
								<input type="text" name="a_name" id="query001"
									style="width: 210px;">
							</div>
						</div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="form-group" style = "display : none">
							<label style="width: 100px;">证件号码：</label>
							<div class="input-group">
								<input type="text" id="a_idCard" name="query002"
									style="width: 210px;">
							</div>
						</div>
					</div>
					&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
					<div>
						<button type="button" class="btn btn-sm" id="searchone">搜&nbsp;索</button>
						&nbsp;&nbsp;
						<button class="btn btn-sm btn-danger" type="reset"
							>清&nbsp;空</button>
						&nbsp;&nbsp;
					</div>
				</form>
			</div>
		<div class="page-content-area">
			<p>
				<button class="btn btn-success btn-sm" id="add">
					<i class="fa fa-plus"></i> 新增
				</button>
			</p>
			<div class="row">
				<div class="col-sm-12">
					<table id="example" class="table table-striped table-bordered table-hover dataTable" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th>债务包名称</th>
								<th>债务金额(万元)</th>
								<th>债务地址</th>
								<th style="width: 200px;">债权周期</th>
								<th style="width: 100px;">状态</th>
								<th style="width: 200px;">任务领取人</th>
								<th style="width: 130px;">操作</th>
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
	/***新增页面跳转***/
	$("#add").click(function(){
		window.location.href = '<%=path%>/debt/au3.html';
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
	                "url": '<%=path%>/debt/index3.do',
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
	                        {"data":"name"},
	                        {"data":"amount"},
							{"data":"address"},
							{"data":"status"},
							{"data":"user"},
							{"data":"status"},
							{"data":"e_date"},
	                       ],
                 "columnDefs": [
                	 {
 					    "render": function(data, type, row){
// 				    		return '<span class="badge badge-info">暂未填写</span>'; 
 					    	return row.s_date+"  ~  "+row.e_date;
 					    },
 					    "orderable": false,
 					    "targets": 3
 					},
					{
					    "render": function(data, type, row){
					    	if (row.status == 0) {
					    		return '<span class="badge badge-info">新建</span>'; 
							}else if (row.status == 1){
								return '<span class="badge badge-success">被领取</span>';
							}/* else if (row.status == 2){
								return '<span class="badge badge-info">完结</span>';
							} */                        	 
					    },
					    "orderable": false,
					    "targets": 4
					},
					{
					    "render": function(data, type, row){
					    	if (row.status == '1') {
					    		return '<span class="badge badge-success">'+row.realname+'(tel:'+row.username+')</span>'; 
							}else{
								return '<span class="badge badge-info">悬赏中</span>';
							}                     	 
					    },
					    "orderable": false,
					    "targets": 5
					},
// 					{
// 					    "render": function(data, type, row){
// 					    	 if(row.role_id == 1){
// 	                    		 return '<span class="badge badge-warning">超级管理员</span>';
// 	                    	 }else if(row.role_id != 16){
// 					    		 return '<span class="badge badge-info">审核通过(管理员无需审核)</span>';
// 					    	 }else{
// 						    	if (row.status == 0) {
// 						    		return '<span class="badge badge-danger">等待审核</span>'; 
// 								}else {
// 									return '<span class="badge badge-success">审核通过</span>'; 	
// 								}
// 					    	 }
// 					    },
// 					    "orderable": false,
// 					    "targets": 4
// 					},
                    {
                     "render": function(data, type, row){
                    	 return '<input class="btn btn-xs btn-primary" type="button" value="编辑" onclick="updateRole(\''+row.id+'\')">&nbsp;<input class="btn btn-xs btn-danger" type="button" value="删除" onclick="delRole(\''+row.id+'\')">'
               			                         	 
                     },
                     "orderable": false,
                     "targets": 6
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
		$( "#searchone" ).click(function(){
			var query001 = $("#query001").val();
// 			var a_idCard = $("#a_idCard").val();
			var filter = [];
			if (query001 != "") {
				var c = {};
				c.key = 'name';
				c.mode = "%", c.value = query001;
				filter.push(c);
			}
			dataTables.ajax.reloadData({
				'filter' : filter
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
		window.location.href = '<%=path%>/debt/au2.html?id='+id;
	}

	
	/*******刪除******/
	function delRole(id){
		var params = {id: id};
		$.sunny.confirm("确定删除当前条记录? ", function(result) {
			if(result) {
				$.sunny.ajax({
					  url: '<%=path%>/debt/delete.do',
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
	
	
	</script>	