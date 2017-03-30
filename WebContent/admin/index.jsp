<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	String path = request.getContextPath();
%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="<%=path %>/images/logo.png" type="image/x-icon" />
<title>Insert title here</title>
</head>
  <frameset rows="50,*" cols="*" frameborder="no" border="0" framespacing="0">
	  <frame src="<%=path %>/admin/top.jsp" name="topFrame" scrolling="no">
	  <frameset cols="200,*" name="btFrame" frameborder="no" border="0" framespacing="0">
	    <frame src="<%=path %>/admin/menu.jsp" noresize name="menu" scrolling="no">
	    <frame src="<%=path %>/admin/index/userinfo.jsp" noresize name="main" scrolling="yes">
	  </frameset>
  </frameset>
  <noframes>
	  <body>您的浏览器不支持框架！</body>
  </noframes>
</html>
