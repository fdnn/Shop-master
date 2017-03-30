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
	     	 <s:if test="#request.gonggaoList.size==0">
	     	 	&nbsp;&nbsp;暂无公告
	     	 </s:if>
	     	 <s:iterator value="#request.gonggaoList" id="gonggao"> 
             <li>>>&nbsp;
			 	<a href='<%=path %>/gonggaoDetail2.action?gonggaoId=<s:property value="#gonggao.gonggaoId"/>'>
		        	<s:property value="#gonggao.gonggaoTitle"/>......
		        </a>
		 	 </li>
		 	 </s:iterator>
	 	 </ul>
	</body>
</html>
