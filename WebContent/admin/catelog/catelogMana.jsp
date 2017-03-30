<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
	
    <script language="javascript">
       function catelogDel(catelogId)
       {
           if(confirm('您确定删除吗？'))
           {
        	   
        	   var url="<%=path %>/catelogDel.action?catelogId="+catelogId;
               window.location.href=url;
           }
       }
       
       function catelogAdd()
       {
			var url="<%=path %>/admin/catelog/catelogAdd.jsp";
			window.location.href=url;
       }
   </script>
</head>
<body>
	<table class="userinfobar-wrap" width="95%" align="center">
		<tr bgcolor="#e5e5e5">
	    	<td colspan="4">&nbsp;&nbsp;&nbsp;>&nbsp;商品类别管理</td>
		</tr>
		<tr align="center" bgcolor="#FAFAF1" height="22">
			<td width="25%">ID</td>
			<td width="25%">分类名称</td>
			<td width="25%">分类描述</td>
			<td width="25%">操作</td>
        </tr>	
		<s:iterator value="#request.catelogList" id="catelog">
		<tr align="center">
			<td>
				<s:property value="#catelog.catelogId"/>
			</td>
			<td>
				<s:property value="#catelog.catelogName"/>
			</td>
			<td>
			    <s:property value="#catelog.catelogMiaoshu"/>
			</td>
			<td>
				<a href="#" onclick="catelogDel(<s:property value="#catelog.catelogId"/>)" class="deleteLink">删除</a>
			</td>
		</tr>
		</s:iterator>
	</table>
	
	<table width="95%" align="center">
	  <tr>
	    <td>
	      <input type="button" value="添加分类" style="width: 80px;" onclick="catelogAdd()" />
	    </td>
	  </tr>
    </table>
</body>
</html>
