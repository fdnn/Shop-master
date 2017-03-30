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
            function back()
	        {
	           window.history.go(-1);
	        }
        </script>
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
								 <span style="float:left">订单确认</span>
							</div>
							<div class="main_context">
							  	<form action="<%=path %>/orderSubmit.action" name="f" method="post">
		                          <table width="99%" align="center" >
						              <tr align="center" height="22">
						                  <td align="right" width="40%">收货人帐号：</td>
						                  <td align="left">
						                      <input type="text" value="<s:property value="#session.user.userName"/>"/>
						                  </td>
						              </tr>
						              <tr align="center" height="22">
						                  <td align="right" width="40%">收货人姓名：</td>
						                  <td align="left">
						                      <input type="text" value="<s:property value="#session.user.userRealname"/>"/>
						                  </td>
						              </tr>
						              <tr align="center" height="22">
						                  <td align="right" width="40%">收货人联系电话：</td>
						                  <td align="left">
						                      <input type="text" value="<s:property value="#session.user.userTel"/>"/>
						                  </td>
						              </tr>
						              <tr align="center" height="22">
						                  <td align="right" width="40%">收货人地址：</td>
						                  <td align="left">
						                      <input type="text"  value="<s:property value="#session.user.userAddress"/>"/>
						                  </td>
						              </tr>
						              <tr align="center" height="22">
						                  <td align="right" width="40%">送货地址：</td>
						                  <td align="left"><input type="text" name="orderSonghuodizhi"/></td>
						              </tr>
						              <tr align="center" height="22">
						                  <td align="right" width="40%">付款方式：</td>
						                  <td align="left">
			   		                          <select name="orderFukuangfangshi" style="width:174px;">
			   		                               <option value="货到付款">货到付款</option>
			   		                               <option value="银行付款">银行付款</option>
			   		                          </select>
			                              </td>
						              </tr>
			        				</table>
			        				<table width="99%" align="center" height="20px">
		        						<tr align="right">
		        							<hr>
		        							<td colspan="4"></td>
					                        <td><a href="javascript:void(0)" onclick="back()">返回&nbsp;&nbsp;&nbsp;</a>
					                        <a href="#" onclick="javascript:document.f.submit();">提交订单&nbsp;&nbsp;&nbsp;</a></td>
					                   </tr>
					               </table>
					            </form>
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
