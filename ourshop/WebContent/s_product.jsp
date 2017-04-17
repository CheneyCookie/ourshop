<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/public/head.jspf"%>
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<link rel="stylesheet" href="css/style.css" />
	
	<script type="text/javascript">
	$(window).ready(function(){
		//console.log("滚动条到顶部的垂直高度: "+$(document).scrollTop());  
		//console.log("页面的文档高度 ："+$(document).height());  
		//console.log('浏览器的高度：'+$(window).height()); 
		var line=2;
		var $i=0;
		var $tf=true;
		$(window).scroll(function(){
				if($tf==true){
				//	console.log("滚动条到顶部的垂直高度: "+$(document).scrollTop()); 
				//	console.log($(document).height()-$(window).scrollTop());
			if($(document).height()-$(window).scrollTop()-$(window).height()<100){
				$tf=false;
				$.post("product_queryByScrollLine",{line:line},function(product){
					if(product!=null){
					$.each(product,function(key,value){
						if($i%4==0&&$i!=0){
							var tdiv=$('<div>').addClass('panel-heading row').appendTo($('#main'));
							var h3=$('<h3>').addClass('panel-title').text('').appendTo($(tdiv));
						}
						$i++;
						//alert($(value).attr('name'));
						var pdiv=$('<div>').addClass('panel-body col-xs-3 text-center index_show').appendTo($('#main'));
						var urldiv=$('<div>').attr('id','index_pic').appendTo($(pdiv));
						var a=$('<a>').attr('href','product_get?id='+$(value).attr('id')).appendTo($(urldiv));
						var img=$('<img>').attr('src','image/'+$(value).attr('picture')).appendTo($(a));
						var namediv=$('<div>').appendTo($(pdiv));
						var h=$('<h6>').text($(value).attr('name')).appendTo($(namediv));
						var p=$('<p>').text($(value).attr('remark')).appendTo($(namediv));
						var p2=$('<p>').appendTo($(pdiv));
						var i=$('<i>').text('¥').appendTo($(p2));
						var span=$('<span>').text($(value).attr('price')).appendTo($(p2));
						var adddiv=$('<div>').attr('class','btn_list').appendTo($(pdiv));
						var button=$('<button>').attr('id','btn_addToCart').attr('title',$(value).attr('id')).addClass('btn btn-default btn-group-xs').text('加入收藏').appendTo($(adddiv));
						//alert('a');
						//$tf=true;
						//$("#btn_list").css('visibility','hidden'); 
						var test=setTimeout(function(){$tf=true},500);
						$(".btn_list").css('visibility','hidden');
					});
				}
					
					$('.index_show').mouseenter(function(){
						$(this).addClass('inShadow');
						console.log($(this).children("div:last-child").val());
						$(this).children("div:last-child").css('visibility','visible'); 
						
					})
					
					$('.index_show').mouseleave(function(){
						$(this).removeClass('inShadow');
						$(this).children("div:last-child").css('visibility','hidden'); 
						
					})	
				},"json");
				
				
				
				
				
				$(".btn_list").children("button").click(function(){
					var isHave=null;
					//alert("b");
					$.post("collection_add",{'product.id':$(this).attr("title")},function(result){
						isHave=result;
						if(isHave!="true"){
							location.href="${ourshop }/login.jsp";
						}
					},"text");
						
				});
				line+=2;
				}
			}
				
		})
		
	})
	$(function(){
		$(".btn_list").children("button").click(function(){
			var isHave=null;
			//alert("b");
			var $time="true";
			if($time=="true"){
				$.post("collection_add",{'product.id':$(this).attr("title")},function(result){
					time="false"
					isHave=result;
					if(isHave!="true"){
						location.href="${ourshop }/login.jsp";
					//alert(result);
					}
					var test=setTimeout(function(){$time=true},500);
				},"text");
			}
		});
		
		$(function(){
			$("#mydetail").click(function(){
				$.post("order_queryByUid");
				$.post("collection_queryByUid");
				$.post("address_queryJoinUser",function(){
					location.href="${ourshop }/user/myinformation.jsp";
				});
			})
		})
	});
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
						<li class="" ><a href="${ourshop }/shopCar_queryByUid"><span class="glyphicon glyphicon-shopping-cart"></span> 购物车</a></li>
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
		

	<div class="panel panel-default container">
		<div class="panel-heading row">
			<h3 class="panel-title">
				与${applicationScope.search }相关商品
			</h3>
		</div>
		<!--
        	作者：360476710@qq.com
        	时间：2017-03-24
        	描述：自动生成该模块，用于加载商品显示
        -->
		
		<c:forEach items="${applicationScope.productBySearch }" var="product">
			<div class="panel-body col-xs-3 text-center index_show">
				<div id="index_pic">
					<a href="${ourshop }/product_get?id=${product.id }"><img src="${ourshop }/image/${product.picture }"/></a>
				</div>
					<div>
						<h6>${product.name }</h6>
						<p>${product.remark }</p>
					</div>
					<p>
						<i>¥</i>
						<span>${product.price }</span>
					</p>
					<div class="btn_list" id="btn_list">
						<button id="btn_addToCart" title="${product.id }" class="btn btn-default btn-group-xs">加入收藏</button>
					</div>		
			</div>
		</c:forEach>
	</div>
	
	<div id="main" class="panel panel-default container">
		<div class="panel-heading row">
			<h3 class="panel-title">
				猜你喜欢
			</h3>
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
	<script type="text/javascript" src="js/jquery.min.js" ></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/myJs.js" ></script>
	

</body>
</html>