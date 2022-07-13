<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>书籍管理</title>
<script type="text/javascript">
	var url;
	
	

	function openBookAddDialog() {
		$("#dlg").dialog("open").dialog("setTitle", "添加书籍信息");
		url = "reserveBook.htm";
		$("#showImg").attr('src',"");
	}

	function openBookModifyDialog() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length != 1) {
			$.messager.alert('系统提示', '请选择一条数据进行操作');
			return;
		}
		var row = selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle", "修改班级信息");
		$("#fm").form("load", row);
		$("#showImg").attr('src',row.cover);
		url = "reserveBook.htm?id=" + row.id;
	}

	function saveBook() {
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
					closeBookAddDialog();
					$("#dg").datagrid("reload");
				}
			}
		});
	}


	function closeBookAddDialog() {
		$("#dlg").dialog("close");
		$("#fm").form('clear');
	}

	function deleteBook() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length == 0) {
			$.messager.alert('系统提示', '请至少选择一条数据操作');
			return;
		}
		var strIds = [];
		var strNos = [];
		for ( var i = 0; i < selectedRows.length; i++) {
			strIds.push(selectedRows[i].id);
		}
		var ids = strIds.join(",");
		
		
		$.messager.confirm("系统提示", "确定删除<font color=red>"
				+ selectedRows.length + "</font>数据吗？", function(r) {
			if (r) {
				$.post("deleteBook.htm", {
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
	
	
	
	function uploadcover(){
		$("#fm2").form("submit",{
			url : 'uploadCover.htm',
			onSubmit : function() {},
			success : function(result) {
				$("#showImg").attr('src',"${path}/"+result);
				$("#coverHidden").val("${path}/"+result);
			}
		});
	}
</script>
</head>
<body style="margin: 1px;">
<table id="dg" title="书籍信息 " class="easyui-datagrid" fitColumns="true" 
    pagination="true" rownumbers="true" url="bookList.htm" fit="true" toolbar="#tb">
    <thead>
    	<tr>
    		<th field="ck" checkbox="true" align="center"></th>
    		<th field="id" width="50" align="center" data-options="hidden:true"></th>
    		<th field="name" width="60" align="center">名称</th>
    		<th field="author" width="60" align="center">作者</th>
    		<th field="publish" width="60" align="center">出版社</th>
    		<th field="remarks" width="60" align="center">简介</th>
    	</tr>
    </thead>
</table>
<div id="tb">
	<div>
		<privilege:operation operationId="100042" clazz="easyui-linkbutton" onClick="openBookAddDialog()" name="添加"  iconCls="icon-add" ></privilege:operation>
		<privilege:operation operationId="100043" clazz="easyui-linkbutton" onClick="openBookModifyDialog()" name="修改"  iconCls="icon-edit" ></privilege:operation>
		<privilege:operation operationId="100044" clazz="easyui-linkbutton" onClick="deleteBook()()" name="删除"  iconCls="icon-remove" ></privilege:operation>
	</div>
	<div class="updownInterval"> </div>
</div>









<div id="dlg" class="easyui-dialog" style="width: 660px;height: 300px;padding: 10px 20px"
  closed="true" buttons="#dlg-buttons">
  <form id="fm" method="post" >
  	<table cellspacing="5px;">
  		<input type="hidden" id="coverHidden" name="cover" />
  		<tr>
  			<td>书名</td>
  			<td><input type="text" id="name" name="name" class="easyui-validatebox" required="true"/></td>
  			<td>&nbsp;</td>
  			<td>作者</td>
  			<td><input type="text" id="author" name="author" class="easyui-validatebox" required="true"/></td>
  		</tr>
  		<tr>
  			<td>出版社</td>
  			<td><input type="text" id="publish" name="publish" class="easyui-validatebox" required="true"/></td>
  		</tr>
  		<tr>
  			<td>简介</td>
  			<td colspan="4">
  				<textarea name="remarks" id="remarks"></textarea>
  			</td>
  		</tr>
  		
  	</table>
  </form>
  
  <div id="dlg-buttons">
	<a href="javascript:saveBook()" class="easyui-linkbutton" iconCls="icon-ok" >保存 </a>
	<a href="javascript:closeBookAddDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div>
  
  <form action=""  enctype="multipart/form-data" method="post" id="fm2">
  	  	<table>
  	  		<tr>
  				<td>选择图片</td>
  				<td><input type="file" onchange="uploadcover();" name="cover" id="cover"/></td>
  			</tr>
  			
  			<tr>
  				<td>预览</td>
  				<td><img id="showImg"  /></td>
  			</tr>
  		</table>
  	
  </form>
</div>




</body>
</html>