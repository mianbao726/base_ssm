<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<meta name="description" content="overview &amp; stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/ux/ace/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/ux/ace/css/font-awesome.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/ux/ace/css/ui.jqgrid.css" />
<!-- text fonts -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/ux/ace/css/ace-fonts.css" />

<!-- ace styles -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/ux/ace/css/ace.min.css" id="main-ace-style" />

<!--[if lte IE 9]>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/ux/ace/css/ace-part2.min.css" />
<![endif]-->

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/ux/ace/css/ace-skins.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/ux/ace/css/ace-rtl.min.css" />

<!--[if lte IE 9]>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/ux/ace/css/ace-ie.min.css" />
<![endif]-->

<!-- inline styles related to this page -->

<!-- basic scripts -->

<!-- ace settings handler -->
<script src="${pageContext.request.contextPath}/assets/ux/ace/js/ace-extra.min.js"></script>

<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

<!--[if lte IE 8]>
<script src="${pageContext.request.contextPath}/assets/ux/ace/js/html5shiv.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/ux/ace/js/respond.min.js"></script>
<![endif]-->

<!--[if !IE]> -->
<script type="text/javascript">
	window.jQuery || document.write("<script src='../assets/js/jquery.min.js'>" + "<" + "/script>");
</script>
<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
	window.jQuery || document.write("<script src='../assets/ux/ace/js/jquery1x.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
<script type="text/javascript">
	if ('ontouchstart' in document.documentElement)
		document.write("<script src='../assets/ux/ace/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.11.1.js"></script>

<script src="${pageContext.request.contextPath}/assets/ux/ace/js/bootstrap.min.js"></script>

<!-- ace scripts -->
<script src="${pageContext.request.contextPath}/assets/ux/ace/js/ace-elements.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/ux/ace/js/ace.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/ux/ace/js/bootbox.min.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/assets/ux/ace/js/bootbox.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/json.js"></script>
<script type='text/javascript' charset="utf-8" src="${pageContext.request.contextPath}/assets/js/json2.js"></script> 
<script type='text/javascript' charset="utf-8" src="${pageContext.request.contextPath}/assets/ux/DataTables/jquery.dataTables.man.js"></script>
<script type='text/javascript' charset="utf-8" src="${pageContext.request.contextPath}/assets/ux/ace/js/jquery.dataTables.bootstrap.js"></script>
<script type='text/javascript' charset="utf-8" src="${pageContext.request.contextPath}/assets/ux/ace/date.js"></script>
<script type='text/javascript' charset=utf-8 src=${pageContext.request.contextPath}/assets/ux/ace/plugin-menu.js></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/assets/ux/bootstrapvalidator/js/bootstrapValidator.js"></script>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/ux/ace/css/datepicker.css"> --%>
<script src="${pageContext.request.contextPath}/assets/ux/ace/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/ux/ace/js/date-time/locales/bootstrap-datepicker.zh-CN.js"></script>
<!-- <script type='text/javascript' charset=utf-8 src=${pageContext.request.contextPath}/assets/js/jquery.cookie.js></script> -->