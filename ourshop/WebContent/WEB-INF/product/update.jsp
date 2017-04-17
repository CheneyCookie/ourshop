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
			var dg=parent.$("iframe[title='商品管理']").get(0).contentWindow.$("#dg");
			//自定义方法验证validatebox.defaults.rules中注册新的函数
			$.extend($.fn.validatebox.defaults.rules,{
				//函数的名称:函数的实现体（又是一个json对象，里面包括函数的实现，和错误消息设置）
				format:{
					//函数实现
					validator:function(value,param){
						console.info(value+","+param.length);
						//获取当前文件的后缀名
						var ext=value.substring(value.lastIndexOf('.')+1);
						//获取支持的文件后缀名，然后比较即可
						var arr=param[0].split(",");
						for(var i=0;i<arr.length;i++){
							if(ext==arr[i]){
								return true;
							}
						}
						return false;
					},
					//错误消息
					message:'文件必须为:{0}'
				}
			});
			

			//对类型的下拉列表框进行远程加载
			$('#cc').combobox({    
			    url:'category_query',    
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
					name:rows[0].name,
					price:rows[0].price,
					number:rows[0].number,
					remark:rows[0].remark,
					commend:rows[0].commend,
					hot:rows[0].hot,
					'category.id':rows[0].category.id,
				});
				
			
			
			$("input[name=name]").validatebox({
				required:true,
				missingMessage:'请输入商品名称'
			});
			$("input[name=price]").numberbox({
				required:true,
				missingMessage:'请输入商品价格',
				min:0,
				precision:2,
				prefix:'￥'
			});
			$("input[name=number]").numberbox({
				required:true,
				missingMessage:'请输入商品价格',
				min:0,
			});
			$("input[name=fileImage]").validatebox({
				required:false,
				validType:"format['gif,jpg,jpeg,png']"
			});
			$("input[name=detailImage]").validatebox({
				required:false,
				validType:"format['gif,jpg,jpeg,png']"
			});
			$("input[name=remarkImage]").validatebox({
				required:false,
				validType:"format['gif,jpg,jpeg,png']"
			});
			//当文件域内容发生内容变化时，则调用验证方法（默认是单击提交时调用验证）
			$("input[name=fileImage]").change(function(){
				//验证本文本框是否有效
				$(this).validatebox("validate");
			});
			$("input[name=detailImage]").change(function(){
				//验证本文本框是否有效
				$(this).validatebox("validate");
			});
			$("input[name=remarkImage]").change(function(){
				//验证本文本框是否有效
				$(this).validatebox("validate");
			});
			$("textarea[name=remark]").validatebox({
				required:true,
				missingMessage:"请商品的简单描述"
			});
			//默认禁止验证功能
			$("#ff").form("disableValidation");
			//注册button的事件
			$("#submit").click(function(){
				//开启验证
				$("#ff").form("enableValidation");
				//如果验证成功则提交数据
				if($("#ff").form("validate")){
					//提交数据
					$('#ff').form('submit', {
						url: 'product_update',
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
<form title="商品" id="ff" method="post" enctype="multipart/form-data">
	<div>
		<label>商品名称:</label> <input type="text" name="name" />
	</div>
	<div>
		<label>商品价格:</label> <input type="text" name="price" />
	</div>
	<div>
		<label>商品库存:</label> <input type="text" name="number" />
	</div>
	
	<div>
		<label>简单描述:</label>
		<textarea name="remark" cols="40" rows="4"></textarea>
	</div>
	<div>
		<label>是否推荐:</label> 
		推荐:<input type="radio" name="commend" value="true" />  
		不推荐:<input type="radio" name="commend" checked="checked" value="false" /> 
	</div>
	<div>
		<label>是否热销:</label>
		热销:<input type="radio" name="hot"  value="true" />
		非热销:<input type="radio" name="hot" checked="checked" value="false" />
				
	</div>
	<div>
		<label>所属类别：</label> 
		<input id="cc" name="category.id" />
	</div>
		<div>
		<label>上传首页图:</label> <input type="file" name="fileImage" />
	</div>
	<div>
		<label>上传详细图:</label> <input type="file" name="detailImage" multiple/>
	</div>
	<div>
		<label>上传内容图:</label> <input type="file" name="remarkImage" multiple/>
	</div>
	<div>
		<a id="submit" href="#" class="easyui-linkbutton">更新</a> 
		<a id="reset" href="#" class="easyui-linkbutton">重 置</a>
		<input type="hidden" name="id" />
	</div>
</form>
</body>
</html>