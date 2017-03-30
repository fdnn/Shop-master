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
<body>
	<script type="text/javascript">
		function tiao() {
			window.location.href = "<%=path %>/admin/index.jsp";
		}
		setTimeout(tiao, 1300)
	</script>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<center>
		<img src="<%=path %>/images/loading.gif">页面跳转中
	</center>
</body>
</html>
