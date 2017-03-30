<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
String path = request.getContextPath();
%>

<html>
	<head>
        <link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
        
        <script language="javascript">		   	    
			function check()
		    {
		        if(document.formAdd.goodsCatelogId.value==0)
		        {
		            alert("请选择类别");
		            return false;
		        }
		        if(document.formAdd.goodsName.value=="")
		        {
		            alert("请填写商品名称");
		            return false;
		        }
		        if(document.formAdd.goodsMiaoshu.value=="")
		        {
		            alert("请描述下商品");
		            return false;
		        }
		        if(document.formAdd.goodsShichangjia.value=="")
		        {
		            alert("请填写商品价格");
		            return false;
		        }
		        if(document.formAdd.goodsTejia.value=="")
		        {
		            alert("请填写商品特价");
		            return false;
		        }
		        document.formAdd.submit();
		    }
			function over(picPath)
	       {   
			  document.all.img.style.display = "block";
			  document.all.photo.src = ".."+picPath; 
		   }
		   function out()
	       {
			  document.all.img.style.display = "none";
		   }
        </script>
	</head>

<body>
	<form action="<%=path %>/UploadHandleServlet" name="formAdd" method="post" enctype="multipart/form-data">
	    <table class="userinfobar-wrap" width="95%" align="center">
			<tr bgcolor="#e5e5e5">
			    <td colspan="4">&nbsp;&nbsp;&nbsp;>&nbsp;商品修改
			    <input type="hidden" name="goodsId" id="goodsId" value='<s:property value="#request.goods.goodsId"/>'/>
				</td>
			</tr>
			<tr align="center">
			    <td width="25%" align="right">商品类别：</td>
			    <td width="75%" align="left">
                    <select name="goodsCatelogId">
		               <option value="0"><s:property value="#request.goods.goodsCatelogId.catelogName"/></option>
		               <s:iterator value="#request.catelogList" id="list">
		             	  <option>
		             	  	<s:property value="#list.catelogName"/>
	             	  	  </option>
		               </s:iterator>
		            </select>
			    </td>
			</tr>
			<tr>
			    <td width="25%" align="right">商品名称： </td>
			    <td width="75%">
			        <input type="text" name="goodsName" value="<s:property value="#request.goods.goodsName"/>"/>
			    </td>
			</tr>
			<tr>
			    <td width="25%" align="right">商品描述：</td>
			    <td width="75%" >
                	<textarea style="width:500px;height:200px;" name="goodsMiaoshu"><s:property value="#request.goods.goodsMiaoshu"/></textarea>
			    </td>
			</tr>
			<tr>
			    <td width="25%" align="right">商品图片：</td>
			    <td width="75%">
			    	<input type="file" name="goodsPic" size="30" />
			    	<div onmouseover = "over('<%=path %>/<s:property value="#request.goods.goodsPic"/>')" onmouseout = "out()" style="cursor:pointer;">
			    		查看原始图片
			    	</div>
			    	<input type="hidden" name="goodsPic" value='<s:property value="#request.goods.goodsPic"/>'/>
			    </td>
			</tr>
			<tr>
			    <td width="25%"align="right"> 是否为推荐商品：</td>
			    <td width="75%">
			    	&nbsp;
					<input type="radio" name="goodsTuijian" value="是" checked="checked"/>是
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="goodsTuijian" value="否"/>否
			    </td>
			</tr>
			<tr>
			    <td width="25%"align="right"> 市场价格：</td>
			    <td width="75%">
			    <!-- onkeyup+onafterpaste 文本框只能输入数字代码(小数点也不能输入) -->
			        <input type="text" name="goodsShichangjia" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" value='<s:property value="#request.goods.goodsShichangjia"/>' />
			    </td>
			</tr>
			<tr>
			    <td width="25%" align="right"> 特价：</td>
			    <td width="75%">
			        <input type="text" name="goodsTejia" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" value='<s:property value="#request.goods.goodsTejia"/>'/>
			        (<font color="red">为0表示没有特价</font>)
			    </td>
			</tr>
			<tr>
			    <td width="25%" align="right">库存：</td>
			    <td width="75%">
			        <input type="text" name="goodsKucun" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" value='<s:property value="#request.goods.goodsKucun"/>'/>
			    </td>
			</tr>
			<tr>
			    <td width="25%" align="right"></td>
			    <td width="75%">
			       <input type="button" value="提交" onclick="check()"/>&nbsp; 
			       <input type="reset" value="重置"/>
			    </td>
			</tr>
		 </table>
	</form>
	
   	<div id="img" style="margin-left:30px;width:120px; height:120px;display:none;">
		<img id="photo" src="" height="80" width="80">
	</div>
</body>
</html>
