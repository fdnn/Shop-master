<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
	<script language="javascript">
         function adminDel(userId)
         {
             if(confirm('您确定删除吗？'))
             {
                 window.location.href="<%=path %>/adminDel.action?userId="+userId;
             }
         }
         
         function adminAdd()
         {
	     	window.location.href="<%=path %>/admin/index/adminAdd.jsp";
         }
	</script>
</head>
<body>
	<table class="userinfobar-wrap" width="95%" align="center">
		<tr bgcolor="#e5e5e5">
		    <td colspan="4">&nbsp;&nbsp;&nbsp;>&nbsp;管理员维护</td>
		</tr>
		<tr align="center" bgcolor="#FAFAF1" height="22">
			<td width="25%">ID</td>
			<td width="25%">用户名</td>
			<td width="25%">密码</td>
			<td width="25%">操作</td>
        </tr>	
		<s:iterator value="#request.adminList" id="admin">
			<tr align="center">
				<td>
					<s:property value="#admin.userId"/>
				</td>
				<td>
					<s:property value="#admin.userName"/>
				</td>
				<td>
				    <s:property value="#admin.userPw"/>
				</td>
				<td>
					<a href="#" onclick="adminDel(<s:property value="#admin.userId"/>)" class="deleteLink">删除</a>
				</td>
			</tr>
		</s:iterator>
		</table>
		
		<table width="95%" align="center">
		  <tr>
		    <td>
		      <input type="button" value="添加" style="width: 80px;" onclick="adminAdd()" />
		    </td>
		  </tr>
	    </table>
</body>
</html>
