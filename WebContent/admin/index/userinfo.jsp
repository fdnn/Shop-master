<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false" %> 

<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="../../css/base.css" />
   	<script language="javascript">
	    function check()
	    {
	         var userPwReal="${currentUser.userPw}";
	         if(document.formPw.userPw.value !=userPwReal)
	         {
	             alert("原密码不正确");
	             return ;
	         }
	         
	         if(document.formPw.userPw1.value =="")
	         {
	             alert("新密码不能空");
	             return ;
	         }
	         if(document.formPw.userPw1.value != document.formPw.userPw2.value)
	         {
	             alert("两次输入的密码不一致");
	             return ;
	         }
	    }
	</script>
</head>
<body>
	<form method="post" action="<%=path %>/admin_pwEdit.action" name="formPw">
		<table class="userinfobar-wrap" width="95%" align="center">
			<tr bgcolor="#e5e5e5">
			    <td colspan="2">&nbsp;&nbsp;&nbsp;>&nbsp;密码修改</td>
			</tr>
			<tr>
			    <td width="25%" align="right"> 登录名： </td>
			    <td width="75%">
			        <input type="text" value="${currentUser.userName }" name="userName" size="22" disabled="disabled"/>
			    </td>
			</tr>
			<tr>
			    <td width="25%" align="right">原密码：</td>
			    <td width="75%">
			        <input type="password" name="userPw" id="userPw" size="22"/>
			    </td>
			</tr>
			<tr>
			   <td width="25%" align="right">新密码：</td>
			    <td width="75%">
			        <input type="password" id="userPw1" name="userPw1" size="22"/>
			    </td>
			</tr>
			<tr>
			    <td width="25%" align="right">确认密码：</td>
			    <td width="75%">
			           <input type="password" name="userPw2" id="userPw2" size="22"/>
			    </td>
			</tr>
			<tr>
			    <td width="25%" align="right"></td>
		        <td width="75%">
		             <input type="submit" value="修改" onclick="check()"/>
		             &nbsp;&nbsp;&nbsp;
		             <input type="reset" value="重置"/>
		        </td>
			</tr>
		</table>
	</form>
</body>
</html>
