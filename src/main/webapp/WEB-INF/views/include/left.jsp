<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% String path = request.getContextPath();%>
<% String itemId = request.getParameter("itemId"); %>
<% String parentId = request.getParameter("parentId"); %>
<% boolean parent=true; %>
<% if(itemId==null){ itemId="";} if(parentId==null){ parent=false;}%>
<div id="sidebar" class="sidebar                  responsive">
				<script type="text/javascript">
					try {
						ace.settings.check('sidebar', 'fixed')
					} catch (e) {}
				</script>

				<div class="sidebar-shortcuts" id="sidebar-shortcuts" style="display: none">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						<button class="btn btn-success">
							<i class="ace-icon fa fa-signal"></i>
						</button>

						<button class="btn btn-info">
							<i class="ace-icon fa fa-pencil"></i>
						</button>

						<!-- #section:basics/sidebar.layout.shortcuts -->
						<button class="btn btn-warning">
							<i class="ace-icon fa fa-users"></i>
						</button>

						<button class="btn btn-danger">
							<i class="ace-icon fa fa-cogs"></i>
						</button>

						<!-- /section:basics/sidebar.layout.shortcuts -->
					</div>

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>

						<span class="btn btn-info"></span>

						<span class="btn btn-warning"></span>

						<span class="btn btn-danger"></span>
					</div>
				</div>
				<!-- /.sidebar-shortcuts -->

				<div id="menu">
		        <ul id="baseMenu" class="nav nav-list"></ul>
	            </div>
				<!-- /.nav-list -->

				<!-- #section:basics/sidebar.layout.minimize -->
				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>

				<!-- /section:basics/sidebar.layout.minimize -->
				<script type="text/javascript">
					try {
						ace.settings.check('sidebar', 'collapsed')
					} catch (e) {}
				</script>
			
			<script type="text/javascript">
	          $(document).ready(function() {
	        	var params = {};
	  			params['type'] = '1';
	  			params['action_level'] = '1';
	  			$.sunny.ajax({
	  				  url: '<%=path%>/user/getUserMenu.do',
	  				  type:"post",
	  				  dataType:"json",
	  				  params:params,
	  				  success:function(menuData){
	  					$("#menu").menu({data: menuData.data_list, ulId:"baseMenu", itemId:'<%=itemId%>', foder:<%=parent%>});
	  				  }
	  			});
	});

	</script>
