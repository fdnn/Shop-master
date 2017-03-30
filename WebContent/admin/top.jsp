<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/base.css" />
<script language='javascript'>
		function logout()
		{
		   if(confirm("确定要退出本系统吗??"))
		   {
			   window.parent.location="<%=path%>/logout.action";
		}
	}
</script>
</head>

<body>
	<div class="topbar-wrap white">
		<div class="topbar-context">
			<div class="topbar-list left">
				<ul>
					<li><a class="on" href="index.jsp">首页</a></li>
					<li><a href="<%=path %>/shopping.jsp" target="_blank">网站首页</a></li>
				</ul>
			</div>
			<div class="topbar-list">
				<ul>
					<li></li>
					<li><p>HAIGOU SHOPPING MANAGEMENT SYSTEM</p></li>
				</ul>
			</div>
			<div class="topbar-list right">
				<ul>
					<li>你好，${currentUser.userName}</li>
					<li><a href="#" onclick="logout();">退出</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
