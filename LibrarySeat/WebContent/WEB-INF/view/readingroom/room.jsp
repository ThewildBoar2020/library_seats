<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>阅览室管理</title>
<script type="text/javascript">
	var url;
	
	

	function openRoomAddDialog() {
		$("#dlg").dialog("open").dialog("setTitle", "添加阅览室信息");
		url = "reserveRoom.htm";
	}

	function openRoomModifyDialog() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length != 1) {
			$.messager.alert('系统提示', '请选择一条数据进行操作');
			return;
		}
		var row = selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle", "修改阅览室信息");
		$("#fm").form("load", row);
		url = "reserveRoom.htm?id=" + row.id;
	}

	function saveRoom() {
		var v = $("#typeid").combobox('getValue');
		if(v==null || v.length==0){
			$.messager.alert('系统提示', '请选择阅览室类型');
			return;
		}
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
					closeRoomAddDialog();
					$("#dg").datagrid("reload");
				}
			}
		});
	}


	function closeRoomAddDialog() {
		$("#dlg").dialog("close");
		$("#fm").form('clear');
	}

	function deleteRoom() {
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
				$.post("deleteRoom.htm", {
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
</script>
</head>
<body style="margin: 1px;">
<table id="dg" class="easyui-datagrid" fitColumns="true" 
    pagination="true" rownumbers="true" url="roomList.htm" fit="true" toolbar="#tb">
    <thead>
    	<tr>
    		<th field="ck" checkbox="true" align="center"></th>
    		<th field="id" width="50" align="center" data-options="hidden:true"></th>
    		<th field="name" width="60" align="center">名称</th>
    		<th field="typename" width="60" align="center">类型</th>
    		<th field="row" width="60" align="center">行数</th>
    		<th field="col" width="60" align="center">列数</th>
    		<th field="total" width="60" align="center">总座位数</th>
    	</tr>
    </thead>
</table>
<div id="tb">
	<div>
		<privilege:operation operationId="100027" clazz="easyui-linkbutton" onClick="openRoomAddDialog()" name="添加"  iconCls="icon-add" ></privilege:operation>
		<privilege:operation operationId="100028" clazz="easyui-linkbutton" onClick="openRoomModifyDialog()" name="修改"  iconCls="icon-edit" ></privilege:operation>
		<privilege:operation operationId="100029" clazz="easyui-linkbutton" onClick="deleteRoom()()" name="删除"  iconCls="icon-remove" ></privilege:operation>
	</div>
	<div class="updownInterval"> </div>
</div>









<div id="dlg" class="easyui-dialog" style="width: 560px;height: 240px;padding: 10px 20px"
  closed="true" buttons="#dlg-buttons">
  <form id="fm" method="post">
  	<table cellspacing="5px;">
  		<tr>
  			<td>名称</td>
  			<td><input type="text" id="name" name="name" class="easyui-validatebox" required="true"/></td>
  			<td>&nbsp;</td>
  			<td>类型</td>
  			<td><input class="easyui-combobox" name="typeid" id="typeid"  size="20" data-options="editable:false,panelHeight:'auto',valueField:'id',textField:'name',url:'${path }/type/comboList.htm'"/></td>
  		</tr>
  		<tr>
  			<td>行数</td>
  			<td><input type="text" id="row" name="row" class="easyui-validatebox" required="true"/></td>
  			<td>&nbsp;</td>
  			<td>列数</td>
  			<td><input type="text" id="col" name="col" class="easyui-validatebox" required="true"/></td>
  		</tr>
  	</table>
  </form>
</div>

<div id="dlg-buttons">
	<a href="javascript:saveRoom()" class="easyui-linkbutton" iconCls="icon-ok" >保存 </a>
	<a href="javascript:closeRoomAddDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div>


</body>
</html>