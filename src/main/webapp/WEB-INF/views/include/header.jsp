<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<meta name="description" content="overview &amp; stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/bootstrapvalidator/css/bootstrapValidator.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/base.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-fonts.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.onpage-help.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.mobile.custom.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/ace-extra.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootbox.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/ace.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/sjlr/ajaxfileupload.js"></script>
<!-- TODO TOBE REWRITE -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/viewjs/sunny.js"></script>
<script type='text/javascript' charset="utf-8" src="${pageContext.request.contextPath}/assets/sjlr/date.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/viewjs/plugin-menu.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/sjlr/datepicker.css">

<script src="${pageContext.request.contextPath}/assets/sjlr/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/sjlr/bootstrap-datepicker.zh-CN.js"></script>

<!-- TODO DATATABLES TOBE REWRITE -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.sunny.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.bootstrap.js"></script> 


<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/datatables-1.10.11/media/css/jquery.dataTables.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/datatables-1.10.11/media/js/jquery.dataTables.js"></script> --%>