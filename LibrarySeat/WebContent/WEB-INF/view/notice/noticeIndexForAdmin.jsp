<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>

<!DOCTYPE html>
<html>
  <head>
		<title>通知管理</title>
    <script type="text/javascript">
		var url;
		// 初始化富文本框
  		var ue = UE.getEditor('editor');
  		function on(){
            $(".window").css("z-index","1001");
            $(".window-shadow").css("z-index","900");
      	};
		
		// 关闭时清空表单
		$(function(){
			$('#dlg').dialog({
		   	 	onClose:function(){
		   	 		$("#fm").form('clear');
					$("#editor").html();
		   	 	},
			   	 onOpen:on,
	             onResize:on,
	             onMove:on
			});
		});
		
		// 删除
		function deleteNotice() {
			var selectedRows = $("#dg").datagrid('getSelections');
			if (selectedRows.length == 0) {
				$.messager.alert('系统提示', '请选择要删除的数据！');
				return;
			}
			var strIds = [];
			for ( var i = 0; i < selectedRows.length; i++) {
				strIds.push(selectedRows[i].id);
			}
			var ids = strIds.join(",");
			$.messager.confirm("系统提示", "您确认要删除这<font color=red>" + selectedRows.length + "</font>条数据吗？", function(r) {
				if (r) {
					$.post("deleteNotice.htm", {ids : ids}, function(result) {
						if (result.success) {
							$.messager.alert('系统提示', "您已成功删除<font color=red>"
									+ result.delNums + "</font>条数据！");
							$("#dg").datagrid("reload");
						} else {
							$.messager.alert('系统提示', result.errorMsg);
						}
					}, "json");
				}
			});
		}


		// 打开新增对话框
	    function openNoticeAddDialog(){
	    		$("#dlg").dialog("open").dialog("setTitle","添加文章");
	    		// 清空表单1
	    		$("#fm").form('clear');
	    		// 清空富文本框
	    		ue.execCommand('cleardoc');
	    		url = 'reserveNotice.htm';
	    }
		
		
		
		// 打开修改对话框
		function openNoticeUpdateDialog(){
			var selectedRows=$("#dg").datagrid('getSelections');
			if(selectedRows.length!=1){
				$.messager.alert('系统提示','请选择一条要编辑的数据！');
				return;
			}
			var row=selectedRows[0];
			$("#dlg").dialog("open").dialog("setTitle","修改信息");
			$("#fm").form("load",row);
			ue.setContent(row.content);
			url="reserveNotice.htm?id="+row.id;
			
		}
		
		
		// 添加或修改保存
	        function reserveNotice(){
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
	    					closeNoticeDialog();
	    					$("#dg").datagrid("reload");
	    				}
	    			}
	    		});
	        }
		
		
		//关闭新增修改对话页面
		function closeNoticeDialog(){
			$("#fm").form('clear');
	    	$("#dlg").dialog("close");
		}
		
		
		function showDetail(id){
			window.open("detail.htm?id="+id);
		}
		
</script>
    </head>
 
 
<body style="margin:1px">

<!-- 加载数据表格 -->
<table  id="dg" class="easyui-datagrid" fitColumns="true"  nowrap="false"
   	    pagination="true" rownumbers="true" url="noticeList.htm" fit="true" toolbar="#tb">
        <thead>
            	<tr>
            		<th data-options="field:'ck',checkbox:true"></th>
            		<th data-options="field:'id',hidden:'true'">
            		<th data-options="field:'content',hidden:'true'">
                	<th field="title" width="60" align="center" data-options="formatter:formatTitle">标题</th>
                	<th field="time" width="60" align="center">时间</th>
            	</tr>
        </thead>
</table>

<script type="text/javascript">
	function formatTitle(value,row){
		return "<a href='javascript:showDetail(\""+row.id+"\")' >"+value+"</a>";
	} 
</script>    	
<!-- 表格上方菜单 -->
<div id="tb" >
	<div class="updownInterval"> </div>
	<div>
		<privilege:operation operationId="100035" clazz="easyui-linkbutton" onClick="openNoticeAddDialog()"       name="添加"              iconCls="icon-add" ></privilege:operation>
		<privilege:operation operationId="100036" clazz="easyui-linkbutton" onClick="openNoticeUpdateDialog()"   name="修改"      iconCls="icon-edit" ></privilege:operation>
		<privilege:operation operationId="100037" clazz="easyui-linkbutton" onClick="deleteNotice()"  name="删除"          iconCls="icon-remove" ></privilege:operation>
	</div>
	
	<div class="updownInterval"> </div>
</div>




<!-- 新增和修改对话框 -->
<div id="dlg" class="easyui-dialog" buttons="#dlg-buttons" style="text-align:right;width: 800px;height: 650px;padding: 10px 20px" closed="true" >
 <form id="fm" method="post">
 		<table cellspacing="5px;" styel="text-align:center">
  		<tr>
  			<td >标题</td>
  			<td><input type="text" class="easyui-textbox" id="title" name="title" style="width:300px;height:35px"/></td>
  		</tr>
  		<tr>
  			<td>&nbsp;</td>
  			<td>&nbsp;</td>
  		</tr>
  		
  		<tr>
  			<td>正文</td>
  			<td>&nbsp;</td>
  		</tr>
  		<tr>
  			<td colspan="2" >
  				<script id="editor" type="text/plain" style="width:700px;height:300px;" name="content"></script>		
  			</td>
  		</tr>
  	</table>
 </form>
 

</div>
<div id="dlg-buttons" style="text-align:center">
	<a href="javascript:reserveNotice()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
	<a href="javascript:closeNoticeDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>




</body>
</html>
