<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<html>
  <head>
	<link rel="shortcut icon" href="<%=path %>/images/logo.jpg" type="image/x-icon" />
  </head>
  <body>
      <script type="text/javascript">
          var url="<%=path %>/shopping.action"
          window.location.href=url;
      </script>
  </body>
</html>
