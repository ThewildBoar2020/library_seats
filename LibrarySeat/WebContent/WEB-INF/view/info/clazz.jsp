<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>班级管理</title>
<script type="text/javascript">
	var url;
	
	

	function openClazzAddDialog() {
		$("#dlg").dialog("open").dialog("setTitle", "添加班级信息");
		url = "reserveClazz.htm";
	}

	function openClazzModifyDialog() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length != 1) {
			$.messager.alert('系统提示', '请选择一条数据进行操作');
			return;
		}
		var row = selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle", "修改班级信息");
		$("#fm").form("load", row);
		url = "reserveClazz.htm?id=" + row.id;
	}

	function saveClazz() {
		var v = $("#teacherno").combobox('getValue');
		if(v==null || v.length==0){
			$.messager.alert('系统提示', '请选择一名辅导员');
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
					closeClazzAddDialog();
					$("#dg").datagrid("reload");
				}
			}
		});
	}


	function closeClazzAddDialog() {
		$("#dlg").dialog("close");
		$("#fm").form('clear');
	}

	function deleteClazz() {
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
				$.post("deleteClazz.htm", {
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
    pagination="true" rownumbers="true" url="clazzList.htm" fit="true" toolbar="#tb">
    <thead>
    	<tr>
    		<th field="ck" checkbox="true" align="center"></th>
    		<th field="id" width="50" align="center" data-options="hidden:true"></th>
    		<th field="name" width="60" align="center">班级名称</th>
    		<th field="xueyuan" width="60" align="center">学院</th>
    		<th field="zhuanye" width="60" align="center">专业</th>
    		<th field="teachername" width="60" align="center">辅导员</th>
    	</tr>
    </thead>
</table>
<div id="tb">
	<div>
		<privilege:operation operationId="100015" clazz="easyui-linkbutton" onClick="openClazzAddDialog()" name="添加"  iconCls="icon-add" ></privilege:operation>
		<privilege:operation operationId="100016" clazz="easyui-linkbutton" onClick="openClazzModifyDialog()" name="修改"  iconCls="icon-edit" ></privilege:operation>
		<privilege:operation operationId="100017" clazz="easyui-linkbutton" onClick="deleteClazz()()" name="删除"  iconCls="icon-remove" ></privilege:operation>
	</div>
	<div class="updownInterval"> </div>
</div>









<div id="dlg" class="easyui-dialog" style="width: 560px;height: 300px;padding: 10px 20px"
  closed="true" buttons="#dlg-buttons">
  <form id="fm" method="post">
  	<table cellspacing="5px;">
  		<tr>
  			<td>名称</td>
  			<td><input type="text" id="name" name="name" class="easyui-validatebox" required="true"/></td>
  			<td>&nbsp;</td>
  			<td>辅导员</td>
  			<td><input class="easyui-combobox" name="teacherno" id="teacherno"  size="20" data-options="editable:false,panelHeight:'auto',valueField:'no',textField:'name',url:'${path }/teacher/comboList.htm'"/></td>
  		</tr>
  		<tr>
  			<td>学院</td>
  			<td><input type="text" id="xueyuan" name="xueyuan" class="easyui-validatebox" required="true"/></td>
  			<td>&nbsp;</td>
  			<td>专业</td>
  			<td><input type="text" id="zhuanye" name="zhuanye" class="easyui-validatebox" required="true"/></td>
  		</tr>
  	</table>
  </form>
</div>

<div id="dlg-buttons">
	<a href="javascript:saveClazz()" class="easyui-linkbutton" iconCls="icon-ok" >保存 </a>
	<a href="javascript:closeClazzAddDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div>


</body>
</html>