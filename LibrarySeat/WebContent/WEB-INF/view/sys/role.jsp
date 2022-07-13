<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title></title>
    
    <script type="text/javascript">

	$(function(){
		$('#dlg').dialog({
		    onClose:function(){
				$("#fm").form('clear');
		    }
		});
	});
    
	function searchRole(){
		$('#dg').datagrid('load',{
			roleName:$("#s_roleName").val()
		});
	}
	
	function deleteRole(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length==0){
			$.messager.alert('系统提示','请选择要删除的数据！');
			return;
		} 
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].roleId);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确认要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				$.post("deleteRole.htm",{ids:ids},function(result){
					if(result.success){
						$.messager.alert('系统提示',"您已成功删除<font color=red>"+result.delNums+"</font>条数据！");
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert('系统提示','<font color=red>'+selectedRows[result.errorIndex].roleName+'</font>'+result.errorMsg);
					}
				},"json");
			}
		});
	}
	
	var url;

	//打开新增框
	function openRoleAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加角色信息");
		$("#roleName").removeAttr("readonly");
		url="reserveRole.htm";
	}

	// 打开修改框
	function openRoleUpdateDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert('系统提示','请选择一条要编辑的数据！');
			return;
		}
		var row=selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","修改角色信息");
		$("#fm").form("load",row);
		$("#roleName").attr("readonly","readonly");
		url="reserveRole.htm?roleId="+row.roleId;
	}

	// 保存
	function reserveRole(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				return $(this).form("validate");
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.errorMsg){
					$.messager.alert('系统提示',"<font color=red>"+result.errorMsg+"</font>");
					return;
				}else{
					$.messager.alert('系统提示','保存成功');
					closeRoleDialog();
					$("#dg").datagrid("reload");
				}
			}
		});
	}

	// 关闭新增修改框
	function closeRoleDialog(){
		$("#dlg").dialog("close");
		$("#fm").form('clear');
	}

	// 授权
	function openMenuDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert('系统提示','请选择一条要授权的角色！');
			return;
		}
		var row=selectedRows[0];
		roleId=row.roleId;
		$("#dlg2").dialog("open").dialog("setTitle","角色授权");
		url="chooseMenu.htm?parentId=-1&roleId="+roleId;
		// 加载菜单表格树
		$("#tree").tree({
			lines:true,
			url:url,
			checkbox:true,
			cascadeCheck:false,
			onLoadSuccess:function(){
				$("#tree").tree('expandAll');
			},
			onCheck:function(node,checked){
				if(checked){
					checkNode($('#tree').tree('getParent',node.target));
				}
			}
		});
	}

	// 递归检查勾选他的上级
	function checkNode(node){
		if(!node){
			return;
		}else{
			checkNode($('#tree').tree('getParent',node.target));
			$('#tree').tree('check',node.target);
		}
	}

	// 关闭授权框
	function closeMenuDialog(){
		$("#dlg2").dialog("close");
	}

	// 授权
	function saveMenu(){
		var nodes=$('#tree').tree('getChecked');
		var menuArrIds=[];
		for(var i=0;i<nodes.length;i++){
			menuArrIds.push(nodes[i].id);
		}
		var menuIds=menuArrIds.join(",");
		$.post("updateRoleMenu.htm",{menuIds:menuIds,roleId:roleId},function(result){
			if(result.success){
				$.messager.alert('系统提示','授权成功！');
				closeMenuDialog();
			}else{
				$.messager.alert('系统提示',result.errorMsg);
			}
		},"json");
	}
</script>
<title>角色管理</title>
</head>
<body style="margin: 1px;">

<!-- 展示列表 -->
<table id="dg" class="easyui-datagrid" fitColumns="true" 
    pagination="true" rownumbers="true" url="roleList.htm" fit="true" toolbar="#tb">
    <thead>
    	<tr>
    		<th field="cb" checkbox="true" align="center"></th>
    		<th field="roleId" width="50" align="center">编号</th>
    		<th field="roleName" width="100" align="center">角色名称</th>
    		<th field="roleDescription" width="200" align="center">备注</th>
    	</tr>
    </thead>
</table>


<!-- 数据表格上的搜索和添加等操作按钮 -->
<div id="tb">
	<div class="updownInterval"> </div>
	<div>
		<privilege:operation operationId="10006" clazz="easyui-linkbutton" onClick="openRoleAddDialog()" name="添加"  iconCls="icon-add" ></privilege:operation>
		<privilege:operation operationId="10007" clazz="easyui-linkbutton" onClick="openRoleUpdateDialog()" name="修改"  iconCls="icon-edit" ></privilege:operation>
		<privilege:operation operationId="10008" clazz="easyui-linkbutton" onClick="deleteRole()" name="删除"  iconCls="icon-remove" ></privilege:operation>
		<privilege:operation operationId="10009" clazz="easyui-linkbutton" onClick="openMenuDialog()" name="授权"  iconCls="icon-edit" ></privilege:operation>
	</div>
	<div class="updownInterval"> </div>
	<div>
		&nbsp;角色名称：&nbsp;<input type="text" name="s_roleName" id="s_roleName" size="20" onkeydown="if(event.keyCode==13) searchRole()"/>
		<a href="javascript:searchRole()" class="easyui-linkbutton" iconCls="icon-search" >搜索</a>
	</div>
	<div class="updownInterval"> </div>
</div>



<!-- 角色新增修改表单 -->
<div id="dlg" class="easyui-dialog" style="width: 570px;height: 350px;padding: 10px 20px"
  closed="true" buttons="#dlg-buttons">
  <form id="fm" method="post">
  	<table cellspacing="5px;">
  		<tr>
  			<td>角色名称：</td>
  			<td width="80%"><input type="text" id="roleName" name="roleName" class="easyui-validatebox" required="true"/></td>
  		</tr>
  		<tr>
  			<td valign="top">备注：</td>
  			<td colspan="2">
  				<textarea rows="7" cols="50" name="roleDescription" id="roleDescription"></textarea>
  			</td>
  		</tr>
  	</table>
  </form>
</div>

<div id="dlg-buttons"  style="text-align:center">
	<a href="javascript:reserveRole()" class="easyui-linkbutton" iconCls="icon-ok" >保存</a>
	<a href="javascript:closeRoleDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div>




<!-- 权限菜单表格树 -->
<div id="dlg2" class="easyui-dialog" style="width: 300px;height: 450px;padding: 10px 20px"
  closed="true" buttons="#dlg2-buttons">
	<ul id="tree" class="easyui-tree"></ul>
</div>

<div id="dlg2-buttons">
	<a href="javascript:saveMenu()" class="easyui-linkbutton" iconCls="icon-ok" >授权</a>
	<a href="javascript:closeMenuDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div>
</body>
</html>