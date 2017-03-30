<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
        <link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		<script type="text/javascript" src="<%=path %>/js/jquery-1.7.1.min.js"></script> 
		<script type="text/javascript" src="<%=path %>/js/xheditor-1.1.14-zh-cn.min.js"></script>
	</head>

	<body>
			<form action="<%=path %>/gonggaoAdd.action" method="post">
				     <table class="userinfobar-wrap" width="95%" align="center">
						<tr bgcolor="#e5e5e5">
						    <td colspan="4">&nbsp;&nbsp;&nbsp;>&nbsp;公告添加</td>
						</tr>
						<tr>
						    <td width="25%" align="right">标题：</td>
						    <td width="75%">
						        <input type="text" name="gonggaoTitle" size="22"/>
						    </td>
						</tr>
						<tr>
						    <td width="25%" align="right">内容：</td>
						    <td width="75%"> 
							    <textarea class="xheditor-mini" style="width:500px;height:200px;" name="gonggaoContent"></textarea> 
						    </td>
						</tr>
						<tr>
						    <td width="25%"></td>
						    <td width="75%">
						       <input type="submit" value="提交"/>&nbsp; 
						       <input type="reset" value="重置"/>
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
