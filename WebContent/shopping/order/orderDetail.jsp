<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
%>
<html>
  <head>
		<link rel="shortcut icon" href="<%=path %>/images/logo.png" type="image/x-icon" />
  		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
  </head>
  
  <body>
     <table class="userinfobar-wrap" width="95%" align="center">
     	<tr align="center" bgcolor="#e5e5e5" height="22">
			<td colspan="9">订单明细</td>
		</tr>
        <tr bgcolor="#FAFAF1">
            <td class="blackTitle" align="center">商品名称</td>
            <td class="blackTitle" align="center">购买数量</td>
            <td class="blackTitle" align="center">购买价格</td>
        </tr>
		<s:iterator value="#request.orderItemList" id="orderItem">
			<tr align="center">
			    <td><s:property value="#orderItem.goods.goodsName"/></td>
				<td><s:property value="#orderItem.goodsNumber"/></td>
				<td><s:property value="#orderItem.goods.goodsTejia"/></td>
			</tr>
		</s:iterator>
  	</table>
  </body>
</html>
