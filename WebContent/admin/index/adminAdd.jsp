<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false" %> 

<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
</head>

<body>
	<form action="<%=path %>/adminAdd.action" name="formAdd" method="post">
	     <table class="userinfobar-wrap" width="95%" align="center">
		 	<tr bgcolor="#e5e5e5">
		        <td colspan="3">&nbsp;&nbsp;&nbsp;>&nbsp;管理员添加</td>
		    </tr>
			<tr>
			    <td width="25%" align="right">用户名：</td>
			    <td width="75%">
			        <input type="text" name="userName" size="22"/>
			    </td>
			</tr>
			<tr>
			    <td width="25%" align="right"> 密码：</td>
			    <td width="75%">
			        <input type="password" name="userPw" size="22"/>
			    </td>
			</tr>
			<tr>
			    <td width="25%" align="right"></td>
			    <td width="75%">
			       <input type="submit" value="提交"/>&nbsp; 
			       <input type="reset" value="重置"/>
			    </td>
			</tr>
		 </table>
	</form>
</body>
</html>
