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
	        function changeNum(goodsId,number)
	        {
	        	window.location.href='<%=path %>/changeNumFromCart.action?goodsId='+goodsId+'&&number='+number;
	        }
	        
	        //删除商品
	        function delGoodsFromCart(goodsId)
	        {
	        	window.location.href='<%=path %>/delGoodsFromCart.action?goodsId='+goodsId;
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
								 <span style="float:left">我的购物车</span>
							</div>
							<div class="main_context">
						  	  <s:set name="items" value="#session.cart.items"/>
	                          <table width="99%" align="center" >
					              <tr align="center" bgcolor="#FAFAF1" height="22">
					                  <td>商品名称</td>
					                  <td>价格</td>
					                  <td>数量</td>
					                  <td>金额</td>
					                  <td>操作</td>
				                  </tr>
								  <s:iterator value="#items">
									  <tr align='center'>
									  	  <!-- 获取map值value -->
										  <td align="center"><s:property value="value.goods.goodsName"/></td>
										  <td>
											  <s:if test="value.goods.goodsIsnottejia=='no'">
												         ￥<s:property value="value.goods.goodsShichangjia"/>
											  </s:if>
											  <s:if test="value.goods.goodsIsnottejia=='yes'">
												         ￥<s:property value="value.goods.goodsTejia"/>
										      </s:if>
									      </td>
										  <td><input type="text" onchange="changeNum(<s:property value="value.goods.goodsId"/>,this.value)" value="<s:property value="value.goodsNumber"/>" size="4"  onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/></td>
										  <td>
										  	  <s:if test="value.goods.goodsIsnottejia=='no'">
												         ￥<s:property value="value.goodsNumber * value.goods.goodsShichangjia"/>
											  </s:if>
											  <s:if test="value.goods.goodsIsnottejia=='yes'">
												         ￥<s:property value="value.goodsNumber * value.goods.goodsTejia"/>
										      </s:if>
										  </td>
										  <td><input onclick="delGoodsFromCart(<s:property value="value.goods.goodsId"/>)" type="button" value="删除"/></td>
									  </tr>
								  </s:iterator>
					              <tr>
					                 <td colspan="5" align="right" >
					                 <hr>
									    总金额：￥<span id="totalMoney"><s:property value="#session.cart.totalPrice"/></span>&nbsp;&nbsp;&nbsp;
									 </td>
					              </tr>	
	        				</table>
	        				<table width="99%" align="center" height="20px">
	        					<tr align="right">
	        						<td colspan="4"></td>
			                        <td><a href="<%=path %>/clearCart.action">清空购物车</a>&nbsp;&nbsp;&nbsp;
				                    <a href="<%=path %>/orderQueren.action">全部付款</a>&nbsp;&nbsp;&nbsp;</td>
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
