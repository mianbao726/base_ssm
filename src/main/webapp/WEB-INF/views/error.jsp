<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<jsp:include page="include/header.jsp" flush="true" />
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>jqGrid - Ace Admin</title>
</head>
<body class="login-layout">
	<div class="page-content-area">
		<div class="row">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->

				<!-- #section:pages/error -->
				<div class="error-container">
					<div class="well">
						<h1 class="grey lighter smaller">
							<span class="blue bigger-125"> <i class="ace-icon fa fa-random"></i> 500
							</span> Something Went Wrong
						</h1>

						<hr />
						<h3 class="lighter smaller">
							But we are working <i class="ace-icon fa fa-wrench icon-animated-wrench bigger-125"></i> on
							it!
						</h3>

						<div class="space"></div>

						<div>
							<h4 class="lighter smaller">Meanwhile, try one of the following:</h4>

							<ul class="list-unstyled spaced inline bigger-110 margin-15">
								<li><i class="ace-icon fa fa-hand-o-right blue"></i> Read the faq</li>

								<li><i class="ace-icon fa fa-hand-o-right blue"></i> Give us more info on how this
									specific error occurred!</li>
							</ul>
						</div>

						<hr />
						<div class="space"></div>

						<div class="center">
							<a href="javascript:history.back()" class="btn btn-grey"> <i
								class="ace-icon fa fa-arrow-left"></i> Go Back
							</a> <a href="#" class="btn btn-primary"> <i class="ace-icon fa fa-tachometer"></i> Dashboard
							</a>
						</div>
					</div>
				</div>

				<!-- /section:pages/error -->

				<!-- PAGE CONTENT ENDS -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /.page-content-area -->
</body>