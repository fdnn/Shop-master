<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		
        <script language="javascript">
           function userDel(userId)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/userDel.action?userId="+userId;
               }
           }
           function userXinxi(userId)
           {
                 var url="<%=path %>/userXinxi.action?userId="+userId;
	             window.open (url, "_blank", "height=500px, width=480px, toolbar= no, menubar=no, scrollbars=no, resizable=no, location=no, status=no,top=0,left=0")
	       }
       </script>
	</head>

	<body>
			<table class="userinfobar-wrap" width="95%" align="center" >
				<tr bgcolor="#e5e5e5">
			    	<td colspan="10">&nbsp;&nbsp;&nbsp;>&nbsp;用户管理</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="10%">ID</td>
					<td width="10%">用户名</td>
					<td width="10%">密码</td>
					<td width="10%">真实姓名</td>
					<td width="10%">住址</td>
					<td width="10%">性别</td>
					<td width="10%">联系方式</td>
					<td width="10%">E-mail</td>
					<td width="10%">QQ</td>
					<td width="10%">操作</td>
		        </tr>	
				<s:iterator value="#request.userList" id="user">
				<tr align="center">
					<td >
						<a href="#" onclick="userXinxi(<s:property value="#user.userId"/>)"><s:property value="#user.userId"/></a>
					</td>
					<td >
						<s:property value="#user.userName"/>
					</td>
					<td >
					    <s:property value="#user.userPw"/>
					</td>
					<td >
						<s:property value="#user.userRealname"/>
					</td>
					<td >
						<s:property value="#user.userAddress"/>
					</td>
					<td >
					    <s:property value="#user.userSex"/>
					</td>
					<td >
						<s:property value="#user.userTel"/>
					</td>
					<td >
						<s:property value="#user.userEmail"/>
					</td>
					<td >
					    <s:property value="#user.userQq"/>
					</td>
					<td >
						<a href="#" onclick="userDel(<s:property value="#user.userId"/>)" class="deleteLink">删除</a>
					</td>
				</tr>
				</s:iterator>
			</table>
	</body>
</html>
