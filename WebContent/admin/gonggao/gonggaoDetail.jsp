<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
    
  </head>
  
  <body>
        <table align="center">
          <tr>
             <td>
                  <s:property value="#request.gonggao.gonggaoContent" />
             </td>
          </tr>
      </table>
  </body>
</html>
