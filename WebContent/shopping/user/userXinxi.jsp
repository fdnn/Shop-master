<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
%>

<html>
	<head>
		<link rel="shortcut icon" href="<%=path %>/images/logo.png" type="image/x-icon" />
		<link href="<%=path %>/css/base.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript">
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
		        document.form1.submit();
		    }
        </script>
	</head>
	<body class="shoppingBoby">
		<div id="header">
		    <jsp:include flush="true" page="../head.jsp"></jsp:include>
		</div> 
		<div id="Main">
			<div style="padding:8px 0px 0px;  margin:0px auto;">
				<!--左边 -->
				<div class="left">
					<div class="main_lr">
						<div class="main_bc">
							<div class="main_bar_shuxing">
								 <span style="float:left">信息</span>
							</div>
							<div class="main_context">
								<form action="<%=path %>/userUpdate.action" onsubmit="return check1()" name="form1" method="post">
									<table width="99%" align="center" >
										<tr>
											<td width="40%" align="right" bgcolor="#FAFAF1" >
												用户名：
											</td>
											<td>
												&nbsp;
												<input type="text" name="userName" id="userName" readonly="readonly" value="${sessionScope.user.userName }"/>
											</td>
										</tr>
										
										<tr>
											<td width="40%" align="right" bgcolor="#FAFAF1" >
												密码：
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
												<input type="text" name="userRealname" value="${sessionScope.user.userRealname }"/>
											</td>
										</tr>
										<tr>
											<td width="40%" align="right" bgcolor="#FAFAF1" >
												住址：
											</td>
											<td>
												&nbsp;
												<input type="text" name="userAddress" value="${sessionScope.user.userAddress }"/>
											</td>
										</tr>
										<tr>
											<td width="40%" align="right" bgcolor="#FAFAF1" >
												性别：
											</td>
											<td>
												<s:if test="#session.user.userSex =='男'.toString()">
													&nbsp;
													<input type="radio" name="userSex" value="男" checked="checked"/>男
													&nbsp;&nbsp;&nbsp;&nbsp;
													<input type="radio" name="userSex" value="女"/>女
												</s:if>
												<s:else>
													&nbsp;
													<input type="radio" name="userSex" value="男"/>男
													&nbsp;&nbsp;&nbsp;&nbsp;
													<input type="radio" name="userSex" value="女" checked="checked"/>女
												</s:else>
											</td>
										</tr>
										<tr>
											<td width="40%" align="right" bgcolor="#FAFAF1" >
												联系方式：
											</td>
											<td>
												&nbsp;
												<input type="text" name="userTel" value="${sessionScope.user.userTel }"/>
											</td>
										</tr>
										<tr>
											<td width="40%" align="right" bgcolor="#FAFAF1" >
												E-mail：
											</td>
											<td>
												&nbsp;
												<input type="text" name="userEmail" value="${sessionScope.user.userEmail }"/>
											</td>
										</tr>
										<tr>
											<td width="40%" align="right" bgcolor="#FAFAF1" >
												QQ：
											</td>
											<td>
												&nbsp;
												<input type="text" name="userQq" value="${sessionScope.user.userQq }"/>
											</td>
										</tr>
										<tr>
											<td width="40%" align="right" >
												&nbsp;
											</td>
											<td>
												&nbsp;
												<input type="hidden" name="userId" value="${sessionScope.user.userId }">
												<input type="submit" value="保存"/>
											</td>
										</tr>
									</table>
								</form>
							</div>
		             </div>
		         </div>	
	        </div>
			</div>
			
			<jsp:include flush="true" page="../right.jsp"></jsp:include>
			<div>
				<jsp:include flush="true" page="../foot.jsp"></jsp:include>
			</div>
		</div>
	</body>
</html>
