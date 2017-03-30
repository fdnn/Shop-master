<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
%>
<html>
<head>
</head>
<body>
	<div id="myCarousel" class="carousel slide" data-interval="5000">
        <!--Indicators-->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <!-- Carousel items -->
        <div class="carousel-inner">
            <div class="active item">
                <img src="images/TB2dlzHiXXXXXb7XXXXXXXXXXXX_!!1023691747.jpg" style="height: 500px;width: 1000px">
            </div>
            <div class="item">
                <img src="images/TB2GPkPhVXXXXXnXXXXXXXXXXXX_!!1791947350.jpg" style="height: 500px;width: 1000px">
            </div>
            <div class="item">
                <img src="images/143026wfwf6offfoowlmsf.jpg" style="height: 500px;width: 1000px">
            </div>
        </div>
        <!-- Carousel nav -->
        <a class="carousel-control left" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        </a>
        <a class="carousel-control right" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        </a>
    </div>
</body>
</html>
