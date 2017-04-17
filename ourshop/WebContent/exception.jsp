<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ include file="/public/head.jspf"%>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/style.css" />
<meta http-equiv=refresh content=3;url="${ourshop }/index.jsp" />
</head>
<body>
	
	<div class="panel-body container" style="background-color: #FFFFFF; margin-top: 100px;">
		<img src="${ourshop }/img/404.jpg"/>
		<h2>404 Not Found !</h2>
		<p>页面发生了一个神奇的错误，三秒后自动跳回到<a href="${ourshop }/index.jsp"> 主页 </a></p>
	</div>
	
	<!--
    	作者：360476710@qq.com
    	时间：2017-03-23
    	描述：jq.js必须放在bootstrap.js之前
    -->
	<script type="text/javascript" src="js/jquery.min.js" ></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/myJs.js" ></script>
	

</body>
</html>
