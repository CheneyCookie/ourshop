<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/public/head.jspf"%>
	<style type="text/css">
		#menu{
			width: 200px;
			/*border: 1px solid red;*/
		}
		#menu ul{
			list-style: none;
			padding: 0px;
			margin: 0px;
		}
		#menu ul li{
			border-bottom: 1px solid red
		}
		#menu ul li a{
		/*设置a标签的宽和内间距先转化为块级元素*/
			display: block;
			background-color: #008792;
			color: #fff;
			padding: 5px;
			text-decoration: none;
		}
		#menu ul li a:HOVER {
			background-color: #00a6ac
		}
	</style>
	
	<script type="text/javascript">
		$(function(){
			$("a[title]").click(function(){
				var text=$(this).text();
				var href=$(this).attr("title");
				//1.判断当前右边是否已有相应的tab
				if($("#tt").tabs("exists",text)){
				//2.如果没有则创建一个新的tab，否则切换到当前tab
					$("#tt").tabs("select",text);
				}else{
					$("#tt").tabs("add",{
						title:text,
						closable:true,
						content:'<iframe title=' + text + ' src='+href+' frameborder="0" width="100%" height="100%" />'
						//href:默认是通过url地址，加载远程页面，但是仅仅是body部分
						//href:'send_category_query'
					});
					
				}
				
				
			});
		});
	</script>
</head>
	<body class="easyui-layout">   
    <div data-options="region:'north',title:'欢迎来到JustBuy后台管理系统',split:true" style="height:100px;">
    	
    </div>   
    <div data-options="region:'west',title:'系统操作'" style="width:200px;">
    	<!-- 此处显示的是系统菜单 -->
    	<div id="menu" class="easyui-accordion" data-options="fit:true,selected:false">   
    		<div title="基本操作">   
        		<ul>
	 				<li><a href="#" title="send_category_query">类别管理</a></li>
	 				<li><a href="#" title="send_product_query">商品管理</a></li>
		 		</ul>   
    		</div>   
   			<div title="销售管理">   
        		<ul>
	 				<li><a href="#" title="send_order_query">物流查询</a></li>
	 				<li><a href="#" title="send_sale_sale">报表查询</a></li>
		 		</ul>   
    		</div>
		</div>  
    </div>   
    <div data-options="region:'center',title:'后台操作页面'" style="padding:1px;background:#fff;">
		<div id="tt" class="easyui-tabs" data-options="fit:true">   
			<div title="系统缺省页面" style="padding:10px;">   
		    	此处以后显示相应的系统信息（当前操作系统的类型，包括当前项目的域名，硬件的相关配置，或者显示报表）
			</div>   
		</div> 
    </div> 
    <div id="win" data-options="collapsible:false,minimizable:false,maximizable:false,modal:true"></div>  
</body> 
</html>