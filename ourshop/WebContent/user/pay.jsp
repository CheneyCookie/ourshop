<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/public/head.jspf"%>
	<link rel="stylesheet" href="${ourshop }/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${ourshop }/css/style.css" />
	<script type="text/javascript">
	$(function(){
		$("#mydetail").click(function(){
			$.post("order_queryByUid");
			$.post("collection_queryByUid");
			$.post("address_queryJoinUser",function(){
				location.href="${ourshop }/user/myinformation.jsp";
			});
	})
	$("#pay_success").click(function(){
			alert('支付成功')	
		})
	})
	</script>
</head>

<body>
	<!--
    	作者：360476710@qq.com
    	时间：2017-03-22
    	描述：第一次菜单搜索
    -->
	<div id="header">
		<nav class="navbar navbar-inverse">
			<div class="container">			
				<div class="navbar-header">
					<a href="${ourshop }/index.jsp" class="navbar-brand">JustBuy</a>
					<!--<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menu">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>-->
				</div>
					
				<div>
					<form action="${ourshop }/product_queryBySearch" class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" name="name" id="search" placeholder="search" />
							<button type="submit" class="btn btn-default">搜  索</button>
						</div>
					</form>
				</div>
				<div id="logined" class="show">				
					<ul class="nav navbar-nav navbar-right">
						<li class="" data-toggle="" ><a id="mydetail" href="javascript:;"><span class="glyphicon glyphicon-home"></span> 个人中心</a></li>
						<li class="" ><a href="${ourshop }/shopCar_queryByUid"><span class="glyphicon glyphicon-shopping-cart"></span> 购物车</a></li>
					</ul>					
				</div>
			</div>		
		</nav>	 	
	</div>
	
	
	<!--
    	作者：360476710@qq.com
    	时间：2017-04-08
    	描述：支付前信息确认
    -->
	<div class="panel panel-default container" style="line-height: 2;">
		<div class="panel-heading row">
			<h4>支付前确认</h4>
		</div>
		<div class="panel-body">
			<div class="form-inline">
				<span class="form-group">订单号：</span>
				<p class="form-group">${order.id }</p>
			</div>
			
			<div class="form-inline">
				<span class="form-group">收件人：</span>
				<p class="form-group">${order.name }</p>
			</div>
			<div class="form-inline">
				<span class="form-group">手机号码：</span>
				<p class="form-group">${order.phone }</p>
			</div>
			
			<div class="form-inline">
				<span class="form-group">收件地址：</span>
				<p class="form-group">${order.address }</p>
			</div>
			<div class="form-inline">
				<span class="form-group">应付总额：</span>
				<p class="form-group">${order.total }</p>
			</div>			
		</div>
	</div>
		
	
	<div class="panel panel-default container" style="line-height: 2;">
		<div class="panel-heading row">
			<h4>请进行支付前确认</h4>
		</div>
		
		<div class="panel-body">
			<c:forEach items="${applicationScope.bankList}" var="name">
				<div class="col-xs-3  address_list" style="margin-bottom: 20px;">
					<img src="${ourshop}/image/bank/${name}" class="center-block" alt=""/>
				</div>
			</c:forEach>
		</div>
		<div class="panel-footer row">
			<button id="pay_success" class="btn btn-primary pull-right">确认支付</button>
		</div>
	</div>
          <!--
          	作者：360476710@qq.com
          	时间：2017-04-08
          	描述：panel
          -->
          
    
		
	
	
		
	
		
		
	
	
		
	
	<div id="back_top"><a href="javascript:;"><img src="${ourshop }/img/upBtn.png"/></a></div>
	
	<footer id="footer" class="" >
		<div class="container">
			<p>联系我们 | 鸣谢列表 | 团队主页 </p>
			<p>赣ICP 备12123. @Team-名字蒸的好难取  Powerd by Bootstrap.</p>
		</div>
	</footer>




















	<!--
    	作者：360476710@qq.com
    	时间：2017-03-23
    	描述：jq.js必须放在bootstrap.js之前
    -->
	<script type="text/javascript" src="${ourshop }/js/jquery.min.js" ></script>
	<script type="text/javascript" src="${ourshop }/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ourshop }/js/myJs.js" ></script>

	

</body>

</html>