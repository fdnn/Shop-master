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
        function orderDel(orderId)
        {
            var url="<%=path %>/orderDel.action?orderId="+orderId;
            window.location.href=url;
        }
        
        function orderDetail(orderId)
        {
                 var url="<%=path %>/orderDetail.action?orderId="+orderId;
                 window.open (url, "_blank", "height=500px, width=480px, toolbar= no, menubar=no, scrollbars=no, resizable=no, location=no, status=no,top=0,left=0")
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
								 <span style="float:left">我的订单</span>
							</div>
							<div class="main_context">
						  	<table width="99%" align="center" >
					             <tr align="center" bgcolor="#FAFAF1" height="22">
					                  <td>订单编号</td>
					                  <td>金额</td>
					                  <td>下单日期</td>
					                  <td>订单状态</td>
					                  <td>编辑</td>
					              </tr>
								  <s:iterator value="#request.orderList" id="order">
								  <tr align='center'>
									  <td>
										<s:property value="#order.orderBianhao"/>
									  </td>
									  <td>￥<s:property value="#order.orderAmount"/><br/></td>
									  <td><s:property value="#order.orderDate"/></td>
									  <td>
									      <s:if test="#order.orderZhuangtai=='no'">
									            已下单-未受理
									      </s:if>
									      <s:if test="#order.orderZhuangtai=='yes'">
									            已下单-已受理
									      </s:if>
		                              </td>
									  <td>
									      <a href="#" onclick="orderDetail(<s:property value="#order.orderId"/>)">订单明细</a>
									      &nbsp;&nbsp;
									      <a href="#" onclick="orderDel(<s:property value="#order.orderId"/>)">删除</a>
									  </td>
								  </tr>
								  </s:iterator>
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
