<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
%>

<html>
	<head>
		<link rel="shortcut icon" href="<%=path %>/images/logo.png" type="image/x-icon" />
		<link href="<%=path %>/css/base.css" type="text/css" rel="stylesheet" />
	</head>

	<body class="shoppingBoby">
		<!-- 顶部head -->
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
								 <span style="float:left">订单提交</span>
							</div>
							<div class="main_context">
							  	<table width="99%" align="center" >	
						              <tr>
						                  <td align="center" style="color: red"><h3>恭喜您，订单提交成功！</h3></td>
						              </tr>
						              <tr>
						                  <td>订单编号：<s:property value="#request.order.orderBianhao"/></td>
						              </tr>
						              
						              <tr>
						                  <td>总金额：<s:property value="#request.order.orderAmount"/></td>
						              </tr>
						              <tr>
						                  <td>下单日期:<s:property value="#request.order.orderDate"/></td>
						              </tr>
						              <tr>
						                  <td>送货地址:<s:property value="#request.order.orderSonghuodizhi"/></td>
						              </tr>
						              <tr>
						                  <td>付款方式:<s:property value="#request.order.orderFukuangfangshi"/></td>
						              </tr>
			        			</table>
			        			<table width="99%" align="center" height="20px">
	        						<tr align="right">
		        						<td colspan="4"></td>
				                        <td><a href="<%=path %>/shopping.jsp">返回首页</a>&nbsp;&nbsp;&nbsp;</td>
			                   		</tr>	
	        					</table>
							</div>
		             </div>
		         </div>	
	        </div>
			</div>
			
			<!-- 右侧公共模块right -->		
			<jsp:include flush="true" page="../right.jsp"></jsp:include>
			
			<!-- 底部foot -->
			<div>
				<jsp:include flush="true" page="../foot.jsp"></jsp:include>
			</div>
		</div>
	</body>
</html>
