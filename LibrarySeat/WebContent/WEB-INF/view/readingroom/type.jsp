<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>阅览室类型管理</title>
<script type="text/javascript">
	var url;
	
	
	function openTypeAddDialog() {
		$("#dlg").dialog("open").dialog("setTitle", "添加类型信息");
		url = "reserveType.htm";
	}

	function openTypeModifyDialog() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length != 1) {
			$.messager.alert('系统提示', '请选择一条数据进行操作');
			return;
		}
		var row = selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle", "修改类型信息");
		$("#fm").form("load", row);
		url = "reserveType.htm?id=" + row.id;
	}

	function saveType() {
		$("#fm").form("submit",
				{
					url : url,
					onSubmit : function() {
						return $(this).form("validate");
					},
					success : function(result) {
						var result = eval('(' + result + ')');
						if (result.errorMsg) {
							$.messager.alert('系统提示', "<font color=red>" + result.errorMsg + "</font>");
							return;
						} else {
							$.messager.alert('系统提示', '保存成功');
							closeTypeAddDialog();
							$("#dg").datagrid("reload");
						}
					}
				});
	}

	function closeTypeAddDialog() {
		$("#dlg").dialog("close");
		$("#fm").form('clear');
	}

	function deleteType() {
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
				$.post("deleteType.htm", {ids : ids}, 
				function(result) {
					if (result.success) {
						$.messager.alert('系统提示', "删除<font color=red>"
								+ result.delNums + "</font>条数据成功");
						$("#dg").datagrid("reload");
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
<table id="dg" class="easyui-datagrid" fitColumns="true" 
    pagination="true" rownumbers="true" url="typeList.htm" fit="true" toolbar="#tb">
    <thead>
    	<tr>
    		<th field="ck"    checkbox="true" align="center"></th>
    		<th field="id"    width="50" align="center" data-options="hidden:true"></th>
    		<th field="name"  width="60" align="center">名称</th>
    		<th field="score" width="60" align="center">信用分数限制</th>
    	</tr>
    </thead>
</table>
<div id="tb">
	<div>
		<privilege:operation operationId="100024" clazz="easyui-linkbutton" onClick="openTypeAddDialog()" name="添加"  iconCls="icon-add" ></privilege:operation>
		<privilege:operation operationId="100025" clazz="easyui-linkbutton" onClick="openTypeModifyDialog()" name="修改"  iconCls="icon-edit" ></privilege:operation>
		<privilege:operation operationId="100026" clazz="easyui-linkbutton" onClick="deleteType()()" name="删除"  iconCls="icon-remove" ></privilege:operation>
	</div>
	<div class="updownInterval"> </div>
</div>









<div id="dlg" class="easyui-dialog" style="width: 320px;height: 220px;padding: 10px 20px"
  closed="true" buttons="#dlg-buttons">
  <form id="fm" method="post">
  	<table cellspacing="5px;">
  		<tr>
  			<td>名称</td>
  			<td><input type="text" id="name" name="name" class="easyui-validatebox" required="true"/></td>
  		</tr>
  		<tr>
  			<td>信用分数限制</td>
  			<td><input type="number" id="score" name="score" class="easyui-validatebox" required="true"/></td>
  		</tr>
  	</table>
  </form>
</div>

<div id="dlg-buttons">
	<a href="javascript:saveType()" class="easyui-linkbutton" iconCls="icon-ok" >保存 </a>
	<a href="javascript:closeTypeAddDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div>


</body>
</html>