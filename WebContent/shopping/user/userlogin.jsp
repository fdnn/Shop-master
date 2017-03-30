<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
%>

<html>
<head>
	<link rel="shortcut icon" href="<%=path %>/images/logo.png" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="<%=path %>css/base.css">
	<script type="text/javascript">
		function reg()
		{
		        var url="<%=path %>/shopping/user/userReg.jsp";
		        window.open (url, "_blank", "height=500px, width=480px, toolbar= no, menubar=no, scrollbars=no, resizable=no, location=no, status=no,top=0,left=0")
		}
		
		function login()
		{
		   if(document.userLogin.userName.value=="")
		   {
		       alert("请输入用户名");
		       return;
		   }
		   if(document.userLogin.userPw.value=="")
		   {
		       alert("请输入密码");
		       return;
		   }
		   document.userLogin.submit();
		}
		
		function admin(){
			window.location.href="<%=path %>/admin.jsp";
		}
	</script>	
</head>
  
<body>
    <s:if test="#session.user==null">
		<form action="<%=path %>/userLogin.action" name="userLogin" method="post">
		      <table width="98%" align="center">
		          <tr>
		            <td align="right" width="30%" height="30" style="font-size: 13px;">用户名：</td>
		            <td align="left"><input type="text" name="userName" /></td>
		          </tr>
		          <tr>
		            <td align="right" height="30" style="font-size: 13px;">密码：</td>
		            <td align="left"><input type="password" name="userPw"/></td>
		          </tr>
		          <tr>
		            <td align="center" colspan="2" height="30">
		               <input type="button" value="登录" onclick="login()" style="border:#ccc 1px solid; background-color:#FFFFFF; font-size:12px; padding-top:3px;" />
					   &nbsp;
					   <input type="button" value="注册" onclick="reg()" style="border:#ccc 1px solid; background-color:#FFFFFF; font-size:12px; padding-top:3px;" />
		               &nbsp;
					   <input type="button" value="后台" onclick="admin()" style="border:#ccc 1px solid; background-color:#FFFFFF; font-size:12px; padding-top:3px;" />
		            </td>
		          </tr>
		      </table>
	    </form>
    </s:if>
    <s:else>
        <br/>
	     	欢迎您：<s:property value="#session.user.userName"/> &nbsp;&nbsp;&nbsp;&nbsp;
	    <a href="<%=path %>/userLogout.action">安全退出</a> &nbsp;&nbsp;&nbsp;&nbsp;
	    <br/><br/><br/>
	</s:else>
</body>
</html>
