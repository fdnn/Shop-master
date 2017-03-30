<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
%>
<html>
<head>
</head>
<body>
	<ul>
        <li>
            <a href="javascript:void(0);">
                <div class="sidebox"><img src="images/kefu.png">客服中心</div>
            </a>
        </li>
        <li>
            <a href="javascript:void(0);" >
                <div class="sidebox"><img src="images/qq.png">QQ客服</div>
            </a>
        </li>
        <li>
            <a href="javascript:void(0);" >
                <div class="sidebox"><img src="images/weibo.png">新浪微博</div>
            </a>
        </li>
        <li>
            <a href="javascript:goTop();" class="sidetop"><img src="images/top.png">
            </a>
        </li>
    </ul>
</body>
</html>
