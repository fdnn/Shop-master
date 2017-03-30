<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>小海购物系统</title>
	<link rel="shortcut icon" href="<%=path %>/images/logo.png" type="image/x-icon" />
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="bootstrap3/css/bootstrap.min.css">
    <link rel="stylesheet" href="bootstrap3/css/bootstrap-theme.min.css">
    <script src="bootstrap3/js/jquery-1.11.2.min.js"></script>
    <script src="bootstrap3/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" type="text/css" href="css/base.css">
    <script src="js/shoppingJs.js" type="text/javascript"></script>
</head>
<body class="shoppingBoby">
<!-- 顶部head -->
<div id="header">
    <jsp:include flush="true" page="head.jsp"></jsp:include>
</div>

<!-- 图片轮播 -->
<div id="Banner">
    <jsp:include flush="true" page="banner.jsp"></jsp:include>
</div>

<!--主界面-->
<div id="Main">
	<div style="padding:8px 0px 0px;  margin:0px auto;">
		<!--左边 -->
		<div class="left">
			<!-- 特价 -->
			<div class="main_lr">
				<div class="main_bc">
					<div class="main_bar_shuxing">
						 <span style="float:left">特价</span>
						 <span style="float:right"><a href="<%=path %>/goodsAllYesTejia.action?page=1">更多>></a>&nbsp;&nbsp;&nbsp;&nbsp;</span>
					</div>
					<div class="main_context">
						<table width="100%" align="center" >
							 <tr align="center" >
								<s:iterator value="#request.goodsYesTejiaList1" id="goods1">
								<td>
									<a href="<%=path %>/goodsDetail2.action?goodsId=<s:property value="#goods1.goodsId"/>">
									   <img width="105" height="110" src="<%=path %>/<s:property value="#goods1.goodsPic"/>"/>
									</a>
									<br><s:property value="#goods1.goodsName"/>
									<br><s>市场价:<s:property value="#goods1.goodsShichangjia"/></s>
									<br><font color="#f57921">(特价:<s:property value="#goods1.goodsTejia"/>)</font>
								</td>
								</s:iterator>
							</tr>
							
							<tr align="center" >
								<s:iterator value="#request.goodsYesTejiaList2" id="goods2">
								<td>
									<a href="<%=path %>/goodsDetail2.action?goodsId=<s:property value="#goods2.goodsId"/>">
									   <img width="105" height="110" src="<%=path %>/<s:property value="#goods2.goodsPic"/>"/>
									</a>
									<br><s:property value="#goods2.goodsName"/>
									<br><s>市场价:<s:property value="#goods2.goodsShichangjia"/></s>
									<br><font color="#f57921">(特价:<s:property value="#goods2.goodsTejia"/>)</font>
								</td>
								</s:iterator>
							</tr>
						</table>
					 </div>
				</div>
			</div>
			
			
			<!-- 推荐 -->
			<div class="main_lr">
				<div class="main_bc">
					<div class="main_bar_shuxing">
						 <span style="float:left">推荐</span>
						 <span style="float:right"><a href="<%=path %>/goodsAllYesTuijian.action?page=1">更多>></a>&nbsp;&nbsp;&nbsp;&nbsp;</span>
					</div>
					<div class="main_context">
						<table width="100%" align="center" >
							 <tr align="center" >
								<s:iterator value="#request.goodsYesTuijianList1" id="goodsT1">
								<td>
									<a href="<%=path %>/goodsDetail2.action?goodsId=<s:property value="#goodsT1.goodsId"/>">
									   <img width="105" height="110" src="<%=path %>/<s:property value="#goodsT1.goodsPic"/>"/>
									</a>
									<br><s:property value="#goodsT1.goodsName"/>
									<br><s>市场价:<s:property value="#goodsT1.goodsShichangjia"/></s>
									<br><font color="#f57921">(特价:<s:property value="#goodsT1.goodsTejia"/>)</font>
								</td>
								</s:iterator>
							</tr>
							
							<tr align="center" >
								<s:iterator value="#request.goodsYesTuijianList2" id="goodsT2">
								<td>
									<a href="<%=path %>/goodsDetail2.action?goodsId=<s:property value="#goodsT2.goodsId"/>">
									   <img width="105" height="110" src="<%=path %>/<s:property value="#goodsT2.goodsPic"/>"/>
									</a>
									<br><s:property value="#goodsT2.goodsName"/>
									<br><s>市场价:<s:property value="#goodsT2.goodsShichangjia"/></s>
									<br><font color="#f57921">(特价:<s:property value="#goodsT2.goodsTejia"/>)</font>
								</td>
								</s:iterator>
							</tr>
						</table>
					 </div>
				</div>
			</div>
		</div>
	<!-- 右侧公共模块right -->		
	<jsp:include flush="true" page="right.jsp"></jsp:include>
</div>

<!-- 底部foot -->
<div>
	<jsp:include flush="true" page="foot.jsp"></jsp:include>
</div>
	    
<!--右侧在线客服导航-->
<div class="side">
    <jsp:include flush="true" page="kefu.jsp"></jsp:include>
</div>
</div>
<script type="text/javascript">
	/*参考网上导航栏滚动机制*/
    /*此部分js使用到jQuery*/
    $(function(){
        $(".side ul li").hover(function(){
            $(this).find(".sidebox").stop().animate({"width":"125px"},100).css({"background":"#60b029"})
        },function(){
            $(this).find(".sidebox").stop().animate({"width":"54px"},100).css({"background":"#000"})
        });
    });

    /*回到顶部函数*/
    function goTop(){
        $('html,body').animate({'scrollTop':0},700);//返回顶部动画 数值越小时间越短
    }

    /*导航栏滚动机制*/
    $(function () {
        var ie6 = /msie 6/i.test(navigator.userAgent)
                , dv = $('#Nav'), st;
        dv.attr('otop', dv.offset().top); //存储原来的距离顶部的距离,即100px
        $(window).scroll(function () {
            st = Math.max(document.body.scrollTop || document.documentElement.scrollTop);
            if (st >= parseInt(dv.attr('otop'))) {//滚动超过原来的顶部距离时
                if (ie6) {
                    /*IE6不支持fixed属性，所以只能靠设置position为absolute和top实现此效果*/
                    dv.css({ position: 'absolute', top: st });
                }
                /*滚动超过原来的顶部距离时,定位为固定定位*/
                else if (dv.css('position') != 'fixed') dv.css({ 'position': 'fixed', top: 0 });
                /*滚动小于原来的顶部距离时,定位为绝对定位*/
            } else if (dv.css('position') != 'static') dv.css({ 'position': 'static' });

        });
    });
    /*导航栏二级导航机制*/
    $(function () {
        var ie6 = /msie 6/i.test(navigator.userAgent)
                , dv = $('#Nav ul li ul'), st;
        dv.attr('otop', 100); //存储原来的距离顶部的距离170-70=100px
        $(window).scroll(function () {
            st = Math.max(document.body.scrollTop || document.documentElement.scrollTop);
            if (st >= parseInt(dv.attr('otop'))) {//滚动超过原来的顶部距离时
                if (ie6) {
                    /*IE6不支持fixed属性，所以只能靠设置position为absolute和top实现此效果*/
                    dv.css({ position: 'absolute', top: st });
                }
                /*滚动超过原来的顶部距离时,定位为固定定位,距离顶部70px*/
                else if (dv.css('position') != 'fixed') dv.css({ 'position': 'fixed', top: 70 });
                /*滚动小于原来的顶部距离时,定位为绝对定位,距离顶部170px*/
            } else if (dv.css('position') != 'static') dv.css({ 'position': 'absolute', top: 170 });
        });
    });
</script>
</body>
</html>
