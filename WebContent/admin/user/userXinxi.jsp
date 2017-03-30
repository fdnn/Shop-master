<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<%
	String path = request.getContextPath();
%>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
  </head>
  
<body>
	<table class="userinfobar-wrap" width="95%" align="center">
		<tr>
		    <td align="right">用户名：</td>
		    <td >
		        <input type="text" name="userName" readonly="readonly" value="<s:property value="#request.user.userName"/>"/>
		    </td>
		</tr>
		
		<tr>
			<td align="right">密 码：</td>
			<td >
				<input type="password" name="userPw" value="<s:property value="#request.user.userPw"/>"/>
			</td>
		</tr>
		
		<tr>
			<td align="right">真实姓名：</td>
			<td >
				<input type="text" name="userRealname" value="<s:property value="#request.user.userRealname"/>"/>
			</td>
		</tr>
		
		<tr>
			<td align="right">住址：</td>
			<td >
				<input type="text" name="userAddress" value="<s:property value="#request.user.userAddress"/>"/>
			</td>
		</tr>
		<%-- <tr>
			<td align="right">性别：</td>
			<td >
				&nbsp;
				<s:if test="#request.user.userSex=='1'">
					男
				</s:if>
				<s:else>
					女
				</s:else>
			</td>
		</tr> --%>
		<tr>
			<td align="right">联系方式：</td>
			<td >
				<input type="text" name="userTel" value="<s:property value="#request.user.userTel"/>"/>
			</td>
		</tr>
		<tr>
			<td align="right">E-mail：</td>
			<td >
				<input type="text" name="userEmail" value="<s:property value="#request.user.userEmail"/>"/>
			</td>
		</tr>
		<tr>
			<td align="right">QQ：</td>
			<td >
				<input type="text" name="userQq" value="<s:property value="#request.user.userQq"/>"/>
			</td>
		</tr>
	</table>
</body>
</html>
