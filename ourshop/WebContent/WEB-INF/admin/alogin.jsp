<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/public/head.jspf"%>
	<link rel="stylesheet" href="${ourshop }/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${ourshop }/css/style.css" />
	<script type="text/javascript" src="${ourshop }/jquery-validate/jquery.min.js"></script>
	<script type="text/javascript" src="${ourshop }/jquery-validate/jquery.validate.js"></script>
	<script type="text/javascript">
	$(function(){
		
		$("#ffl").validate({
			//debug:true,		//调试模式，即使验证成功，也不会跳转到目标页面
			//event:"keyup" || "blur",
			//onkeyup:true,	//当丢失焦点的时候才出发验证请求
			onkeyup:false,
			errorElement:"label",
			errorPlacement:function(error,element){      //定义错误消息存放的位置
				$(element).parent().next().html(error);
			},
			//success:"ok",	//成功的样式
			//errorPlacement:function(error,element){      //定义错误消息存放的位置
				//$(element).parent().next().html(error);
			//},
			rules:{		//配置验证规则 key是验证的dom对象（文本框）,value：调用的验证方法
				password:{
					required:true,
				},
				name:{
					required:true,
				}
			},
			messages:{
				password:{
					required:"请输入密码",
				},
				name:{
					required:"请输入登录名",
				},
			},
		});
		
		$("#loginPhone").focus(function(){
			$("#error").html("");
		})
		$("#loginPassword").focus(function(){
			$("#error").html("");
		})
		
	});
	</script>
	
</head>

<body>
	<div class="panel panel-default col-xs-3 col-xs-push-4">
		<div class="panel-heading row">
			<h1 class="text-center text-primary"><a href="${ourshop }/index.jsp">JustBuy</a></h1>
			<h4 class="text-center text-primary">登录后台管理系统</h4>
		</div>
		<div class="panel-body" style="border: 0px;">
			<form id="ffl" action="admin_login" method="post" class="form col-xs-12 center-block">
				<div class="form-group input-group">
					<span class="input-group-addon"><img src="img/account.png" alt="" /></span>
					<input type="text" class="form-control input-lg" name="name" id="loginPhone" placeholder="手机号码" />
				</div>
				<div class="form-group input-group">
				</div>
				<div class="form-group input-group">
					<span class="input-group-addon"><img src="img/password.png" alt="" /></span>
					<input type="password" name=password class="form-control input-lg" id="loginPassword" placeholder="用户密码" />
				</div>
				<div class="form-group input-group">
				</div>
				<div class="form-group">
					<button class="btn btn-primary btn-lg btn-block">立即登录</button>								
				</div>
			</form>
		</div>
		<div class="panel-footer row">
			<h4 id="error" class="text-center text-primary">${session.error }</h4>
		</div>
	</div>


	<!--
    	作者：360476710@qq.com
    	时间：2017-03-23
    	描述：jq.js必须放在bootstrap.js之前
    -->
	
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
		
</body>
</html>