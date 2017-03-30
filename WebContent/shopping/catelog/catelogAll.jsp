<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
%>

<html>
	<head>
	<link rel="shortcut icon" href="<%=path %>/images/logo.png" type="image/x-icon" />
	</head>
	<body>
	     <ul align="left">
	     	 <s:if test="#request.catelogList.size==0">
	     	 	&nbsp;&nbsp;暂无商品类别
	     	 </s:if>
	     	 <s:iterator value="#request.catelogList" id="catelog"> 
             <li>>>&nbsp;
			 	<a href='<%=path %>/goodsByCatelog.action?catelogId=<s:property value="#catelog.catelogId"/>'>
		        	<s:property value="#catelog.catelogName"/>
		        </a>
		 	 </li>
		 	 </s:iterator>
	 	 </ul>
	</body>
</html>
