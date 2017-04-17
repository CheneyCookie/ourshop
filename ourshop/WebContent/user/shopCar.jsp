<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/public/head.jspf"%>
	<link rel="stylesheet" href="${ourshop }/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${ourshop }/css/style.css" />
	<script type="text/javascript" src="${ourshop }/jquery-validate/jquery.min.js"></script>
	<script type="text/javascript">
	$(function(){
			$(".deleteShop").click(function(){
				//alert($(".hidden_id").attr("value"))
					//$.post("shopCar_delete",{id:$(".hidden_id").attr("value")},function(){
					//	alert("a");
					//});
				var $this=$(this);
				//alert($($this).attr("href"));
				$.ajax({
					type:"post",
					url:"shopCar_delete",
					data:{id:$(".hidden_id").attr("value")},
					dataType:"text",
					success:function(result){
						
						if(result=="true"){
							$($this).parent('td').parent('tr').remove();
						}
					},
					
				})
			})
			
			$(".num_text").change(function(){
				//var $this=$(this);
				var number=this.value;
				if(!isNaN(number)&&parseInt(number)==number&&number>0){
					var sid=$(this).attr("lang");
					$.post("shopCar_updateNum",{id:sid,number:number})
					var price=($(this).parent().prev().children('span').html()*number).toFixed(2);
					$(this).parent().next().children('span').html(price);
				}
			})
			
			$("#delete_many").click(function(){
				var ids="";
				$("input[name='select']:checked").each(function(){
					var shopcar_id=$(this).parent("td").prev().children("input").val();
					ids=ids+","+shopcar_id;
					//$(this).parent('td').parent('tr').remove();
				})
				ids=ids.substring(1);
				$.post("shopCar_deleteByIds",{ids:ids},function(flag){
					if(flag=="true"){
						$("input[name='select']:checked").each(function(){
							$(this).parent('td').parent('tr').remove();
						})
					}
				})
			})
			$("#to_buy").click(function(){
				var ids="";
				$("input[name='select']:checked").each(function(){
					var shopcar_id=$(this).parent("td").prev().children("input").val();
					ids=ids+","+shopcar_id;
				})
				ids=ids.substring(1);
				if(ids==""){
					alert("请至少选中一项");
				}else{
					$.post("address_queryJoinUser");
					$.post("shopCar_addToOrder",{ids:ids},function(){
						location.href="${ourshop }/user/order.jsp";
					})
				}
				//alert(ids);
				
			})
			$("input:checkbox").change(function(){
				var num=0;
				var total=0;
				$("input[name='select']:checked").each(function(){
					num++;
					//alert($(this).parent("td").parent("tr").find(".total_td").children(".pricr_num").html());
					total=total+Number($(this).parent("td").parent("tr").find(".total_td").children(".pricr_num").html());
				})
				$("#total_number").html(num);
				$("#total_price").html(total);
			})
				$("#mydetail2").click(function(){
					$.post("order_queryByUid");
					$.post("collection_queryByUid");
					$.post("address_queryJoinUser",function(){
						location.href="${ourshop }/user/myinformation.jsp";
					});
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
					<form action="${ourshop }/product_queryBySearch" method="post" class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" name="name" id="search" placeholder="search" />
							<button type="submit" class="btn btn-default">搜  索</button>
						</div>
					</form>
				</div>
				
				<div id="logined" class="show">				
					<ul class="nav navbar-nav navbar-right">
						<li class="" data-toggle="" ><a id="mydetail2" href="javascript:;"><span class="glyphicon glyphicon-home"></span> 个人中心</a></li>
					</ul>					
				</div>
			</div>		
		</nav>
		
	<!--
	    	作者：360476710@qq.com
	    	时间：2017-03-22
	    	描述:导航栏
	 -->
	 	<div id="menu" class="container navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<c:forEach items="${applicationScope.categories }" var="category">
				<!-- 相对路径跳转可能会不加载css样式，要加工程名 -->
					<li><a href="${ourshop }/product_queryByAllCategory?categoryName=${category.type }">${category.type }</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
		
	<div class="panel panel-default container">
		<div class="panel-heading row">
			<h4>购物清单</h4>
		</div>
		
		<div class="panel-body">
			<form action="" method="post">
			<div class="table-responsive">
			  <table class="table">
			    <thead>
			      <tr>
			      	<th>选中</th>
			      	<th>商品图片</th>
			        <th>商品信息</th>
			        <th>单价</th>
			        <th>个数</th>
			        <th>小计</th>
			        <th>操作</th> 
			      </tr>
			    </thead>
			    
			    <tbody>
					<c:forEach items="${sessionScope.shopCars }" var="shopCar">
				      	<tr class="shop_tr">
					      	<td hidden><input type="hidden" class="hidden_id" name="shopCar" value="${shopCar.id }" /></td>
					      	<td><input type="checkbox" name="select" class="select" value="" /></td>
					      	<td><img style="width:60px;height:60px" alt="" src="${ourshop }/image/${shopCar.product.picture }"></td>
					        <td>${shopCar.product.name }</td>
					        <td><i>¥</i><span>${shopCar.product.price }</span></td>
					        <td><input class="num_text" type="number" min="1" lang="${shopCar.id }" value="${shopCar.number }" style="width: 50px;"></td>
					        <td class="total_td"><i>¥</i><span class="pricr_num">${shopCar.product.price*shopCar.number }</span></td>
					        <td><a class="deleteShop" href="javascript:;">删除</a></td>
				      	</tr>
					</c:forEach>
			    </tbody>
			  </table>
			</div>
			<div class="panel-footer row ">
				<label>
					<input type="checkbox" name="selectAll" id="selectAll"/> 全选	
					<span id=""> | </span>
					<span id="">
						<a id="delete_many" href="javascript:;">
							删除
						</a>	
					</span>
				</label>
				<label class="pull-right">
						<span>已选择</span>
						<i id="total_number">0</i>
						<span>件商品</span>
						<span> | </span>
						<span>应付：</span>
						<i id="total_price">0</i>
						<span>(不含运费)</span>				
					<button id="to_buy" type="button" class="btn btn-primary">现在结算</button>
				</label>
			</div>
		</form>
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
    	时间：2017-03-23
    	描述：jq.js必须放在bootstrap.js之前
    -->
	<script type="text/javascript" src="${ourshop }/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ourshop }/js/myJs.js" ></script>
	<script type="text/javascript">
		$('#selectAll').click(function(){
			//浏览器兼容性，弄了一晚上，prop()替代attr（）、removeAttr（）
			
			
			
		
			
			if($(this).is(':checked')){
				
				$(':checkbox').prop('checked',true);
				
			}	
			else{
				
				$(':checkbox').prop('checked',false);
			}
			
	
		
	
		})
		
		$(function(){
			if(!$(aLi_right[now-1]).find('img').length>0){
				if(!$(aLi_right[now-1]).find('table.table').length>0){
					var oImg = '<img src="${ourshop}/img/404.jpg"/>';				
					$(aLi_right[now-1]).find('.panel-body').append(oImg);
				}
			}
		})
		
	</script>

</body>
</html>