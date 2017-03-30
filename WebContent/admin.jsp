<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	String path = request.getContextPath();
%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="bootstrap3/css/bootstrap.min.css">
<link rel="shortcut icon" href="<%=path %>/images/logo.png" type="image/x-icon" />
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="canvas/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="canvas/css/demo.css" />

<!--必要样式-->
<link rel="stylesheet" type="text/css" href="canvas/css/component.css" />

<!--[if IE]>
<script src="canvas/js/html5.js"></script>
<![endif]-->
<style type="text/css">
<!--
element.style{margin:0px;padding:0px;}
.container{width:100%;padding:0px;}
body{font:14px/1.5 'Microsoft YaHei';}
-->
</style>
<script type="text/javascript">
	function submit(){
		 document.login.submit();
	}
</script>
</head>
<body>
	<div class="container demo-1">
			<div class="content">
				<div id="large-header" class="large-header">
					<canvas id="demo-canvas"></canvas>
					<h1 class="main-title" style="font-size: 40px;">
						<img alt="HZ购物" src="<%=path %>/images/logo.png">
						<p style="height:40px">后台管理系统</p>
						<p style="font-size:12px;font-weight: bold;padding-bottom: 20px">Shopping management system</p> 
					<span class="thin" style="font-size: 25px">
						<form action="<%=path %>/admin_login.action" method="post" name="login">
							<table align="center">
								<tr>
									<div class="form-group">
									    <input type="text" name="userName" class="form-control" id="exampleInputEmail1" placeholder="用户名">
									  </div>	
								</tr>
								<tr>
									<div class="form-group">
								   	    <input type="password" name="password" class="form-control" id="exampleInputPassword3" placeholder="密码">
								    </div>
								</tr>
								<tr align="center">
									<td colspan="2">
										<button type="button" class="btn btn-success btn-lg btn-block" style="width:350px" onclick="submit()">登陆</button>
										<font color="red">${error }</font>
									</td>
								</tr>
							</table>
						</form>
					</span>
				</h1>
			</div>
		</div>
	</div><!-- /container -->
	<script src="canvas/js/TweenLite.min.js"></script>
	<script src="canvas/js/EasePack.min.js"></script>
	<script src="canvas/js/rAF.js"></script>
	<script src="canvas/js/demo-1.js"></script>
</body>
</html>