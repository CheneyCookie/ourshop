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
			$(".delete_coll").click(function(){
				var cid=$(this).parent("td").parent("tr").find(".coll_hidd_id").html();
				//alert(cid)
				var $this=$(this);
				$.post("collection_delete",{id:cid},function(){
					$($this).parent("td").parent("tr").remove();
				})
			})
			
			$(".delete_address").click(function(){
				var aid=$(this).parent("td").parent("tr").find(".add_hidd_id").html();
				//alert(aid)
				var $this=$(this);
				$.post("address_delete",{id:aid},function(){
					$($this).parent("td").parent("tr").remove();
				})
			})
			
			$("#update_UserName").click(function(){
				$("#for_updateName").removeAttr("readonly");
				$("#for_updateName").focus();
				
				$("#for_updateName").blur(function(){
					$.post("user_updateName",{login:$("#for_updateName").val()},function(){
						$("#for_updateName").attr("readonly","readonly");
					})
				});
			})
			
			$("#update_userPhone").click(function(){
				$("#for_updatePhone").removeAttr("readonly");
				$("#for_updatePhone").focus();
				
				$("#for_updatePhone").blur(function(){
					$.post("user_updatePhone",{phone:$("#for_updatePhone").val()},function(){
						$("#for_updatePhone").attr("readonly","readonly");
					})
				});
			})
			
			$("#update_userEmail").click(function(){
				$("#for_updateEmail").removeAttr("readonly");
				$("#for_updateEmail").focus();
				
				$("#for_updateEmail").blur(function(){
					$.post("user_updateEmail",{email:$("#for_updateEmail").val()},function(){
						$("#for_updateEmail").attr("readonly","readonly");
					})
				});
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
					<form action="${ourshop }/product_queryBySearch" class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" name="name" id="search" placeholder="search" />
							<button type="submit" class="btn btn-default">搜  索</button>
						</div>
					</form>
				</div>
				<div id="logined" class="show">				
					<ul class="nav navbar-nav navbar-right">
						<li class="" ><a href="${ourshop }/shopCar_queryByUid"><span class="glyphicon glyphicon-shopping-cart"></span> 购物车</a></li>
						<li class="" ><a href="user_out"><span class="glyphicon glyphicon-shopping-cart"></span> 退出</a></li>
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
			<ul class="nav navbar-nav col-md-12">
				<c:forEach items="${applicationScope.categories }" var="category">
					<li><a href="${ourshop }/product_queryByAllCategory?categoryName=${category.type }">${category.type }</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
		
	<!--
		作者：360476710@qq.com
		时间：2017-03-29
		描述：
	-->
	
	
<div class="container" id="accordion">
	<div class="panel col-xs-2">
		<ul id="infor_left" class="nav nav-pills nav-stacked">
			<div>
				<li><img id="img_user" src="${ourshop }/img/avatar.png"/></li>
				<h4 class="text-center">${user.login }</h4>
			</div>	
			<li class="active"><a href="javascript:;">我的订单</a></li>
			<li><a href="javascript:;">我的收藏</a></li>
			<li><a href="javascript:;">收货地址</a></li>
			<li><a href="javascript:;">账户资料</a></li>
			<li><a href="javascript:;">售后服务</a></li>
		</ul>
		
	</div>
	<!--
    	作者：360476710@qq.com
    	时间：2017-04-01
    	描述：.ccc是用来拿右侧div的，没别的意思	('.'*)3
    -->
	<div class="infor_right">	
		<div class="ccc panel panel-default col-xs-9 pull-right show">
			<div class="panel-heading row">
				<h4>我的订单</h4>
			</div>
			<!-- 
			 -->
			<c:if test="${!empty sessionScope.orderList }">
			
			<div class="panel-body table-responsive ">
				<table class="table">
					<thead>
						<tr>
							<th>预览</th>
							<th>时间</th>
							<th>订单号</th>
							<th>单价</th>
							<th>数量</th>
							<th>状态</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${orderList }" var="myorder">
						<tr>
							<td><img style="width: 50px; height: 50px;" src="${ourshop }/image/${myorder.pPicture }"/></td>
							<td>${myorder.date }</td>
							<td>${myorder.id }</td>
							<td>${myorder.pPrice }</td>
							<td>${myorder.pNumber }</td>
							<td>${myorder.status.status }</td>
						</tr>
					</c:forEach>
						
					</tbody>
				</table>
			</div>
			<!-- 
			 -->
			</c:if>
			<c:if test="${empty sessionScope.orderList }">
				<div class="panel-body row">	
				<img src="${ourshop}/img/404.jpg"/>
			</div>
			</c:if>
		</div>
		<div class="ccc  panel panel-default col-xs-9 pull-right hidden">
			<div class="panel-heading row">
				<h4>我的收藏</h4>
			</div>
			<!-- 
			 -->
			<c:if test="${!empty sessionScope.collections }">
			<div class="panel-body table-responsive ">
				<table class="table">
					<thead>
						<tr>
							<th>预览</th>
							<th>时间</th>
							<th>单价</th>
							<th>删除</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${collections }" var="mycollection">
						<tr>
							<td class="coll_hidd_id hidden" >${mycollection.id }</td>
							<td><a href="${ourshop }/product_get?id=${mycollection.product.id }"><img style="width: 50px; height: 50px;" src="${ourshop }/image/${mycollection.product.picture }"/></a></td>
							<td>${mycollection.date }</td>
							<td>${mycollection.product.price }</td>
							<td><a class="delete_coll" href="javascript:;"><img src="${ourshop }/img/close.png" alt="" /></a></td>
						</tr>
					</c:forEach>
						
					</tbody>
				</table>
			</div>
			<!-- 
			 -->
			</c:if>
			<c:if test="${empty sessionScope.collections }">
				<div class="panel-body row">	
				<img src="${ourshop}/img/404.jpg"/>
			</div>
			</c:if>
		</div>
	

			<div class="ccc panel panel-default col-xs-9 pull-right hidden">
				<div class="panel-heading row">
					<h4>收货地址</h4>
				</div>
				<!-- 
				 -->
				<c:if test="${!empty sessionScope.addressList }">
				<div class="panel-body">
					<div class="table-responsive">
					  <table class="table">
					    <thead>
					      <tr>					   
					        <th>收件人</th>
					        <th>手机号码</th>
					        <th>详细地址</th> 
					        <th>操作</th>
					        <th>删除</th>
					      </tr>
					    </thead>
 
					    <tbody>
					    
					    <c:forEach items="${sessionScope.addressList }" var ="address">
					     <tr class="">
					     	<td class="add_hidd_id" hidden="">${address.id }</td>
					      	<td>${address.name }</td>			        
					        <td>${address.phone }</td>
					        <td>${address.addName }</td>	
					        <td><a data-toggle="modal" href="#address_EditModal_2">修改</a></td>
					        <td><a class="delete_address" href="javascript:;"><img src="${ourshop }/img/close.png" alt="" /></a></td>
					      </tr>	
					     </c:forEach>
					    </tbody>	    
					  </table>
					</div>
				
				</div>
				<!-- 
				 -->
				</c:if>
				<c:if test="${empty sessionScope.addressList }">
					<div class="panel-body row">	
					<img src="${ourshop}/img/404.jpg"/>
				</div>
			</c:if>
			</div>
		
			<div class="ccc panel panel-default col-xs-9 pull-right hidden">
				<div class="panel-heading row">
					<h4>账户资料</h4>
				</div>
				<div class="panel-body">
					<ul class="list-unstyled list-group">
						<li class="list-group-item form-inline">
							<div class="form-group">
								<img src="${ourshop }/img/avatar.png"/>
								<a href="javascript:;" class="file">选择图片
								    <input type="file" name="" id="">
								</a>
							</div>	
						</li>
						<li class="list-group-item form-inline">
							<div class="form-group">
								<h4>账户昵称</h4>
								<p><input id="for_updateName" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px " name="login" value="${user.login }" readonly="readonly" /></p>
							</div>
							<div  class="form-group pull-right">
								<a id="update_UserName" href="javascript:;">修改</a>
							</div>
		
						</li>
						<li class="list-group-item form-inline">
							<div class="form-group">
								<h4>验证手机</h4>
								<p><input id="for_updatePhone" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px " name="phone" value="${user.phone }" readonly="readonly"/></p>
							</div>
							<div  class="form-group pull-right">
								<a id="update_userPhone" href="javascript:;">修改</a>
							</div>
						</li>
						<li class="list-group-item form-inline">
							<div class="form-group">
								<h4>登录密码</h4>
								<p>互联网账号密码切忌通用，本站建议使用独立密码</p>
							</div>
							<div  class="form-group pull-right">
								<a id="update_userPass" href="#user_inforEdit">修改</a>
							</div>
						</li>
						<li class="list-group-item form-inline">
							<div class="form-group">
								<h4>验证邮箱</h4>
								<p><input id="for_updateEmail" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px " name="email" value="${user.email }" readonly="readonly"/></p>
							</div>
							<div  class="form-group pull-right">
								<a id="update_userEmail" href="javascript:;">修改</a>
							</div>
						</li>
						
					</ul>
				</div>
				<div class="panel-footer row">
				</div>
			</div>
		</div>
		
		

		<div class="ccc panel panel-default col-xs-9 pull-right hidden">
			<div class="panel-heading row">
				<h4>售后服务</h4>
			</div>
			<div class="panel-body row">	
				<img src="${ourshop}/img/404.jpg"/>
			</div>
			
		</div>
		
		
	</div>
          <!--
          	作者：360476710@qq.com
          	时间：2017-04-06
          	描述：infor_right
          -->
	
     
	
	
		

	
	
	<footer id="footer" class="">
		<div class="container">
			<p>联系我们 | 鸣谢列表 | 团队主页 </p>
			<p>赣ICP 备12123. @Team-名字蒸的好难取  Powerd by Bootstrap.</p>
		</div>
	</footer>
	
		<div class="modal fade" id="address_EditModal_2">
		<div class="modal-dialog">
			<div class="modal-content"> 	 	
				<div class="modal-header">
					<h4 class="text-center text-primary">修改收货信息</h4>
				</div>
				
				<div class="modal-body">
					<form action="#" method="post" class="form col-xs-12 center-block">
						<div class="form-group">
							<input type="text" class="form-control input-lg" name="checkMan" id="checkMan" placeholder="收件人" />
						</div>
						
						<div class="form-group">
							<input type="text" class="form-control input-lg" name="check_phoneNum" id="check_phoneNum" placeholder="电话号码" />
						</div>

						<div class="form-group">
							<input type="password" class="form-control input-lg" id="detail_address" placeholder="详细地址" />
						</div>
						<div class="form-group">
							<button class="btn btn-primary btn-lg btn-block">保存修改</button>								
						</div>
					</form>
				</div>	
				<div class="modal-footer">
					
				</div>
			</div>			
		</div>
	</div>
	
	
	<div class="modal fade" id="user_inforEdit">
		<div class="modal-dialog">
			<div class="modal-content"> 	 	
				<div class="modal-header">
					<h4 class="text-center text-primary">修改个人信息</h4>
				</div>
				
				<div class="modal-body">
					<form action="#" method="post" class="form col-xs-12 center-block">
						<div class="form-group">
							<input type="text" class="form-control input-lg" name="checkMan" id="checkMan" placeholder="账户昵称" />
						</div>
						
						<div class="form-group">
							<input type="text" class="form-control input-lg" name="check_phoneNum" id="check_phoneNum" placeholder="验证手机" />
						</div>

						<div class="form-group">
							<input type="password" class="form-control input-lg" id="detail_address" placeholder="登录密码" />
						</div>
						
						<div class="form-group">
							<input type="password" class="form-control input-lg" id="detail_address" placeholder="验证邮箱" />
						</div>
						<div class="form-group">
							<button class="btn btn-primary btn-lg btn-block">保存修改</button>								
						</div>
					</form>
				</div>	
				<div class="modal-footer">
					
				</div>
			</div>			
		</div>
	</div>

















	<!--
    	作者：360476710@qq.com
    	时间：2017-03-23
    	描述：jq.js必须放在bootstrap.js之前
    -->
	<script type="text/javascript" src="js/jquery.min.js" ></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		
		
		//取索引值，两两对应
		now = 0;
		var aLi_left = $('#infor_left').find('li');
		var aLi_right = $('div.ccc');
		
		
		for(var i=1; i<aLi_left.length;i++){
			aLi_left[i].index = i;
			
			$(aLi_left[i]).click(function(){			
				now = $(this).index();
			
				$(aLi_right).addClass('hidden');
				$(aLi_right[now-1]).removeClass('hidden');
				$(aLi_right[now-1]).addClass('show');
				$(aLi_left).removeClass('active');
				$(aLi_left[now]).addClass('active');
				
				
				//设定个人中心页面无内容时显示的东西
				if(!$(aLi_right[now-1]).find('img').length>0){
					if(!$(aLi_right[now-1]).find('table.table').length>0){
						var oImg = '<img src="${ourshop}/img/404.jpg"/>';				
						$(aLi_right[now-1]).find('.panel-body').append(oImg);
					}
				}
								
				
			})		
		}
		
		
	
	
	
		

		
		
	</script>

</body>
</html>