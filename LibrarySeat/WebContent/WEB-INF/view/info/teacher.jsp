<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>教师管理</title>
<script type="text/javascript">
	var url;
	
	
	function searchTeacher() {
		$('#dg').datagrid('load', {
			no : $("#s_no").val(),
			name : $('#s_name').val()
		});
	}

	function openTeacherAddDialog() {
		$("#dlg").dialog("open").dialog("setTitle", "添加教师信息");
		url = "reserveTeacher.htm";
	}

	function openTeacherModifyDialog() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length != 1) {
			$.messager.alert('系统提示', '请选择一条数据进行操作');
			return;
		}
		var row = selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle", "修改教师信息");
		$("#fm").form("load", row);
		url = "reserveTeacher.htm?id=" + row.id;
	}

	function saveTeacher() {
		$("#fm").form(
				"submit",
				{
					url : url,
					onSubmit : function() {
						return $(this).form("validate");
					},
					success : function(result) {
						var result = eval('(' + result + ')');
						if (result.errorMsg) {
							$.messager.alert('系统提示', "<font color=red>"
									+ result.errorMsg + "</font>");
							return;
						} else {
							$.messager.alert('系统提示', '保存成功');
							closeTeacherAddDialog();
							$("#dg").datagrid("reload");
						}
					}
				});
	}

	function closeTeacherAddDialog() {
		$("#dlg").dialog("close");
		$("#fm").form('clear');
	}

	function deleteTeacher() {
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
				$.post("deleteTeacher.htm", {
					ids : ids
				}, function(result) {
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
    pagination="true" rownumbers="true" url="teacherList.htm" fit="true" toolbar="#tb">
    <thead>
    	<tr>
    		<th field="ck" checkbox="true" align="center"></th>
    		<th field="id" width="50" align="center" data-options="hidden:true"></th>
    		<th field="no" width="60" align="center">工号</th>
    		<th field="name" width="60" align="center">姓名</th>
    		<th field="phone" width="60" align="center">电话</th>
    		<th field="position" width="60" align="center">职位</th>
    		<th field="sex" width="60" align="center">姓名</th>
    		<th field="mail" width="60" align="center">邮箱</th>
    	</tr>
    </thead>
</table>
<div id="tb">
	<div>
		<privilege:operation operationId="100018" clazz="easyui-linkbutton" onClick="openTeacherAddDialog()" name="添加"  iconCls="icon-add" ></privilege:operation>
		<privilege:operation operationId="100019" clazz="easyui-linkbutton" onClick="openTeacherModifyDialog()" name="修改"  iconCls="icon-edit" ></privilege:operation>
		<privilege:operation operationId="100020" clazz="easyui-linkbutton" onClick="deleteTeacher()()" name="删除"  iconCls="icon-remove" ></privilege:operation>
	</div>
	<div class="updownInterval"> </div>
	<div>
		&nbsp;姓名：&nbsp;<input type="text" name="s_name" id="s_name" size="20" onkeydown="if(event.keyCode==13) searchTeacher()"/>
		&nbsp;工号：&nbsp;<input type="text" name="s_no" id="s_no" size="20" onkeydown="if(event.keyCode==13) searchTeacher()"/>
		<a href="javascript:searchTeacher()" class="easyui-linkbutton" iconCls="icon-search" >搜索</a>
	</div>
	<div class="updownInterval"> </div>
</div>









<div id="dlg" class="easyui-dialog" style="width: 520px;height: 320px;padding: 10px 20px"
  closed="true" buttons="#dlg-buttons">
  <form id="fm" method="post">
  	<table cellspacing="5px;">
  		<tr>
  			<td>姓名</td>
  			<td><input type="text" id="name" name="name" class="easyui-validatebox" required="true"/></td>
  			<td>&nbsp;</td>
  			<td>工号</td>
  			<td><input type="text" id="no" name="no" class="easyui-validatebox" required="true"/></td>
  		</tr>
  		<tr>
  			<td>性别</td>
  			<td><input type="text" id="sex" name="sex" class="easyui-validatebox" required="true"/></td>
  			<td>&nbsp;</td>
  			<td>电话</td>
  			<td><input type="text" id="phone" name="phone" class="easyui-validatebox" required="true"/></td>
  		</tr>
  		<tr>
  			<td>邮箱</td>
  			<td><input type="email" id="mail" name="mail" class="easyui-validatebox" required="true"/></td>
  			<td>&nbsp;</td>
  			<td>职位</td>
  			<td><input type="text" id="position" name="position" class="easyui-validatebox" required="true"/></td>
  		</tr>
  	</table>
  </form>
</div>

<div id="dlg-buttons">
	<a href="javascript:saveTeacher()" class="easyui-linkbutton" iconCls="icon-ok" >保存 </a>
	<a href="javascript:closeTeacherAddDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div>


</body>
</html>