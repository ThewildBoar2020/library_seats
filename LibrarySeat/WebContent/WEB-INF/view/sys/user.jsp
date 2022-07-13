<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>

<!DOCTYPE html>
<html>
  <head>
    <title>用户主页</title>
    
    <script type="text/javascript">
		
    	$(function(){
			$('#dlg').dialog({
		   	 	onClose:function(){
					//closeUserDialog();
		   	 		$("#fm").form('clear');
		   	 	}
			});
		});
    
		var url;
		// 条件搜索用户信息
		function searchUser(){
    		$('#dg').datagrid('load',{
    			userName:$("#s_userName").val(),
    			roleId:$('#s_roleId').combobox("getValue")
    		});
        }

		// 打开新增用户信息对话框
        function openUserAddDialog(){
        	$("#dlg").dialog("open").dialog("setTitle","添加用户信息");
        	$("#userName").removeAttr("readonly");
        	url = 'reserveUser.htm';
        }

		// 打开修改用户信息对话框
        function openUserUpdateDialog(){
    		var selectedRows=$("#dg").datagrid('getSelections');
    		if(selectedRows.length!=1){
    			$.messager.alert('系统提示','请选择一条要编辑的数据！');
    			return;
    		}
    		var row=selectedRows[0];
    		$("#dlg").dialog("open").dialog("setTitle","修改用户信息");
    		$("#fm").form("load",row);
    		$("#userName").attr("readonly","readonly");
    		url="reserveUser.htm?userId="+row.userId;
    	}

        // 保存用户信息
        function reserveUser(){
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
    					closeUserDialog();
    					$("#dg").datagrid("reload");
    				}
    			}
    		});
        }

        // 关闭添加修改角色对话框
        function closeUserDialog(){
        	$("#fm").form('clear');
        	$("#dlg").dialog("close");
        }

		// 打开选择角色对话框
        function openRoleChooseDialog(){
        	$("#dlg2").dialog("open").dialog("setTitle","选择角色");
        }

		// 搜索角色
        function searchRole(){
    		$('#dg2').datagrid('load',{
    			roleName:$("#s_roleName").val()
    		});
    	}

		// 关闭选择角色对话框
    	function closeRoleDialog(){
    		$("#s_roleName").val("");
    		$('#dg2').datagrid('load',{
    			s_roleName:""
    		});
    		$("#dlg2").dialog("close");
    	}

    	// 选择角色
    	function chooseRole(){
    		var selectedRows=$("#dg2").datagrid('getSelections');
    		if(selectedRows.length!=1){
    			$.messager.alert('系统提示','请选择一个角色！');
    			return;
    		}
    		var row=selectedRows[0];
    		$("#roleId").val(row.roleId);
    		$("#roleName").val(row.roleName);
    		closeRoleDialog();
    	}

		//双击选中
    	$(function(){
    		$("#dg2").datagrid({
    			onDblClickRow:function(rowIndex,rowData){
    				chooseRole();
    			}
    		});
    	})
    	
    	// 删除用户
    	function deleteUser(){
    		var selectedRows=$("#dg").datagrid('getSelections');
    		if(selectedRows.length==0){
    			$.messager.alert('系统提示','请选择要删除的数据！');
    			return;
    		}
    		var strIds=[];
    		for(var i=0;i<selectedRows.length;i++){
    			strIds.push(selectedRows[i].userId);
    		}
    		var ids=strIds.join(","); 
    		$.messager.confirm("系统提示","您确认要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
    			if(r){
    				$.post("deleteUser.htm",{ids:ids},function(result){
    					if(result.success){
    						$.messager.alert('系统提示',"您已成功删除<font color=red>"+result.delNums+"</font>条数据！");
    						$("#dg").datagrid("reload");
    					}else{
    						$.messager.alert('系统提示',result.errorMsg);
    					}
    				},"json");
    			}
    		});
    	}


		// 加载选择角色数据  并添加 请选择
    	$(function(){
        	var relation_id_sign = 0;
    		$("#s_roleId").combobox({
                url: '${path }/role/roleCombobox.htm',
                method: 'post',
                valueField: 'roleId',
                textField: 'roleName',
                editable: false,
                panelHeight: 'auto',
                onLoadSuccess: function() {
                    if (relation_id_sign == 0){
                        var data = $(this).combobox('getData');
                        data.unshift({'roleId':'','roleName':'-----全部-----'});
                        relation_id_sign++;
                        $("#s_roleId").combobox("loadData", data);//重新加载数据，且当 relation_id_sign==1时加载
                    }
                }
            });
        });
    </script>
    </head>
 
 
<body style="margin:1px">

<!-- 加载数据表格 -->
<table  id="dg" class="easyui-datagrid" fitColumns="true"
   				 pagination="true" rownumbers="true" url="userList.htm" fit="true" toolbar="#tb">
        <thead>
            	<tr>
            		<th data-options="field:'ck',checkbox:true"></th>
            		<th data-options="fidel:'roleId',hidden:'true'">
                	<th data-options="field:'userId',width:80" align="center">用户编号</th>
                	<th field="userName" width="60" align="center">用户名</th>
                	<th field="password" width="60" align="center">密码</th>
                	<th field="roleName" width="60" align="center">用户角色</th>
                	<th field="userDescription" width="60" align="center">备注</th>
            	</tr>
        </thead>
</table>
    	
<!-- 数据表格上的搜索和添加等操作按钮 -->
<div id="tb" >
	<div class="updownInterval"> </div>
	<div>
		<privilege:operation operationId="10003" clazz="easyui-linkbutton" onClick="openUserAddDialog()" name="添加"  iconCls="icon-add" ></privilege:operation>
		<privilege:operation operationId="10004" clazz="easyui-linkbutton" onClick="openUserUpdateDialog()" name="修改"  iconCls="icon-edit" ></privilege:operation>
		<privilege:operation operationId="10005" clazz="easyui-linkbutton" onClick="deleteUser()()" name="删除"  iconCls="icon-remove" ></privilege:operation>
	</div>
	<div class="updownInterval"> </div>
	<div>
		&nbsp;用户名：&nbsp;<input type="text" name="s_userName" id="s_userName" size="20" onkeydown="if(event.keyCode==13) searchUser()"/>
		&nbsp;用户角色：&nbsp;<input class="easyui-combobox" id="s_roleId" name="s_roleId"  />
		<a href="javascript:searchUser()" class="easyui-linkbutton" iconCls="icon-search" >搜索</a>
	</div>
	<div class="updownInterval"> </div>
</div>




<!-- 新增和修改对话框 -->
<div id="dlg" class="easyui-dialog" style="text-align:right;width: 620px;height: 320px;padding: 10px 20px"
  closed="true" buttons="#dlg-buttons">
 <form id="fm" method="post">
 	<table cellspacing="5px;">
  		<tr>
  			<td>用户名：</td>
  			<td><input type="text" id="userName" name="userName" class="easyui-validatebox" required="true"/></td>
  			<td>&nbsp;&nbsp;</td>
  			<td>密码：</td>
  			<td><input type="text" id="password" name="password" class="easyui-validatebox" required="true"/></td>
  		</tr>
  		<tr>
  			<td>角色：</td>
  			<td><input type="hidden" id="roleId" name="roleId" /><input type="text" id="roleName" name="roleName" readonly="readonly" class="easyui-validatebox" required="true"/></td>
  			<td>&nbsp;&nbsp;</td>
  			<td colspan="2"><a href="javascript:openRoleChooseDialog()" class="easyui-linkbutton" >选择角色</a></td>
  		</tr>
  		<tr>
  			<td valign="top">备注：</td>
  			<td colspan="4">
  				<textarea rows="7" cols="50" name="userDescription" id="userDescription"></textarea>
  			</td>
  		</tr>
  	</table>
 </form>
</div>
<div id="dlg-buttons" style="text-align:center">
	<a href="javascript:reserveUser()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
	<a href="javascript:closeUserDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>


<!-- 用户角色对话框 -->
<div id="dlg2" class="easyui-dialog" iconCls="icon-search" style="width: 500px;height: 480px;padding: 10px 20px"
  closed="true" buttons="#dlg2-buttons">
  <div style="height: 40px;" align="center">
  	角色名称：<input type="text" id="s_roleName" name="s_roleName" onkeydown="if(event.keyCode==13) searchRole()"/>
  	<a href="javascript:searchRole()" class="easyui-linkbutton" iconCls="icon-search" >搜索</a>
  </div>
  <div style="height: 350px;">
  	<table id="dg2" title="查询结果" class="easyui-datagrid" fitColumns="true"  pagination="true" rownumbers="true" url="${path }/role/roleList.htm" singleSelect="true" fit="true" >
    <thead>
    	<tr>
    		<th field="roleId" width="50" align="center">编号</th>
    		<th field="roleName" width="100" align="center">角色名称</th>
    		<th field="roleDescription" width="200" align="center">备注</th>
    	</tr>
    </thead>
</table>
  </div>
</div>

<div id="dlg2-buttons">
	<a href="javascript:chooseRole()" class="easyui-linkbutton" iconCls="icon-ok" >确定</a>
	<a href="javascript:closeRoleDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div>

</body>
</html>
