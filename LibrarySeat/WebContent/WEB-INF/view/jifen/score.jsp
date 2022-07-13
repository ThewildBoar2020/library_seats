<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>积分管理</title>
<script type="text/javascript">
	var url;
	
	
	function searchScore() {
		$('#dg').datagrid('load', {
			studentno : $("#s_no").val(),
			studentname : $('#s_name').val()
		});
	}

	function openIllegalAddDialog() {
		$("#dlg").dialog("open").dialog("setTitle", "添加违章信息");
		url = "${path}/illegal/reserveIllegal.htm";
	}


	function saveIllegal() {
		$("#fm").form("submit",
				{
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
							closeIllegalAddDialog();
							$("#dg2").datagrid("reload");
							$("#dg").datagrid("reload");
						}
					}
				});
	}

	function closeIllegalAddDialog() {
		$("#dlg").dialog("close");
		var no = $("#hiddenStudentno").val();
		$("#fm").form('clear');
		$("#hiddenStudentno").val(no);
	}

	function deleteIllegal() {
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
		
		$.messager.confirm("系统提示", "确定删除<font color=red>"+ selectedRows.length + "</font>数据吗？", function(r) {
			if (r) {
				$.post("${path}/illegal/deleteIllegal.htm", {
					ids : ids
				}, function(result) {
					if (result.success) {
						$.messager.alert('系统提示', "删除<font color=red>" + result.delNums + "</font>条数据成功");
						$("#dg2").datagrid("reload");
					} else {
						$.messager.alert('系统提示', result.errorMsg);
					}
				}, "json");
			}
		});
	}
	
	function showDetail(studentno){
		$("#dlg2").dialog("open").dialog("setTitle", "积分违章详情");
		$("#hiddenStudentno").val(studentno);
		$("#dg2").datagrid({
			url:'${path}/illegal/illegalList.htm?studentno='+studentno,
			pagination:true,
			fitColumns:true,
			rownumbers:true,
			fit:true,
			onLoadSuccess: function (data) {
                 				$(this).datagrid('doCellTip', { 'max-width': '400px', 'delay': 500 });
           					}
		});
		
	} 
</script>
</head>
<body style="margin: 1px;">
<table id="dg" class="easyui-datagrid" fitColumns="true" 
    pagination="true" rownumbers="true" url="scoreList.htm" fit="true" toolbar="#tb">
    <thead>
    	<tr>
    		<th field="id" width="50" align="center" data-options="hidden:true"></th>
    		<th field="studentno" width="60" align="center">学号</th>
    		<th field="studentname" width="60" align="center">姓名</th>
    		<th field="total" width="60" align="center" data-options="formatter:formatTotal">积分</th>
    	</tr>
    </thead>
</table>
<script type="text/javascript">
	function formatTotal(value,row){
		return "<a href='javascript:showDetail(\""+row.studentno+"\")' >"+value+"</a>";
	} 
</script>
<div id="tb">
	<div class="updownInterval"> </div>
	<div>
		&nbsp;姓名：&nbsp;<input type="text" name="s_name" id="s_name" size="20" onkeydown="if(event.keyCode==13) searchScore()"/>
		&nbsp;学号：&nbsp;<input type="text" name="s_no" id="s_no" size="20" onkeydown="if(event.keyCode==13) searchScore()"/>
		<a href="javascript:searchScore()" class="easyui-linkbutton" iconCls="icon-search" >搜索</a>
	</div>
	<div class="updownInterval"> </div>
</div>









<div id="dlg" class="easyui-dialog" style="width: 520px;height: 320px;padding: 10px 20px"
  closed="true" buttons="#dlg-buttons">
  <form id="fm" method="post">
  	<table cellspacing="5px;">
  		<input type="hidden" id="hiddenStudentno" name="studentno"/>
  		<tr>
  			<td>时间</td>
  			<td><input type="text" id="time" name="time"  class="easyui-datetimebox" required="true"/></td>
  			<td>&nbsp;</td>
  			<td>扣分</td>
  			<td><input type="number" id="score" name="score" class="easyui-validatebox" required="true"/></td>
  		</tr>
  		<tr>
  			<td>备注</td>
  			<td colspan="4"><textarea id="remarks" name="remarks"></textarea></td>
  		</tr>
  	</table>
  </form>
</div>

<div id="dlg-buttons">
	<a href="javascript:saveIllegal()" class="easyui-linkbutton" iconCls="icon-ok" >保存 </a>
	<a href="javascript:closeIllegalAddDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div>







<!-- 积分详情 -->
<div id="dlg2" class="easyui-dialog" iconCls="icon-search" style="width: 500px;height: 480px;padding: 10px 20px"
  closed="true" buttons="#dlg2-buttons">
  <div class="updownInterval"> </div>
	<div>
		<privilege:operation operationId="100030" clazz="easyui-linkbutton" onClick="openIllegalAddDialog()" name="添加"  iconCls="icon-add" ></privilege:operation>
		<privilege:operation operationId="100032" clazz="easyui-linkbutton" onClick="deleteIllegal()" name="删除"  iconCls="icon-remove" ></privilege:operation>
	</div>
  <div class="updownInterval"> </div>
  <div style="height: 400px;" align="center">
  	<table id="dg2" title="积分详情" class="easyui-datagrid"  >
    <thead>
    	<tr>
    		<th field="studentno" width="200" align="center">学号</th>
    		<th field="studentname" width="200" align="center">姓名</th>
    		<th field="time" width="200" align="center">时间</th>
    		<th field="score" width="200" align="center">扣分</th>
    		<th field="remarks" width="200" align="center">违章</th>
    	</tr>
    </thead>
</table>
  </div>
</div>







</body>
</html>