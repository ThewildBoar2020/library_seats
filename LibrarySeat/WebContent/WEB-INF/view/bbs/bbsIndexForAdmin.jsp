<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>论坛标题管理</title>
<script type="text/javascript">
	var url;var url2;
	
	function searchBBS() {
		$('#dg').datagrid('load', {
			author : $("#s_author").val(),
			title : $('#s_title').val()
		});
	}

	function openBBSModifyDialog() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length != 1) {
			$.messager.alert('系统提示', '请选择一条数据进行操作');
			return;
		}
		var row = selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle", "修改信息");
		$("#fm").form("load", row);
		url = "updateBbstitle.htm?id=" + row.id;
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


	function closeBBSAddDialog() {
		$("#dlg").dialog("close");
		$("#fm").form('clear');
	}

	function deleteBBS() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length == 0) {
			$.messager.alert('系统提示', '请至少选择一条数据操作');
			return;
		}
		var strIds = [];
		for ( var i = 0; i < selectedRows.length; i++) {
			strIds.push(selectedRows[i].id);
		}
		var ids = strIds.join(",");
		$.messager.confirm("系统提示", "确定删除<font color=red>"
				+ selectedRows.length + "</font>数据吗？", function(r) {
			if (r) {
				$.post("deleteBbs.htm", {
					ids : ids
				}, function(result) {
					if (result.success) {
						$.messager.alert('系统提示', "删除<font color=red>"	+ result.delNums + "</font>条数据成功");
						$("#dg").datagrid("reload");
					} else {
						$.messager.alert('系统提示', result.errorMsg);
					}
				}, "json");
			}
		});
	}
	
	function showTopic(bbsid){
		$("#dlg2").dialog("open").dialog("setTitle", "帖子详情");
		$("#dg2").datagrid({
			url:'${path}/topic/topicList.htm?bbsid='+bbsid,
			pagination:true,
			fitColumns:true,
			rownumbers:true,
			fit:true,
   			onLoadSuccess: function (data) {
                 				$(this).datagrid('doCellTip', { 'max-width': '400px', 'delay': 500 });
           					}
		});
	}
	
	
	function openTopicModifyDialog(){
		var selectedRows = $("#dg2").datagrid('getSelections');
		if (selectedRows.length != 1) {
			$.messager.alert('系统提示', '请选择一条数据进行操作');
			return;
		}
		var row = selectedRows[0];
		$("#dlg3").dialog("open").dialog("setTitle", "修改信息");
		$("#fm2").form("load", row);
		url2 = "${path}/topic/updateTopiccontent.htm?id=" + row.id;
	}
	
	
	function saveTopic(){
	$("#fm2").form("submit",{
			url : url2,
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
					closeTopicModifyDialog();
					$("#dg2").datagrid("reload");
				}
			}
		});
	}
	
	function closeTopicModifyDialog(){
		$("#dlg3").dialog("close");
		$("#fm2").form('clear');
	}
	
	function deleteTopic(){
		var selectedRows = $("#dg2").datagrid('getSelections');
		if (selectedRows.length == 0) {
			$.messager.alert('系统提示', '请至少选择一条数据操作');
			return;
		}
		var strIds = [];
		for ( var i = 0; i < selectedRows.length; i++) {
			strIds.push(selectedRows[i].id);
		}
		var ids = strIds.join(",");
		$.messager.confirm("系统提示", "确定删除<font color=red>"
				+ selectedRows.length + "</font>数据吗？", function(r) {
			if (r) {
				$.post("${path}/topic/deleteTopic.htm", {
					ids : ids
				}, function(result) {
					if (result.success) {
						$.messager.alert('系统提示', "删除<font color=red>"	+ result.delNums + "</font>条数据成功");
						$("#dg2").datagrid("reload");
					} else {
						$.messager.alert('系统提示', result.errorMsg);
					}
				}, "json");
			}
		});
	}
</script>
</head>
<body style="margin: 1px;">
<table id="dg" title="论坛标题信息 " class="easyui-datagrid" fitColumns="true" 
    pagination="true" rownumbers="true" url="bbsList.htm" fit="true" toolbar="#tb">
    <thead>
    	<tr>
    		<th field="ck" checkbox="true" align="center"></th>
    		<th field="id" width="50" align="center" data-options="hidden:true"></th>
    		<th field="title" width="60" align="center" data-options="formatter:formatTitle">标题</th>
    		<th field="author" width="60" align="center">发帖人</th>
    		<th field="time" width="60" align="center">发帖时间</th>
    		<th field="reply" width="60" align="center">回复量</th>
    		<th field="lastreply" width="60" align="center">最后回复人</th>
			<th field="lastreplytime" width="60" align="center">最后回复时间</th>
    	</tr>
    </thead>
</table>
<div id="tb">
	<div class="updownInterval"> </div>
	<div>
		<privilege:operation operationId="100038" clazz="easyui-linkbutton" onClick="openBBSModifyDialog()" name="修改"  iconCls="icon-edit" ></privilege:operation>
		<privilege:operation operationId="100039" clazz="easyui-linkbutton" onClick="deleteBBS()" name="删除"  iconCls="icon-remove" ></privilege:operation>
	</div>
	<div class="updownInterval"> </div>
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
</script>







<div id="dlg" class="easyui-dialog" style="width: 360px;height: 160px;padding: 10px 20px"
  closed="true" buttons="#dlg-buttons">
  <form id="fm" method="post">
  	<table cellspacing="5px;">
  		<tr>
  			<td>标题</td>
  			<td><input type="text" id="title" name="title" class="easyui-validatebox" required="true"/></td>
		</tr>  			
  	</table>
  </form>
</div>

<div id="dlg-buttons">
	<a href="javascript:saveBBS()" class="easyui-linkbutton" iconCls="icon-ok" >保存  </a>
	<a href="javascript:closeBBSAddDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div>






<!-- 帖子 -->
<div id="dlg2" class="easyui-dialog" iconCls="icon-search" style="width: 700px;height: 520px;padding: 10px 20px"
  closed="true" buttons="#dlg2-buttons">
  <div class="updownInterval"> </div>
	<div>
		<privilege:operation operationId="100040" clazz="easyui-linkbutton" onClick="openTopicModifyDialog()" name="修改"  iconCls="icon-edit" ></privilege:operation>
		<privilege:operation operationId="100041" clazz="easyui-linkbutton" onClick="deleteTopic()" name="删除"  iconCls="icon-remove" ></privilege:operation>
	</div>
  <div class="updownInterval"> </div>
  <div style="height: 400px;" align="center">
  	<table id="dg2" title="帖子详情" class="easyui-datagrid"  >
    <thead>
    	<tr>
    		<th field="ck" checkbox="true" align="center"></th>
    		<th field="id" width="200" align="center" data-options="hidden:true">编号</th>
    		<th field="content" width="200" align="center">内容</th>
    		<th field="time" width="100" align="center">时间</th>
    		<th field="author" width="100" align="center">发表人</th>
    	</tr>
    </thead>
</table>
  </div>
</div>


<div id="dlg3" class="easyui-dialog" style="width: 360px;height: 160px;padding: 10px 20px"
  closed="true" buttons="#dlg-buttons">
  <form id="fm2" method="post">
  	<table cellspacing="5px;">
  		<tr>
  			<td>内容</td>
  				<input type="hidden"  id="bbsid" name="bbsid" />
  			<td><textarea type="text" id="content" name="content" class="easyui-validatebox" required="true"></textarea></td>
		</tr>  			
  	</table>
  </form>
</div>

<div id="dlg-buttons">
	<a href="javascript:saveTopic()" class="easyui-linkbutton" iconCls="icon-ok" >保存 </a>
	<a href="javascript:closeTopicModifyDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div>


</body>
</html>