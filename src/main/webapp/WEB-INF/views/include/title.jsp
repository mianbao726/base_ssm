<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String link1 = request.getParameter("link1");
%>
<%
	String link2 = request.getParameter("link2");
%>
<div class="breadcrumbs" id="breadcrumbs">
	<script type="text/javascript">
		try {
			ace.settings.check('breadcrumbs', 'fixed')
		} catch (e) {
		}
	</script>

	<ul class="breadcrumb">
		<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">首页</a></li>
		<%
			if (link1 != null && !link1.equals("")) {
		%>
		<li><%=link1%></li>
		<%
			}
			if (link2 != null && !link2.equals("")) {
		%>
		<li><%=link2%></li>

		<%
			}
		%>
	</ul>
	<!-- /.breadcrumb -->

	<!-- #section:basics/content.searchbox -->
	<div class="nav-search" id="nav-search"></div>
	<!-- /.nav-search -->

	<!-- /section:basics/content.searchbox -->
</div>




