<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<script type="text/javascript" src="<%=path %>/js/jquery-1.7.1.min.js"></script> 
	<script type="text/javascript" src="<%=path %>/js/xheditor-1.1.14-zh-cn.min.js"></script>
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
	        //使用xheditor的textarea的取值问题
	        if($('#textarea_id').val()=="")
	        {
	            alert("请描述下商品");
	            return false;
	        }
	        if(document.formAdd.goodsPic.value=="")
	        {
	            alert("请上传商品图片");
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
	</script>
</head>
<body>
	<form action="<%=path %>/UploadHandleServlet" name="formAdd" method="post" enctype="multipart/form-data">
	    <table class="userinfobar-wrap" width="95%" align="center">
			<tr bgcolor="#e5e5e5">
			    <td colspan="4">&nbsp;&nbsp;&nbsp;>&nbsp;商品添加</td>
			</tr>
			<tr align="center">
			    <td width="25%" align="right">商品类别：</td>
			    <td width="75%" align="left">
                    <select name="goodsCatelogId">
		               <option value="0">--请选择商品类别--</option>
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
			        <input type="text" name="goodsName"/>
			    </td>
			</tr>
			<tr>
			    <td width="25%" align="right">商品描述：</td>
			    <td width="75%" >
                <!-- 	<textarea style="width:500px;height:200px;" name="goodsMiaoshu"></textarea> -->
                	<textarea class="xheditor-mfull" id="textarea_id" style="width:500px;height:200px;" name="goodsMiaoshu"></textarea> 
			    </td>
			</tr>
			<tr>
			    <td width="25%" align="right">商品图片：</td>
			    <td width="75%">
			    	<input type="file" name="goodsPic" size="30"/>
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
			        <input type="text" name="goodsShichangjia" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
			    </td>
			</tr>
			<tr>
			    <td width="25%" align="right"> 特价：</td>
			    <td width="75%">
			        <input type="text" name="goodsTejia" value="0" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
			        (<font color="red">为0表示没有特价</font>)
			    </td>
			</tr>
			<tr>
			    <td width="25%" align="right">库存：</td>
			    <td width="75%">
			        <input type="text" name="goodsKucun" value="0" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
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
</body>
</html>
