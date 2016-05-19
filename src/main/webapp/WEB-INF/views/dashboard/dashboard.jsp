<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%	String path = request.getContextPath();%> 
<%	String itemId = request.getAttribute("item_id")+"";%>
<%	String parentId = request.getAttribute("item_pid")+"";%> 

<jsp:include page="../include/head.jsp" flush="true">
<jsp:param name="itemId" value="<%=itemId%>" />
<jsp:param name="parentId" value="<%=parentId%>" />
<jsp:param name="title" value="欢迎登陆" />
<jsp:param name="link1" value="欢迎登陆" />
<jsp:param name="link2" value="" /> 
</jsp:include>
<div class="main-content">
	welcome ！！  这里是系统默认主页！！
</div>
<script type="text/javascript">
</script>	