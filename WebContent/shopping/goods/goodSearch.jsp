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
								 <span style="float:left">搜索结果</span>
							</div>
	  	                	<s:if test="#request.goodsList.size==0">
								   &nbsp;&nbsp;没有符合条件的商品。
							</s:if>
						  	<div class="main_context">
			        			<table width="99%" align="center" >
							              <tr align="center" bgcolor="#FAFAF1" height="22">
							              	  <td>商品编号</td>
							                  <td>商品名称</td>
							                  <td>市场价</td>
							                  <td>特价</td>
							                  <td>商品图片</td>
							                  <td>操作</td>
							              </tr>
										  <s:iterator value="#request.goodsList" id="goods">
											  <tr align="center">
											  	  <td align="center"><s:property value="#goods.goodsId"/></td>
												  <td><s:property value="#goods.goodsName"/></td>
												  <td>￥<s:property value="#goods.goodsShichangjia"/></td>
												  <td>
												      <s:if test="#goods.goodsShichangjia==#goods.goodsTejia">
												          	无特价
												      </s:if>
												      <s:else>
												        <s:property value="#goods.goodsTejia"/>
												      </s:else>
												  </td>
												  <td><img src="<%=path %>/<s:property value="#goods.goodsPic"/>" width="60" height="60"/></td>
												  <td><a href="<%=path %>/goodsDetail2.action?goodsId=<s:property value="#goods.goodsId"/>">购买</a></td>
											  </tr>
										  </s:iterator>
				        			</table>
					              
				        			<nav>
									  <ul class="pagination">
									    <li>
									      <a href="<%=path %>/goodsAllSearch.action?page=1&&goodsName=<s:property value='#request.goodsName'/>" aria-label="Previous">
									        <span aria-hidden="true">&laquo;</span>
									      </a>
									    </li>
									    <s:iterator value="#request.totalPageList" id="list">
									    	<li><a href="<%=path %>/goodsAllSearch.action?page=<s:property value='#list'/>&&goodsName=<s:property value='#request.goodsName'/>"><s:property value="#list"/></a></li>
									    </s:iterator>
									    <li>
									       <a href="<%=path %>/goodsAllSearch.action?page=<s:property value='#request.totalPage'/>&&goodsName=<s:property value='#request.goodsName'/>" aria-label="Next">
									        <span aria-hidden="true">&raquo;</span>
									       </a>
									    </li>
									  </ul>
									</nav>
									<input type="hidden" name="goodsName" value="<s:property value='#request.goodsName'/>"/>
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
