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
           function goodsDetail(goodsId)
           {
                 var url="<%=path %>/goodsDetail.action?goodsId="+goodsId;
                 //openWin(url,"","480px","500px","resizable:no;help:no;status:no;scroll:yes");
 			     //showModalDialog(url,"",'dialogWidth:400px;dialogHeight:300px; dialogLeft:200px;dialogTop:150px;center:yes;help:yes;resizable:yes;status:yes') 
                 window.open (url, "_blank", "height=500px, width=480px, toolbar= no, menubar=no, scrollbars=no, resizable=no, location=no, status=no,top=0,left=0")
           }
           
           function goodsDel(goodsId)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/goodsDel.action?goodsId="+goodsId;
               }
           }
           
           // 修改商品
           function goodsUpd(goodsId)
           {
               if(confirm('您确定修改吗？'))
               {
                   window.location.href="<%=path %>/goodsDate.action?goodsId="+goodsId;
               }
           }
           
           
           function goodsAdd()
           {
                 <%-- var url="<%=path %>/admin/goods/goodsAdd.jsp";
				 window.location.href=url; --%>
				 window.location.href="<%=path %>/catelogList.action";
           }
           
           function over(picPath)
	       {
			  if (picPath=="")
				  picPath="/images/default.jpg";     
			  document.all.img.style.display = "block";
			  //x = event.clientX;
			  //y = event.clientY; 
			  //document.all.img.style.top = y;
			  //document.all.img.style.left = x+10;
			  document.all.photo.src = ".."+picPath; 
		   }
		   function out()
	       {
			  document.all.img.style.display = "none";
		   }		
       </script>
	</head>

	<body>
			<table class="userinfobar-wrap" width="95%" align="center" >
				<tr bgcolor="#e5e5e5">
			    	<td colspan="9">&nbsp;&nbsp;&nbsp;>&nbsp;商品管理</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="10%">ID</td>
					<td width="10%">商品名称</td>
					<td width="10%">商品描述</td>
					<td width="10%">分类</td>
					<td width="10%">商品图片</td>
					<td width="10%">市场价格</td>
					<td width="10%">特价</td>
					<td width="10%">库存</td>
					<td width="10%">操作</td>
		        </tr>	
				<s:iterator value="#request.goodsList" id="goods">
				<tr align="center">
					<td >
						<s:property value="#goods.goodsId"/>
					</td>
					<td >
						<s:property value="#goods.goodsName"/>
					</td>
					<td >
					    <a href="#" onclick="goodsDetail(<s:property value="#goods.goodsId"/>)">商品描述</a>
					</td>
					<td >
					    <s:property value="#goods.goodsCatelogId.catelogName"/>
					</td>
					<td >
					   <!-- <img src="..#goods.goodsPic" alt="" /> -->
					   <div onmouseover = "over('<%=path %>/<s:property value="#goods.goodsPic"/>')" onmouseout = "out()" style="cursor:pointer;">
					         	查看图片
					   </div>
					</td>
					<td >
					     <s:property value="#goods.goodsShichangjia"/>
					</td>
					<td >
					     <s:if test="#goods.goodsIsnottejia=='no'">
					     	无特价
					     </s:if>
					     <s:if test="#goods.goodsIsnottejia=='yes'">
					        <s:property value="#goods.goodsTejia"/>
					     </s:if>
					</td>
					<td >
					     <s:property value="#goods.goodsKucun"/>
					</td>
					<td >
						<a href="#" onclick="goodsUpd(<s:property value="#goods.goodsId"/>)">修改</a> &nbsp;
						<a href="#" onclick="goodsDel(<s:property value="#goods.goodsId"/>)" class="deleteLink">删除</a>
					</td>
				</tr>
				</s:iterator>
			</table>
			
			<table width="95%" align="center">
			  <tr>
			    <td>
			        <input type="button" value="添加商品" style="width: 80px;" onclick="goodsAdd()" />
			    </td>
			  </tr>
		    </table>
		    
		    <div id="img" style="margin-left:30px;width:120px; height:120px;display:none;">
				<img id="photo" src="" height="80" width="80">
			</div>
	</body>
</html>
