<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
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
	<div class="menubar-wrap">
		<div class="menubar-title"><h1>菜单</h1></div>
		<div class="menubar-content">
			<ul class="menubar-list">
				<li><a href="#">常用操作</a>
					<ul class="menubar-sub">
						<li><a href='<%=path %>/admin/index/userinfo.jsp' target='main'>>>密码修改</a></li>
						<li><a href='<%=path %>/userMana.action' target='main'>>>用户管理</a></li>
						<li><a href='<%=path %>/adminManage.action' target='main'>>>管理员管理</a></li>
					</ul></li>
				<li><a href="#">公告管理</a>
					<ul class="menubar-sub">
						<li><a href='<%=path %>/gonggaoMana.action' target='main'>>>公告管理</a></li>
					</ul></li>
				<li><a href="#">商品管理</a>
					<ul class="menubar-sub">
						<li><a href='<%=path %>/catelogMana.action' target='main'>>>商品类别管理</a></li>
						<li><a href='<%=path %>/goodsMana.action' target='main'>>>商品管理</a></li>
					</ul></li>
				<li><a href="#">订单管理</a>
					<ul class="menubar-sub">
						<li><a href='<%=path %>/orderMana.action' target='main'>>>订单管理</a></li>
					</ul></li>
				<li><a href="#">安全退出系统</a>
					<ul class="menubar-sub">
						<li><a href="#" onclick="logout()">>>安全退出系统</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</body>
</html>
