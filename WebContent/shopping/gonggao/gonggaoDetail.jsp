<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
%>
<html>
	<head>
		<link rel="shortcut icon" href="<%=path %>/images/logo.png" type="image/x-icon" />
    	<link rel="stylesheet" href="bootstrap3/css/bootstrap.min.css">
		<link href="<%=path %>/css/base.css" type="text/css" rel="stylesheet" />
	</head>
	<body class="shoppingBoby">
	
		<!-- 顶部head -->
		<div id="header">
		    <jsp:include flush="true" page="../head.jsp"></jsp:include>
		</div>
		<div id="Main">
			<div style="padding:8px 0px 0px;  margin:0px auto;">
				<!--左边 -->
				<div class="left">
					<div class="main_lr">
						<div class="main_bc">
							<div class="main_bar_shuxing">
								 <span style="float:left"><s:property value="#request.gonggao.gonggaoTitle"/></span>
								 <span style="float:right"><s:property value="#request.gonggao.gonggaoData"/>&nbsp;&nbsp;&nbsp;</span>
							</div>
							<div class="main_context">
								<h1><s:property value="#request.gonggao.gonggaoTitle"/></h1>
								<hr color="#f57921">
								<s:property value="#request.gonggao.gonggaoContent"/>
							</div>
				         </div>	
			        </div>
		        </div>
	        </div>
	        
	        <!-- 右侧公共模块right -->		
			<jsp:include flush="true" page="../right.jsp"></jsp:include>
			
			<!-- 底部foot -->
			<div>
				<jsp:include flush="true" page="../foot.jsp"></jsp:include>
			</div>
		</div>
	</body>
</html>
