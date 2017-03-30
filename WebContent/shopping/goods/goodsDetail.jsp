<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
%>

<html>
	<head>
		<link rel="shortcut icon" href="<%=path %>/images/logo.png" type="image/x-icon" />
		
    	<link rel="stylesheet" href="bootstrap3/css/bootstrap.min.css">
		<link href="<%=path %>/css/base.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript">
	        function buy1(goodsKucun)
	        {
	            <s:if test="#session.user==null">
	                  alert("请先登录");
	            </s:if>
	            <s:else>
	            if(document.buy.number.value=="")
	            {
	                alert("请输入购买数量");
	                return false;
	            }
	            if(document.buy.number.value>goodsKucun)
	            {
	                alert("库存不足");
	                return false;
	            }
	            
	            document.buy.submit();
	            </s:else>
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
					<!-- 特价 -->
					<div class="main_lr">
						<div class="main_bc">
							<div class="main_bar_shuxing">
								 <span style="float:left">商品</span>
							</div>
							<div class="main_context">
						  	<form action="<%=path %>/addToCart.action" method="post" name="buy">
                                  <table width="98%" border="0" cellpadding="6" align="center">
                                      <tr align="center">
                                      <td rowspan="6" width="35%"><img src='<%=path %><s:property value="#request.goods.goodsPic"/>' width="100%"/></td>
	                                      <td align="right" style="font-size: 14px;" width="20%">商品名称：</td>
	                                      <td align="left" ><s:property value="#request.goods.goodsName"/></td>
	                                  </tr>
                                      <%-- <tr>
	                                      <td align="right" style="font-size: 14px;">图片：</td>
	                                      <td align="left">
	                                    	  <img src='<%=path %><s:property value="#request.goods.goodsPic"/>' width="20%"/>
                                      	  </td>
                                      </tr> --%>
                                      <tr>
	                                      <td align="right" style="font-size: 14px;">市场价：</td>
	                                      <td align="left"> ￥<s:property value="#request.goods.goodsShichangjia"/></td>
                                      </tr>
                                       <tr>
	                                      <td align="right" style="font-size: 14px;">特价：</td>
	                                      <td align="left">
		                                      <s:if test="#request.goods.goodsIsnottejia=='no'">
										     	 无特价
										      </s:if>
										      <s:if test="#request.goods.goodsIsnottejia=='yes'">
											         ￥<s:property value="#request.goods.goodsTejia"/>
										      </s:if>
									      </td>
                                      </tr>
                                      <tr>
	                                      <td align="right" style="font-size: 14px;">购买数量：</td>
	                                      <td align="left"><input type="text" name="number" value="1" size="5" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/></td>
                                      </tr>
                                      <tr>
                                      	<td></td>
                                      	<td style="font-size: 14px;">
                         					<input type="hidden" name="goodsId" value='<s:property value="#request.goods.goodsId"/>'/>
	                                      	<input type="button" value="购买" onclick='buy1(<s:property value="#request.goods.goodsKucun"/>)' style="border:#ccc 1px solid; background-color:#FFFFFF; font-size:12px; padding-top:3px;margin-top: 10px" />
	                                    </td>
                                      </tr>
                                      <tr>
	                                      <td align="right" style="font-size: 14px;">商品描述：</td>
	                                      <td align="left"><s:property value="#request.goods.goodsMiaoshu"/></td>
                                      </tr>
                                  </table>
                            </form>
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
