<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/public/head.jspf"%>
	<style type="text/css">
		body{
			margin: 1px;
		}
		.searchbox {
 			margin: -3px;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			$('#dg').datagrid({
				//请求数据的URL地址
			    url:'order_queryBypName',
			    loadMsg:'请等待...',
			    queryParams:{name:''},
			    //指定id字段为标识字段，在删除更新时有用，如果配置此字段，在翻页时被选中的记录不会丢失
			    idField:'id',
			    //width:500,
			    //设置斑马线
			    striped:true,
			    //数据显示在同一行，默认为true
			    nowrap:true,
			    //width:250,
			    //自动适应列,如果设置此属性，则不会出现水平滚动条，在演示冻结列的时候此参数不要设置
			    fitColumns:true,
			    //设置分页
			    pagination:true,
			    pageSize:5,
			    pageList:[5,10,15,20],
			    toolbar:[{
			    	iconCls: 'icon-edit',
			    	text:'更新物流',
			    	handler: function(){
			    		//判断是否有选中行记录
			    		var rows=$('#dg').datagrid("getSelections");
			    		if(rows.length!=1){
			    			//弹出提示信息
				    		$.messager.show({
				    			title:'错误提示',
				    			msg:'只能更新一条记录',
				    			timeout:2000,
				    			showType:'slide'
				    		});
			    		}else{
			    			//1.弹出更新页面
			    			parent.$('#win').window({
				    			title:'更新物流',
				    			width:550,
				    			height:400,
				    			content:'<iframe src="send_order_update" frameborder="0" width="100%" height="100%"></iframe>'
				    		});
			    		}
			    	}
			    },'-',{
			    	text:"<input id='ss' name='search' />"
			    }],
			    //pagePosition:'both',
			    /*rowStyler:function(index,row){
			    	if(row.listprice>80){
			    		return 'rowStyle';//rowStyle是一个已经定义了的className（类名）
			    	}
			    },*/
			    //选择单行，全选功能失效
			    singleSelect:false,
			    frozenColumns:[[
			        //同列属性，但是这些列会被冻结在左侧
			        //复选框
			        {field:'xyz',checkbox:true},
			        {field:'id',title:'订单编号',width:100}    
			    ]],
			    //配置dg的列字段 field:列字段的名称，与json的key捆绑
			    columns:[[
					{field:'pName',title:'商品名',width:200,
					    formatter:function(value,row,index){
					    return "<span title="+value+">"+value+"</span>";
					    }},
				    {field:'pNumber',title:'对应商品数量',width:200,
					    formatter:function(value,row,index){
					    return "<span title="+value+">"+value+"</span>";
					    }}, 
				    {field:'name',title:'收件人',width:200,
					    formatter:function(value,row,index){
					    return "<span title="+value+">"+value+"</span>";
					    }}, 
				    {field:'phone',title:'联系电话',width:200,
					    formatter:function(value,row,index){
					    return "<span title="+value+">"+value+"</span>";
					    }},
				    {field:'address',title:'收货地址',width:200,
					    formatter:function(value,row,index){
					    return "<span title="+value+">"+value+"</span>";
					    }},
				    {field:'total',title:'商品总价',width:200,
					    formatter:function(value,row,index){
					    return "<span title="+value+">"+value+"</span>";
					    }}, 
			        {field:'message',title:'买家留言',width:300,
					    formatter:function(value,row,index){
					    return "<span title="+value+">"+value+"</span>";
				    }},
				    {field:'status.status',title:'订单状态',width:300,
					    formatter:function(value,row,index){
					    	return row.status.status;;
				    }},
			    ]]    
			});
			//把普通的文本框转化为搜索文本框
			$('#ss').searchbox({
				//触发查询事件
				searcher:function(value,name){
					//获取当前查询的关键字，通过DataGrid加载相应的信息
					$('#dg').datagrid('load',{
						name: value
					});
				},
				menu:'#mm',
				prompt:'变形金刚'
			});
		})
	</script>
</head>
<body>
	<table id="dg"></table> 
	
</body>
</html>