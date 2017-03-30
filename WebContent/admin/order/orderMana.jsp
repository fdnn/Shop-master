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
           function orderDel(orderId)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/orderDelByAdmin.action?orderId="+orderId;
               }
           }
           
           function orderShouli(orderId)
           {
               if(confirm('您确定受理订单吗？'))
               {
                   window.location.href="<%=path %>/orderShouli.action?orderId="+orderId;
               }
           }
           
           
           function orderDetail(orderId)
           {
                 var url="<%=path %>/orderDetail.action?orderId="+orderId;
	             window.open (url, "_blank", "height=500px, width=480px, toolbar= no, menubar=no, scrollbars=no, resizable=no, location=no, status=no,top=0,left=0")
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
			    	<td colspan="9">&nbsp;&nbsp;&nbsp;>&nbsp;订单管理</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="8%">用户ID</td>
					<td width="10%">订单编号</td>
					<td width="10%">金额</td>
					<td width="16%">下单日期</td>
					<td width="18%">送货地址</td>
					<td width="16%">付款方式</td>
					<td width="22%">操作</td>
		        </tr>	
				<s:iterator value="#request.orderList" id="order">
				<tr align="center">
					<td >
						<a href="#" onclick="userXinxi(<s:property value="#order.orderUser.userId"/>)"><s:property value="#order.orderUser.userId"/></a>
					</td>
					<td >
						<s:property value="#order.orderBianhao"/>
					</td>
					<td >
					   ￥<s:property value="#order.orderAmount"/>
					</td>
					<td >
					   <s:property value="#order.orderDate"/>
					</td>
					<td >
					   <s:property value="#order.orderSonghuodizhi"/>
					</td>
					<td >
					   <s:property value="#order.orderFukuangfangshi"/>
					</td>
					<td >
				        <a href="#" onclick="orderDetail(<s:property value="#order.orderId"/>)" class="deleteLink">订单明细</a>
					    <s:if test="#order.orderZhuangtai=='no'">
						    <a href="#" onclick="orderShouli(<s:property value="#order.orderId"/>)" class="deleteLink">受理订单</a>
					    </s:if>
					    <s:if test="#order.orderZhuangtai=='yes'">
					       	  已受理
					    </s:if>
						<a href="#" onclick="orderDel(<s:property value="#order.orderId"/>)" class="deleteLink">删除订单</a>
					</td>
				</tr>
				</s:iterator>
			</table>
	</body>
</html>
