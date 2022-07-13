<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>学生管理</title>
<script type="text/javascript">
	var url;
	
	

	function openStudentAddDialog() {
		$("#dlg").dialog("open").dialog("setTitle", "添加班级信息");
		url = "reserveStudent.htm";
			$("#showImg").attr('src',"");
	}

	function openStudentModifyDialog() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length != 1) {
			$.messager.alert('系统提示', '请选择一条数据进行操作');
			return;
		}
		var row = selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle", "修改班级信息");
		$("#fm").form("load", row);
		$("#showImg").attr('src',row.photo);
		url = "reserveStudent.htm?id=" + row.id;
	}

	function saveStudent() {
		var v = $("#clazzid").combobox('getValue');
		if(v==null || v.length==0){
			$.messager.alert('系统提示', '请选择班级');
			return;
		}
		var egetFile=$('#photo');
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
					closeStudentAddDialog();
					$("#dg").datagrid("reload");
				}
			}
		});
	}


	function closeStudentAddDialog() {
		$("#dlg").dialog("close");
		$("#fm").form('clear');
	}

	function deleteStudent() {
		var selectedRows = $("#dg").datagrid('getSelections');
		if (selectedRows.length == 0) {
			$.messager.alert('系统提示', '请至少选择一条数据操作');
			return;
		}
		var strIds = [];
		var strNos = [];
		for ( var i = 0; i < selectedRows.length; i++) {
			strIds.push(selectedRows[i].id);
			strNos.push(selectedRows[i].no);
		}
		var ids = strIds.join(",");
		var nos = strNos.join(",");
		
		
		$.messager.confirm("系统提示", "确定删除<font color=red>"
				+ selectedRows.length + "</font>数据吗？", function(r) {
			if (r) {
				$.post("deleteStudent.htm", {
					ids : ids ,nos:nos
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
	
	
	
	function uploadPhoto(){
		$("#fm2").form("submit",{
			url : 'uploadPhoto.htm',
			onSubmit : function() {},
			success : function(result) {
				$("#showImg").attr('src',"${path}/"+result);
				$("#photoHidden").val("${path}/"+result);
			}
		});
	}
</script>
</head>
<body style="margin: 1px;">
<table id="dg" class="easyui-datagrid" fitColumns="true" 
    pagination="true" rownumbers="true" url="studentList.htm" fit="true" toolbar="#tb">
    <thead>
    	<tr>
    		<th field="ck" checkbox="true" align="center"></th>
    		<th field="id" width="50" align="center" data-options="hidden:true"></th>
    		<th field="no" width="60" align="center">学号</th>
    		<th field="name" width="60" align="center">姓名</th>
    		<th field="sex" width="60" align="center">性别</th>
    		<th field="clazzname" width="60" align="center">班级</th>
    		<th field="birth" width="60" align="center">生日</th>
    		<th field="phone" width="60" align="center">电话</th>
    		<th field="mail" width="60" align="center">邮箱</th>
    	</tr>
    </thead>
</table>
<div id="tb">
	<div>
		<privilege:operation operationId="100021" clazz="easyui-linkbutton" onClick="openStudentAddDialog()" name="添加"  iconCls="icon-add" ></privilege:operation>
		<privilege:operation operationId="100022" clazz="easyui-linkbutton" onClick="openStudentModifyDialog()" name="修改"  iconCls="icon-edit" ></privilege:operation>
		<privilege:operation operationId="100023" clazz="easyui-linkbutton" onClick="deleteStudent()()" name="删除"  iconCls="icon-remove" ></privilege:operation>
	</div>
	<div class="updownInterval"> </div>
</div>









<div id="dlg" class="easyui-dialog" style="width: 660px;height: 300px;padding: 10px 20px"
  closed="true" buttons="#dlg-buttons">
  <form id="fm" method="post" >
  	<table cellspacing="5px;">
  		<input type="hidden" id="photoHidden" name="photo" />
  		<tr>
  			<td>学号</td>
  			<td><input type="text" id="no" name="no" class="easyui-validatebox" required="true"/></td>
  			<td>&nbsp;</td>
  			<td>姓名</td>
  			<td><input type="text" id="name" name="name" class="easyui-validatebox" required="true"/></td>
  		</tr>
  		<tr>
  			<td>性别</td>
  			<td><input type="text" id="sex" name="sex" class="easyui-validatebox" required="true"/></td>
  			<td>&nbsp;</td>
  			<td>生日</td>
  			<td><input type="text" id="birth" name="birth" class="easyui-datebox" required="true"/></td>
  		</tr>
  		<tr>
  			<td>电话</td>
  			<td><input type="text" id="phone" name="phone" class="easyui-validatebox" required="true"/></td>
  			<td>&nbsp;</td>
  			<td>邮箱</td>
  			<td><input type="mail" id="mail" name="mail" required="true"/></td>
  		</tr>
  		<tr>
  			<td>班级</td>
  			<td><input class="easyui-combobox" name="clazzid" id="clazzid"  size="20" data-options="editable:false,panelHeight:'auto',valueField:'id',textField:'name',url:'${path }/clazz/comboList.htm'"/></td>
  		</tr>
  		
  	</table>
  </form>
  
  <div id="dlg-buttons">
	<a href="javascript:saveStudent()" class="easyui-linkbutton" iconCls="icon-ok" >保存 </a>
	<a href="javascript:closeStudentAddDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div>
  
  <form action=""  enctype="multipart/form-data" method="post" id="fm2">
  	  	<table>
  	  		<tr>
  				<td>选择图片</td>
  				<td><input type="file" onchange="uploadPhoto();" name="photo" id="photo"/></td>
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