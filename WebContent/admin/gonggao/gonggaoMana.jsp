<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
    <script language="javascript">
       function gonggaoAdd()
       {
          window.location.href="<%=path %>/admin/gonggao/gonggaoAdd.jsp";
       }
       
       function gonggaoDetail(gonggaoId)
       {
             var url="<%=path %>/gonggaoDetail.action?gonggaoId="+gonggaoId;
             //openWin(url,"","480px","500px","resizable:no;help:no;status:no;scroll:yes");
			 //showModalDialog(url,"",'dialogWidth:400px;dialogHeight:300px; dialogLeft:200px;dialogTop:150px;center:yes;help:yes;resizable:yes;status:yes') 
           	 window.open (url, "_blank", "height=500px, width=480px, toolbar= no, menubar=no, scrollbars=no, resizable=no, location=no, status=no,top=0,left=0")
       }
   </script>
</head>
<body>
	<table class="userinfobar-wrap" width="95%" align="center">
		<tr bgcolor="#e5e5e5">
	    	<td colspan="4">&nbsp;&nbsp;&nbsp;>&nbsp;公告</td>
		</tr>
		<tr align="center" bgcolor="#FAFAF1" height="22">
			<td width="25%">标题</td>
			<td width="25%">发布时间</td>
			<td width="25%">内容</td>
			<td width="25%">操作</td>
        </tr>	
		<s:iterator value="#request.gonggaoList" id="gonggao">
			<tr align="center">
				<td>
					 <s:property value="#gonggao.gonggaoTitle"/>
				</td>
				<td>
					<s:property value="#gonggao.gonggaoData"/>
				</td>
				<td>
				    <a href="#" onclick="gonggaoDetail(<s:property value="#gonggao.gonggaoId"/>)">查看内容</a>
				</td>
				<td>
					<a href="<%=path %>/gonggaoDel.action?gonggaoId=<s:property value="#gonggao.gonggaoId"/>" class="deleteLink">删除</a>
				</td>
			</tr>
		</s:iterator>
	</table>
		
	<table width="95%" align="center">
	  <tr>
	    <td>
	      <input type="button" value="添加公告" style="width: 80px;" onclick="gonggaoAdd()" />
	    </td>
	  </tr>
    </table>
</body>
</html>
