<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
%>
<html>
<head>
	
	<script type="text/javascript">
		function xinxi()
	    {
	        <s:if test="#session.user==null">
	              alert("请先登录");
	        </s:if>
	        
	        <s:else>
	       		window.location.href="<%=path %>/shopping/user/userXinxi.jsp";
	       	</s:else>
	    }
	    function cart()
	    {
	        <s:if test="#session.user==null">
	              alert("请先登录");
	        </s:if>
	        
	        <s:else>
	             window.location.href="<%=path %>/myCart.action";
	        </s:else>
	    }
	    
	    function order()
	    {
	        <s:if test="#session.user==null">
	              alert("请先登录");
	        </s:if>
	        
	        <s:else>
	             window.location.href="<%=path %>/myOrder.action";
	        </s:else>
	    }
	</script>
</head>
<body>
	<div id="Logo">
        <a href="<%=path %>/shopping.jsp" id="logoLink"></a>
    </div>
    <div id="name">
        <h1>海购网</h1>
        <p>HAIGOU SHOPPING</p>
    </div>
    <img src="<%=path %>/images/phone.jpg">
    <p class="p1">全国客服电话<br/><span class="span">020-61787368</span></p>
    <p class="p1">全国加盟电话<br/><span class="span">020-61787331</span></p>
</div>
<div id="Nav">
    <ul>
        <li><a href="<%=path %>/shopping.jsp" id="home">&nbsp;
            <%-- <span class="glyphicon glyphicon-home" aria-hidden="true"></span> --%>
            &nbsp;
            首&nbsp;页&nbsp;&nbsp;</a></li>
        <li><a href="#" onclick="xinxi()">我的信息</a></li>
        <li><a href="#" onclick="cart()">我的购物车</a></li>
        <li><a href="#" onclick="order()">我的订单</a></li>
        <li>
        	<form id="searchForm" action="<%=path %>/goodsAllSearch.action?page=1" method="post">
	        	<input type="text" id="goodsName" name="goodsName" size="25" style="margin:20px;margin-left: 287px;"  />
	        	<input type="submit" value="搜索" style="border:#ccc 1px solid; background-color:#FFFFFF; font-size:12px; padding-top:3px;">
			</form>
		</li>
    </ul>
</body>
</html>
