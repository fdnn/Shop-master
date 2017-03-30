<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<html>
	<head>
		<link rel="shortcut icon" href="<%=path %>/images/logo.png" type="image/x-icon" />
    	<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		<script language="javascript">
		    function check1()
		    {
		        if(document.form1.userName.value=="")
		        {
		            alert("请输入用户名");
		            return false;
		        }
		        if(document.form1.userPw.value=="")
		        {
		            alert("请输入密码");
		            return false;
		        }
		        if(document.form1.userPw.value!=document.form1.userPw1.value)
		        {
		            alert("两次密码不一致");
		            return false;
		        }
		        if(document.form1.userRealname.value=="")
		        {
		            alert("请输入真实姓名");
		            return false;
		        }
		        if(document.form1.userAddress.value=="")
		        {
		            alert("请输入地址");
		            return false;
		        }
		        if(document.form1.userTel.value=="")
		        {
		            alert("请输入联系方式");
		            return false;
		        }
		        if(document.form1.userEmail.value=="")
		        {
		            alert("请输入E-mail");
		            return false;
		        }
		        if(document.form1.userQq.value=="")
		        {
		            alert("请输入QQ");
		            return false;
		        }
		        
		        document.form1.submit();
		    }
        </script>
	</head>
	<body>
			<form action="<%=path %>/userReg.action" name="form1" method="post">
				<table class="userinfobar-wrap" width="98%" align="center">
					<tr bgcolor="#e5e5e5">
						<th height="40" colspan="2" >
							用 户 注 册
						</th>
					</tr>
					<tr>
						<td width="40%" align="right" bgcolor="#FAFAF1" >
							用户名：
						</td>
						<td>
							&nbsp;
							<input type="text" name="userName" id="userName"/>
						</td>
					</tr>
					<tr>
						<td align="right" bgcolor="#FAFAF1">
							密 码：
						</td>
						<td>
							&nbsp;
							<input type="password" name="userPw"/>
						</td>
					</tr>
					<tr>
						<td width="40%" align="right" bgcolor="#FAFAF1" >
							确认密码：
						</td>
						<td>
							&nbsp;
							<input type="password" name="userPw1"/>
						</td>
					</tr>
					<tr>
						<td width="40%" align="right" bgcolor="#FAFAF1" >
							真实姓名：
						</td>
						<td>
							&nbsp;
							<input type="text" name="userRealname"/>
						</td>
					</tr>
					<tr>
						<td width="40%" align="right" bgcolor="#FAFAF1" >
							住址：
						</td>
						<td>
							&nbsp;
							<input type="text" name="userAddress"/>
						</td>
					</tr>
					<tr>
						<td width="40%" align="right" bgcolor="#FAFAF1" >
							性别：
						</td>
						<td>
							&nbsp;
							<input type="radio" name="userSex" value="男" checked="checked"/>男
							&nbsp;&nbsp;
							<input type="radio" name="userSex" value="女"/>女
						</td>
					</tr>
					<tr>
						<td width="40%" align="right" bgcolor="#FAFAF1" >
							联系方式：
						</td>
						<td>
							&nbsp;
							<input type="text" name="userTel"/>
						</td>
					</tr>
					<tr>
						<td width="40%" align="right" bgcolor="#FAFAF1" >
							E-mail：
						</td>
						<td>
							&nbsp;
							<input type="text" name="userEmail"/>
						</td>
					</tr>
					<tr>
						<td width="40%" align="right" bgcolor="#FAFAF1" >
							QQ：
						</td>
						<td>
							&nbsp;
							<input type="text" name="userQq"/>
						</td>
					</tr>
					<tr>
						<td width="40%" align="right" bgcolor="#FAFAF1" ></td>
						<td>
							&nbsp;
							<input type="button" value="确定" onclick="check1();"/>
							<input type="reset" value="重置" />
						</td>
					</tr>
				</table>
			</form>
	</body>
</html>
