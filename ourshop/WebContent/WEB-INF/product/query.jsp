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
			    url:'product_queryJoinCategory',
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
			    	iconCls: 'icon-add',
			    	text:'添加商品',
			    	handler: function(){
						parent.$("#win").window({
							title:'添加商品',
							width:550,
							height:450,
							content:'<iframe src="send_product_save" frameborder="0" width="100%" height="100%"></iframe>'
						})
			    	}
			    },'-',{
			    	iconCls: 'icon-edit',
			    	text:'更新商品',
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
				    			title:'更新类别',
				    			width:550,
				    			height:450,
				    			content:'<iframe src="send_product_update" frameborder="0" width="100%" height="100%"></iframe>'
				    		});
			    		}
			    	}
			    },'-',{
			    	iconCls: 'icon-remove',
			    	text:'删除类别',
			    	handler: function(){
			    		//判断是否有选中行记录
			    		var rows=$('#dg').datagrid("getSelections");
			    		//rows返回被选中的行，没有任何行被选中，则返回空数组
			    		if(rows.length==0){
			    		//弹出提示信息
			    		$.messager.show({
			    			title:'错误提示',
			    			msg:'至少选中一条记录',
			    			timeout:2000,
			    			showType:'slide'
			    		});
			    		}else{
				    		//提示是否确认删除，如果确认执行删除的逻辑
				    		$.messager.confirm('删除确认对话框','是否要删除选中的记录？',function(r){
				    			if(r){
				    				//1.获取被选中的记录，然后从记录中获取相应的id
				    				var ids="";
				    				for(var i=0;i<rows.length;i++){
				    					ids += rows[i].id + ",";
				    				}
				    				//2.拼接id的值，然后发送到后台1，2，3，4
				    				ids=ids.substring(0,ids.lastIndexOf(","));
				    				console.info(ids);
				    				//3.发送ajax请求
				    				$.post("product_deleteByIds",{ids:ids},function(result){
				    					
				    					if(result=="true"){
				    						//取消选中的所有行
				    						$("#dg").datagrid("uncheckAll");
											//重新刷新当前页
				    						$('#dg').datagrid("reload");
				    					}else{
				    						$.messager.show({
				    			    			title:'删除异常',
				    			    			msg:'删除失败，请检查操作',
				    			    			timeout:2000,
				    			    			showType:'slide'
				    			    		});
				    					}
				    				},"text");
				    			}
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
			        {field:'id',title:'商品编号',width:100}    
			    ]],
			    //配置dg的列字段 field:列字段的名称，与json的key捆绑
			    columns:[[    
			        {field:'name',title:'商品名称',width:200,
			        	//用来格式化当前列的值，返回的是最终的数据
			        	formatter:function(value,row,index){
			        		//鼠标放上去显示隐藏的文字
			        		return "<span title="+value+">"+value+"</span>";
			        	}},
			        {field:'price',title:'商品价格',width:200,
				        formatter:function(value,row,index){
				        return "<span title="+value+">"+value+"</span>";
				        }},
				    {field:'number',title:'商品数量',width:200,
					    formatter:function(value,row,index){
					    return "<span title="+value+">"+value+"</span>";
					    }}, 
			        {field:'remark',title:'简单介绍',width:300,
					    formatter:function(value,row,index){
					    return "<span title="+value+">"+value+"</span>";
				    }},
				    {field:'commend',title:'是否推荐',width:100,align:'right',
		        		formatter:function(value,row,index){
		        			if(value){
		        				return "<input type='checkbox' checked='checked' disabled='disabled' />"
		        			}else{
		        				return "<input type='checkbox' disabled='true' />"
		        			}
		        		}
				    },
				    {field:'hot',title:'是否热销',width:100,align:'right',
		        		formatter:function(value,row,index){
		        			if(value){
		        				return "<input type='checkbox' checked='checked' disabled='disabled' />"
		        			}else{
		        				return "<input type='checkbox' disabled='true' />"
		        			}
		        		}
				    },
			        {field:'category.type',title:'所属类别',width:200,
			        	formatter:function(value,row,index){
			        		if(row.category!=null&&row.category.type!=null){
			        			return row.category.type;
			        		}
			        	}}
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