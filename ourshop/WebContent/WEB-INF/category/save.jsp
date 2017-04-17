<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/public/head.jspf"%>
	<style type="text/css">
		form div{
			margin: 5px;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			$("input[name=type]").validatebox({
				required:true,
				missingMessage:'请输入类别名称'
			});
			//窗体弹出时默认禁用验证
			$("#ff").form("disableValidation");
			//注册button的事件
			$("#btn").click(function(){
				//开启验证
				$("#ff").form("enableValidation");
				//如果验证成功则提交数据
				if($("#ff").form("validate")){
					//提交数据
					$('#ff').form('submit', {
						url: 'category_save',
						success: function(){
							//关闭当前窗体
							parent.$("#win").window("close");
							//刷新页面 获取aindex--->iframe--->dg   不兼容向下强转 dom--->jquery--->easyui
							//parent.$("iframe[title='类别管理']").contents().find("#dg").datagrid("reload");
							parent.$("iframe[title='类别管理']").get(0).contentWindow.$("#dg").datagrid("reload");
						}
					});
				}
			});
		});
	</script>
</head>
<body>

	<form id="ff" method="post">   
	    <div>   
	        <label for="type">类别名称:</label>   
	        <input type="text" name="type" />   
	    </div>   
	    <div>
	    	<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>
	    </div>
	</form>  
</body>
</html>