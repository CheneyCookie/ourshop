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
			//alert($("#lgPic_list li:first").children("img").attr("src"));
			//alert($("#shopcar_fly").offset());
			$("#shop_pro").click(function(){
				var isHave=null;
				$.post("shopCar_add",{number:$("#pro_number").val(),'product.id':$("#hidden_id").val()},function(result){
					isHave=result;
					if(isHave!="true"){
						location.href="${ourshop }/login.jsp";
					//alert(result);
					}
				},"text")
			})
			
			
			var offset=$("#shopcar_fly").offset();
			$("#shop_pro").click(function(event){
				//var img=$("#lgPic_list li:first").children("img").attr("src");
				var flyer=$('<img src="${ourshop}/img/shopcar_fly.png"/>');
				//var flyer=$('<span>起个名字蒸的好难</span>');
				flyer.fly({
					start:{
						left:event.pageX,
						top:event.pageY
					},
				end:{
					left:offset.left+10,
					top:offset.top+10,
				},
				onEnd: function(){
					this.destory();
				}
				})
			})
			
			$(function(){
				$("#mydetail").click(function(){
					$.post("order_queryByUid");
					$.post("collection_queryByUid");
					$.post("address_queryJoinUser",function(){
						location.href="${ourshop }/user/myinformation.jsp";
					});
				})
			})
			
			$("#buy_pro").click(function(){
				$.post("shopCar_buyRightNow",{number:$("#pro_number").val(),'product.id':$("#hidden_id").val()},function(){
					location.href="${ourshop }/user/order.jsp";
				})
			})
		})
	</script>
</head>

<body>
	<!--
    	作者：360476710@qq.com
    	时间：2017-03-22
    	描述：搜索栏
    -->
	<div id="header">
		<nav class="navbar navbar-inverse">
			<div class="container">			
				<div class="navbar-header">
					<a href="${ourshop }/index.jsp" class="navbar-brand">JustBuy</a>
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menu">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div>
					
				<div>
					<form action="product_queryBySearch" method="post" class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" name="name" id="search" placeholder="search" />
							<button type="submit" class="btn btn-default">搜  索</button>
						</div>
					</form>
				</div>
				
				<c:if test="${empty sessionScope.user}">
				<div id="unLogin" class="show">				
					<ul class="nav navbar-nav navbar-right">
						<li class="" data-toggle="modal" data-target="#loginModal"><a href="${ourshop }/login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
						<li class="" data-toggle="modal" data-target="#registerModal"><a href="${ourshop }/register.jsp"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
					</ul>					
				</div>
				</c:if>
				<c:if test="${!empty sessionScope.user}">
				<div id="logined" class="show">				
					<ul class="nav navbar-nav navbar-right">
						<li class="" data-toggle="" ><a id="mydetail" href="javascript:;"><span class="glyphicon glyphicon-home"></span> 个人中心</a></li>
						<li class="" ><a href="${ourshop }/shopCar_queryByUid"><span id="shopcar_fly" class="glyphicon glyphicon-shopping-cart"></span> 购物车</a></li>
						<li class="" ><a href="user_out"><span class="glyphicon glyphicon-shopping-cart"></span> 退出</a></li>
					</ul>					
				</div>
				</c:if>
			</div>		
		</nav>
		
	<!--
	    	作者：360476710@qq.com
	    	时间：2017-03-22
	    	描述:导航栏
	 -->
	 	<div id="menu" class="container navbar-collapse collapse">
			<ul class="nav navbar-nav col-md-12">
				<c:forEach items="${applicationScope.categories }" var="category">
					<li><a href="product_queryByAllCategory?categoryName=${category.type }">${category.type }</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	
	
	
	<!--
    	作者：360476710@qq.com
    	时间：2017-04-02
    	描述：商品详细页面
   -->   
    <div class="container">	
		<div class="panel row">
			<ul id="smPic_list" class=" col-xs-1" style="padding-top: 50px; z-index: 1999;">
				<c:forEach items="${detailP }" var="pic">
					<li class=""><a href="javascript:;" ><img src="${ourshop }/image/${pic}" class="img-thumbnail img img-responsive" style="
						width: 60px;"/></a></li>
				</c:forEach>
			</ul>
			<ul id="lgPic_list" class="col-xs-6">
				<c:forEach items="${detailP }" var="pic">
					<li class="hidden"><img style="width:80%; height:80%" src="${ourshop }/image/${pic}" alt=""/></li>
				</c:forEach>
			</ul>				
			
			<div class="col-xs-5 pull-right">
				<div class="panel ">
					<h3>${product.name }</h3>
					<p>${product.remark }</p>
					<h4 style="color: darkgoldenrod;"><b>¥${product.price }</b></h4>
				</div>
				
				<div class="panel btn-group" data-toggle="buttons">	
					<label for="" class="btn btn-primary active">
						<input type="radio" name="" id="" value="" autocomplete="off" checked="checked"/>灰色
					</label>
					<label for="" class="btn btn-primary">
						<input type="radio" name="" id="" value="" autocomplete="off" />蓝色
					</label>					
				</div>
				
				<div style="padding: 10px auto;">
					<input id="pro_number" type="number" min="1" name="number" id="number" value="1" style="width: 50px; border-radius: 4px; border: 1px solid skyblue;"/>
				</div>
				<div class="panel">
					<input id="hidden_id" type="hidden" name="product.id" value="${product.id }">
					<input id="buy_pro" type="button" class="btn btn-primary" value="立即购买" />
					<input id="shop_pro" type="button" class="btn btn-default" value="加入购物车" />	
				</div>
				<div>
					<p><span class="glyphicon glyphicon-ok-circle"></span> 支持七天无理由退换</p>
					<p><span class="glyphicon glyphicon-ok-circle"></span> balbalalbalbalbabalablablba</p>
				</div>
			</div>
		</div>
		
		<div class="panel panel-default">
			<div class="panel-heading ">
				<h3>详细介绍</h3>
			</div>
				
			
			<div id="detail_pic" class="panel-body">
				<c:forEach items="${remarkP }" var="pic">
					<img src="${ourshop }/image/${pic}" alt=""  />
				</c:forEach>
			</div>
		</div>
		
	</div>
	
	
	
	
	
	
	<div id="back_top"><a href="javascript:;"><img src="img/upBtn.png"/></a></div>
	
	<footer id="footer">
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
	<script type="text/javascript" src="${ourshop }/jquery-fly/jquery.fly.js"></script>
	<script type="text/javascript">
		
		//设置导航栏识别锁定
		$(window).scroll(function(){
			if($(this).scrollTop()>100){
				$('#menu').addClass('navbar-fixed-top fixMenu');
			}else{
				$('#menu').removeClass('navbar-fixed-top fixMenu');
			}
		})
/

		
		//返回顶部
		$(document).ready(function(){
			$('#back_top').hide();
			$(window).scroll(function(){
				if($(this).scrollTop()>100){
					$('#back_top').fadeIn(500);
				}else{
					$('#back_top').fadeOut(500);
				}
			})
			
		})
		
		$('#back_top').click(function(){
			$('body,html').animate({scrollTop:0},100); 
			return false;
		})
		
		
		//取索引值，两两对应
		now = 0;
		var aLi = $('#smPic_list').children('li');
		var aLi_lg = $('#lgPic_list').children('li');
		$(window).ready(function(){
			$(aLi_lg[0]).removeClass('hidden');
			$(aLi_lg[0]).addClass('show');
		});
		
		for(var i=0; i<aLi.length;i++){
			aLi[i].index = i;
			$(aLi[0]).addClass('active_3');
			$(aLi[i]).click(function(){			
				now = $(this).index();
			
				$(aLi_lg).addClass('hidden');
				$(aLi_lg[now]).removeClass('hidden');
				$(aLi_lg[now]).addClass('show');
				$(aLi).removeClass('active_3');
				$(aLi[now]).addClass('active_3');
			})		
		}
				
		</script>

</body>
</html>