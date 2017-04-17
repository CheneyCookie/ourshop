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
	//刷新验证码 
	function reloadCode(){
		var time = new Date().getTime();
		document.getElementById("imcode").src="<%=request.getContextPath()%>/imageCheckcode?d="+time;
	}
		//在加载页面之前确定cookie中是否有用户名和密码，若有，则直接给登录后的页面，否则给游客页面
		//检查当前session中是否有用户名和密码，若有，则给出登录后的页面，否则，给游客页面	
	</script>
	<script type="text/javascript" src="${ourshop }/jquery-validate/jquery.min.js"></script>
	<script type="text/javascript" src="${ourshop }/jquery-validate/jquery.validate.js"></script>
	<script type="text/javascript">
	$(function(){
		
		//自定义方法，完成手机号码验证
		$.validator.addMethod("phone",function(value,element,param){
			//value:被验证的值，element：当前验证的dom对象,param：参数，如果有多个则是数组
			//alert(value+","+$(element).val()+","+param[0]+","+param[1])
			return new RegExp("^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,2,5-9]))\\d{8}$").test(value);
		},"手机号码不正确");
		
		//让当前表单调用validate方法，实现表单验证功能
		$("#ffr").validate({
			//debug:true,		//调试模式，即使验证成功，也不会跳转到目标页面
			//event:"keyup" || "blur",
			//onkeyup:false,	//当丢失焦点的时候才出发验证请求
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
				login:{
					required:true, 	//如果验证方法不需要参数，则配置为true
					rangelength:[4,20],
				},
				password:{
					required:true,
					rangelength:[8,20]
				},
				repassword:{
					required:true,
					equalTo:"#setPassword"
				},
				phone:{
					required:true,
					phone:true,
					remote:{
						url:'user_checkPhone',
						type:"post"
					}
				},
				checkcode:{
					required:true,
					remote:{
						url:'user_checkcode',
						type:"post"
					}
				}
			},
			messages:{
				login:{
					required:"请填写用户名", 	//如果验证方法不需要参数，则配置为true
					rangelength:"用户名长度为4~20个字符",
				},
				password:{
					required:"请填写密码",
					rangelength:$.validator.format("密码长度为{0}~{1}个字符")
				},
				repassword:{
					required:"请再次输入密码",
					equalTo:"两次密码不一致"
				},
				phone:{
					required:"请填写手机号码",
					remote:"该手机号码已被注册"
				},
				checkcode:{
					required:"请输入验证码",
					remote:"验证码错误"
				}
			},
		});
	});
	</script>
	
</head>

<body>
		<!--
	    	作者：360476710@qq.com
	    	时间：2017-03-24
	    	描述：注册标签
	    -->
	    
	    
	    <div class="panel panel-default col-xs-3 col-xs-push-4">
	    	<div class="panel-heading row">
	    		<h1 class="text-center text-primary"><a href="${ourshop }/index.jsp">JustBuy</a></h1>
	    		<h4 class="text-center text-primary">注册成为JustBuy-商城用户</h4>
	    	</div>
	    	
	    	<div class="panel-body" style="border: 0px;">
	    		<form id="ffr" action="user_register" method="post" class="form col-xs-12 center-block">
					<div class="form-group input-group">
						<span class="input-group-addon"><img src="img/iconfont-shouji.png" alt="" /></span>
						<input type="text" class="form-control input-lg" name="phone"  placeholder="请输入您的手机号码" />
					</div>
					
					<div class="form-group input-group">
					</div>
					<div class="form-group input-group">
						<span class="input-group-addon"><img src="img/iconfont-gongyichongwu.png" alt="" /></span>
						<input type="text" class="form-control input-lg" name="login" placeholder="请输入您的昵称" />
					</div>
					<div class="form-group input-group">
					</div>
					

					<div class="form-group input-group">
						<span class="input-group-addon"><img src="img/password.png"/></span>
						<input type="password" name="password" class="form-control input-lg" id="setPassword" placeholder="密码" />
					</div>
					<div class="form-group input-group">
					</div>
					
					<div class="form-group input-group">
					<span class="input-group-addon"><img src="img/password.png"/></span>
						<input type="password" name="repassword" class="form-control input-lg" id="repPassword" placeholder="重复密码" />
					</div>
					<div class="form-group input-group">
					</div>
					
					<div class="form-group input-group">
							<span class="input-group-addon"><img src="img/all.png" alt="" /></span>
							<input type="text" name="checkcode" class="form-control input-lg" name="verify" id="phoneNum" placeholder="验证码" style="width: 50%;"/>
							
							<a href="javascript:reloadCode();"><img id="imcode" alt="验证码" src="<%=request.getContextPath()%>/imageCheckcode"/></a>
					</div>
					
					<div class="form-group input-group">
					</div>
					
					<div class="form-group pull-right">
						<span>已有账号？ </span><a href="login.jsp">返回登录</a>
						
					</div>
					<div class="form-group">
					<button class="btn btn-primary btn-lg btn-block">立即注册</button>								
				</div>
				</form>
	    	</div>
	    	<div class="panel-footer row">
	    										
				<h4 class="text-center text-primary">请注意您的账户安全</h4>
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