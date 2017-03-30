<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
%>
<html>
<head>
</head>
<body>
	<!-- 右边的用户登录 -->
	<div class="right" style="width:314px;">
		<div class="main_lr">
			<div style="border:#cccccc 1px solid;">
				<div class="main_bar_shuxing">
					用户登录
				</div>
				<div style="text-align:center; padding:6px 0 0;">
					<jsp:include flush="true" page="user/userlogin.jsp"></jsp:include>
				</div>
			</div>
		</div>
              <div class="main_lr">
		    <div style="border:#cccccc 1px solid;">
		        <div class="main_bar_shuxing">商品分类</div>
		        <div style="text-align:center; padding:6px;">
		           <s:action name="catelogAll" executeResult="true" flush="true"></s:action>
			    </div>
		    </div>
		</div>
		<div class="main_lr">
		    <div style="border:#cccccc 1px solid;">
		        <div class="main_bar_shuxing">网站公告</div>
		        <div style="text-align:center; padding:6px;">
		             <s:action name="gonggaoAll" executeResult="true" flush="true"></s:action>        
			    </div>
		    </div>
		</div>
	</div>
</body>
</html>
