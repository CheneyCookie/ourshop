<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/public/head.jspf"%>
	<% response.setHeader("cache-control", "no-store"); %>
	<link rel="stylesheet" href="${ourshop }/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${ourshop }/css/style.css" />
	<script type="text/javascript">
		$(function(){
			//alert($(".order_price").length);
			var total=0;
			$(".order_price").each(function(){
				//alert(($(this).html()));
				total=total+Number($(this).html());
			})
			$("#total_price").html(total);
			
			
			$("#order_add_address").click(function(){
				var name=$("#save_name").val();
				var phone=$("#save_phone").val();
				var addName=$("#save_address").val();
				$.ajax({
					type:"post",
					url:"address_save",
					//dataType:"json",
					data:{name:$("#save_name").val(),phone:$("#save_phone").val(),addName:$("#save_address").val()},
					success:function(){
						//alert(name);
						//alert('a');
						var fdiv=$('<div>').addClass('panel-body col-xs-3 index_show address_list').appendTo('#address_div');
						var mdiv=$('<div>').addClass('form-group').appendTo($(fdiv));
						var h4=$('<h4>').text(name).appendTo($(mdiv));
						var p=$('<p>').text(phone).appendTo($(mdiv));
						var p=$('<p>').text(addName).appendTo($(mdiv));
						var updiv=$('<div>').addClass('btn-group form-group').attr('data-toggle','buttons').appendTo($(fdiv));
						var ubutton=$('<button>').addClass('btn btn-info').attr('data-toggle','modal').attr('href','#address_EditModal').text('修改').appendTo($(updiv));
						var ubutton=$('<button>').addClass('btn btn-info').text('删除').appendTo($(updiv));
						$('#address_AddModal').modal('hide');
						
						$('.index_show').mouseenter(function(){
							$(this).addClass('inShadow');
							$(this).find("#btn_list").css('visibility','visible'); 
							
						})
						
						$('.index_show').mouseleave(function(){
							$(this).removeClass('inShadow');
							$(this).find("#btn_list").css('visibility','hidden'); 
							
						})
						$('.address_list').click(function(){
							$('.address_list').removeClass('address_selected');
							$(this).addClass('address_selected');
							//拿着这个获取收货地址
						})
						
					},
					error:function(){
						alert('出错了');
					}
					
				})
				
			})
			
			$(".update_address").click(function(){
				var id=$(this).parent("div").prev().children("input").val();
				var name=$(this).parent("div").prev().children("h4").html();
				var phone=$(this).parent("div").prev().children(".img_phone").html();
				var addName=$(this).parent("div").prev().children(".img_addName").html();
				//alert(id)
				//alert(name)
				$("#update_id").attr('value',id);
				$("#update_name").attr('value',name);
				$("#update_phone").attr('value',phone);
				$("#update_address").attr('value',addName);
			})
			
			$("#order_update_address").click(function(){
				var id=$("#update_id").val();
				var name=$("#update_name").val();
				var phone=$("#update_phone").val();
				var addName=$("#update_address").val();
				$.ajax({
					type:"post",
					url:"address_update",
					//dataType:"json",
					data:{id:id,name:name,phone:phone,addName:addName},
					success:function(){
						//alert(name);
						//alert('a');
						$('#address_AddModal').modal('hide');
						window.location.reload();
					},
					error:function(){
						alert('出错了');
					}
					
				})
			})
			
			$(".delete_address").click(function(){
				var id=$(this).parent("div").prev().children("input").val();
				$.post("address_delete",{id:id},function(){
					window.location.reload();
				})
			})
			
			$("#save_order").click(function(){
				var name=$(".address_selected").children("div").children("h4").html();
				var phone=$(".address_selected").children("div").children("h4").next().html();
				alert(phone)
				var address=$(".address_selected").children("div").children("h4").next().next().html();
				//alert(name);
				if($("div").is(".address_selected")){
					//alert($("#total_price").html())
					$.post("order_save",{name:name,phone:phone,address:address,message:"??",total:$("#total_price").html()},function(){
						location.href="${ourshop }/user/pay.jsp";
					})
				}else{
					alert("请选择地址");
				
				}
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
		})
	</script>
</head>
<body>

<c:if test="${empty sessionScope.order_shopCars }">
  		<!-- 若果购物车中的购物项为空，则跳转到首页 -->
  		<c:redirect url="/index.jsp"></c:redirect>
  	</c:if>
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
					<form action="${ourshop }/product_queryBySearch" method="post" class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" name="name" id="search" placeholder="search" />
							<button type="submit" class="btn btn-default">搜  索</button>
						</div>
					</form>
				</div>
				<div id="logined" class="show">				
					<ul class="nav navbar-nav navbar-right">
						<li class="" data-toggle="" ><a id="mydetail" href="javascript:;l"><span class="glyphicon glyphicon-home"></span> 个人中心</a></li>
						<li class="" ><a href="${ourshop }/shopCar_queryByUid"><span class="glyphicon glyphicon-shopping-cart"></span> 购物车</a></li>
					</ul>					
				</div>
			</div>		
		</nav>	 	
	</div>
	
		
		
		<div id="address_div" class="panel panel-default container">
		<div class="panel-heading row">
			<h3 class="panel-title col-xs-10">
				收货信息
			</h3>
			<button data-toggle="modal" href="#address_AddModal" class="btn btn-info col-xs-2 pull-right">
				添加收货信息
			</button>
		</div>
		
		<c:forEach items="${sessionScope.addressList }" var="address">
		<div class="panel-body col-xs-3 index_show address_list">
			<div class="form-group address_msg"> 
				<input type="hidden" value="${address.id }">
				<h4>${address.name }</h4>
				<p class="img_phone">${address.phone }</p>
				<p class="img_addName">${address.addName }</p>
			</div>
		
			<div class="btn-group form-group " data-toggle="buttons">
					<button class="btn btn-info update_address" data-toggle="modal" href="#address_EditModal" >修改</button>
					<button  class="btn btn-info delete_address">删除</button>
			</div>				
		</div>
		</c:forEach>
		
			
		
		
	</div>
	
		
	
		
		
		<div class="panel panel-default container">
			<div class="panel-heading row">
				<h4>订单清单</h4>
			</div>
			<div class="panel-body table-responsive ">
				<table class="table">
					<thead>
						<tr>
							<th>预览</th>
							<th>单价</th>
							<th>数量</th>
							<th>金额</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${order_shopCars }" var="order_ourshop">
						<tr>
							<td><img style="width: 50px; height: 50px;" src="${ourshop }/image/${order_ourshop.product.picture}"/></td>
							<td>${order_ourshop.product.price}</td>
							<td>${order_ourshop.number}</td>
							<td class="order_price">${order_ourshop.product.price*order_ourshop.number}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="panel-footer row">
				<label class="pull-right">
					<span>应付：</span>
					<i id="total_price"></i>
					<span>(不含运费)</span>				
				<button id="save_order" type="button" class="btn btn-primary">提交订单</button>
				</label>
			</div>
		</div>
	
	
		
	
	<div id="back_top"><a href="javascript:;"><img src="img/upBtn.png"/></a></div>
	
	<footer id="footer" class="">
		<div class="container">
			<p>联系我们 | 鸣谢列表 | 团队主页 </p>
			<p>赣ICP 备12123. @Team-名字蒸的好难取  Powerd by Bootstrap.</p>
		</div>
	</footer>


	<!--
    	作者：360476710@qq.com
    	时间：2017-04-07
    	描述：修改收货信息
    -->
	<div class="modal fade" id="address_EditModal">
		<div class="modal-dialog">
			<div class="modal-content"> 	 	
				<div class="modal-header">
					<h4 class="text-center text-primary">修改收货信息</h4>
				</div>
				
				<div class="modal-body">
					<form method="post" action="#" class="form col-xs-12 center-block">
						<div class="form-group">
							<input type="hidden" name="id" id="update_id">
							<input type="text" class="form-control input-lg" name="name" id="update_name" placeholder="收件人" />
						</div>
						
						<div class="form-group">
							<input type="text" class="form-control input-lg" name="phone" id="update_phone" placeholder="电话号码" />
						</div>

						<div class="form-group">
							<input type="text" class="form-control input-lg" name="addname" id="update_address" placeholder="详细地址" />
						</div>
						<div class="form-group">
							<button type="button" id="order_update_address" class="btn btn-primary btn-lg btn-block">保存修改</button>			
						</div>
					</form>
				</div>	
				<div class="modal-footer">
						
				</div>
			</div>			
		</div>
	</div>
	<div class="modal fade" id="address_AddModal">
		<div class="modal-dialog">
			<div class="modal-content"> 	 	
				<div class="modal-header">
					<h4 class="text-center text-primary">添加收货信息</h4>
				</div>
				
				<div class="modal-body">
					<form id="ffa" action="#" method="post" class="form col-xs-12 center-block">
						<div class="form-group">
							<input type="text" class="form-control input-lg" name="name" id="save_name" placeholder="收件人" />
						</div>
						
						<div class="form-group">
							<input type="text" class="form-control input-lg" name="phone" id="save_phone" placeholder="电话号码" />
						</div>

						<div class="form-group">
							<input type="text" class="form-control input-lg" name="addName" id="save_address" placeholder="详细地址" />
						</div>
						<div class="form-group">
						</div>
					</form>
				</div>	
				<div class="modal-footer">
					<button id="order_add_address" class="btn btn-primary btn-lg btn-block">添加地址</button>								
				</div>
			</div>			
		</div>
	</div>



















	<!--
    	作者：360476710@qq.com
    	时间：2017-03-23
    	描述：jq.js必须放在bootstrap.js之前
    -->
	<script type="text/javascript" src="${ourshop }/js/jquery.min.js" ></script>
	<script type="text/javascript" src="${ourshop }/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ourshop }/js/myJs.js" ></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('.address_list').click(function(){
				$('.address_list').removeClass('address_selected');
				$(this).addClass('address_selected');
				//拿着这个获取收货地址
			})
		})
	</script>
	

</body>
</html>