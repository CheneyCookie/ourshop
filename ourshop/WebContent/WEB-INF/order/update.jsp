<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/public/head.jspf"%>
	<style type="text/css">
		form div{
			margin: 10px;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			var dg=parent.$("iframe[title='销售管理']").get(0).contentWindow.$("#dg");
			//自定义方法验证validatebox.defaults.rules中注册新的函数
			

			//对类型的下拉列表框进行远程加载
			$('#cc').combobox({    
			    url:'status_query',    
			    valueField:'id',    
			    textField:'type', 
			    panelHeight:'auto',
			    panelWidth:120,
			    width:120,
			    //是否可编辑
			    editable:false,
			    required:true,
				missingMessage:'请选择所属类别'
			});
			
			//回显内容
			var rows=dg.datagrid("getSelections");
				$('#ff').form('load',{
					id:rows[0].id,
					'status.id':rows[0].status.id,
				});
				
			
			$("#submit").click(function(){
				if($("#ff").form("validate")){
					//提交数据
					$('#ff').form('submit', {
						url: 'order_update',
						success: function(){
							//关闭当前窗体
							parent.$("#win").window("close");
							//刷新页面 获取aindex--->iframe--->dg   不兼容向下强转 dom--->jquery--->easyui
								//parent.$("iframe[title='类别管理']").contents().find("#dg").datagrid("reload");
							dg.datagrid("reload");
						}
					});
				}
			});
			$("#reset").click(function(){
				//重置当前表单数据
				$("#ff").form("reset");
			});
		});
	</script>
</head>
<body>
<body>
<!-- enctype="multipart/form-data"设置多媒体表单 -->
<form title="商品" id="ff" method="post">
	
	<div>
		<label>订单状态：</label> 
		<input id="cc" name="status.id" />
	</div>
	<div>
		<a id="submit" href="#" class="easyui-linkbutton">更新</a> 
		<input type="hidden" name="id" />
	</div>
</form>
</body>
</html>