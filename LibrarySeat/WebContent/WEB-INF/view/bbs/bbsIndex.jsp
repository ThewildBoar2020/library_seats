<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>论坛标题管理</title>
    <style type="text/css">
			.datagrid-body td{  
				border-right:1px dotted transparent;  
				border-bottom:1px dotted transparent;  
			}  
		</style>
<script type="text/javascript">
	var url;
	function searchBBS() {
		$('#dg').datagrid('load', {
			author : $("#s_author").val(),
			title : $('#s_title').val()
		});
	}
	
	
	function openNewBBSDialog(){
		$("#dlg").dialog("open").dialog("setTitle", "新主题");
		url = "newBbs.htm";
	}
	
	function closeBBSAddDialog(){
		$("#dlg").dialog("close");
		$("#fm").form('clear');
	}
	
	
	function saveBBS() {
		$("#fm").form("submit",{
			url : url,
			onSubmit : function() {
				return $(this).form("validate");
			},
			success : function(result) {
				var result = eval('(' + result + ')');
				if (result.errorMsg) {
					$.messager.alert('系统提示', "<font color=red>"+ result.errorMsg + "</font>");
					return;
				} else {
					$.messager.alert('系统提示', '保存成功');
					closeBBSAddDialog();
					$("#dg").datagrid("reload");
				}
			}
		});
	}
	
	function showTopic(bbsid){
			window.open("${path}/topic/detail.htm?bbsid="+bbsid);
	}
</script>
</head>
<body style="margin: 1px;">
<table id="dg" title="论坛标题信息 " class="easyui-datagrid" fitColumns="true" 
    pagination="true" rownumbers="true" url="bbsList.htm" fit="true" toolbar="#tb" singleSelect="true">
    <thead>
    	<tr>
    		<th field="id" width="50" align="center" data-options="hidden:true"></th>
    		<th field="title" width="150" align="center" data-options="formatter:formatTitle">标题</th>
    		<th field="author" width="60" align="center" data-options="formatter:formatAuthor">发帖人</th>
    		<th field="lastreply" width="60" align="center"  data-options="formatter:formatLast">最后回复人</th>
    		<th field="reply" width="30" align="center">回复量</th>
    	</tr>
    </thead>
</table>
<div id="tb">
	<div>
		<a href="javascript:openNewBBSDialog()" class="easyui-linkbutton" iconCls="icon-add" >新主题</a>
	</div>

	<div>
		&nbsp;发表人：&nbsp;<input type="text" name="s_author" id="s_author" size="20" onkeydown="if(event.keyCode==13) searchBBS()"/>
		&nbsp;主题：&nbsp; <input type="text" name="s_title" id="s_title" size="20" onkeydown="if(event.keyCode==13) searchBBS()"/>
		<a href="javascript:searchBBS()" class="easyui-linkbutton" iconCls="icon-search" >搜索</a>
	</div>
	<div class="updownInterval"> </div>
</div>

<script type="text/javascript">
	function formatTitle(value,row){
		return "<a href='javascript:showTopic(\""+row.id+"\")' >"+value+"</a>";
	}
	
	function formatAuthor(value,row){
		return row.author + "/" + row.time;
	}
	function formatLast(value,row){
		return row.lastreply + "/" + row.lastreplytime;
	}
</script>

	
	
<div id="dlg" class="easyui-dialog" style="width: 560px;height: 300px;padding: 10px 20px"
  closed="true" buttons="#dlg-buttons">
  <form id="fm" method="post">
  	<table cellspacing="5px;">
  		<tr>
  			<td>标题</td>
  			<td><input type="text" id="title" name="title" class="easyui-validatebox" required="true"/></td>
  		</tr>
  		<tr>
  			<td>内容</td>
  			<td>
	  			<textarea name="content" id="content" style="width:300px;height:130px;">
  			
  				</textarea>
  			</td>
  		</tr>
  	</table>
  </form>
</div>

<div id="dlg-buttons">
	<a href="javascript:saveBBS()" class="easyui-linkbutton" iconCls="icon-ok" >保存 </a>
	<a href="javascript:closeBBSAddDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div>
	
	
</body>
</html>