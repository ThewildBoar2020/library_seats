$(function() {  
	$('body').height($(document).height());;
	
    $('#mydatagrid').datagrid({       
        iconCls : 'icon-ok',   
        pageSize : 10,//默认选择的分页是每页5行数据  
        pageList : [10, 20, 30, 40, 50 ],//可以选择的分页集合  
        nowrap : true,//设置为true，当数据长度超出列宽时将会自动截取  
        striped : true,//设置为true将交替显示行背景。  
        collapsible : true,//显示可折叠按钮 
        toolbar:[{
    		text:'添加',
    		iconCls:'icon-add',
    		handler:function(){
        		$("#dd").dialog({
        			title : '添加用户信息',
        			resizable: true,
        			width : 300,
        			height : 250,
        			cache : false,
        			href : './toDeptAdd.htm'
        		});
        	}
    	},'-',{
    		text:'修改',
    		iconCls:'icon-edit',
    		handler:function(){
    			var row = $('#mydatagrid').datagrid('getSelections');
    				if (row.length != 1) {
    					$.messager.alert('提醒','请选择一条记录进行操作!','info');
    				} else {
    					$("#dd").dialog({
    	        			title : '修改用户信息',
    	        			resizable: true,
    	        			width : 300,
    	        			height : 250,
    	        			cache : false,
    	        			href : "./toDeptUpdate.htm?id="+row[0].id+"&name="+row[0].name+"&leadname="+row[0].leadname+"&total="+row[0].total
    	        		});
    				}		
    		}
    	},'-',{
    		text:'删除',
    		iconCls:'icon-remove',
    		handler:function(){
    			var rows = $('#mydatagrid').datagrid('getSelections');
    			var num = rows.length;
    			var managers = null;
    			if(num==0){
    				$.messager.alert('提醒','请至少选择一条记录进行操作!','info');
    			}else{
    				$.messager.confirm('提醒', '确认要删除所选数据吗?', function(r){
    					if (r){
    						for ( var i = 0; i < num; i++) {
								if (null == managers || i == 0) {
									managers = rows[i].id;
								} else {
									managers = managers+ "," + rows[i].id;
								}
							}
    						$.ajax({
    							url:'./deptDelete.htm',
    							data:{ids:managers},
    							type:'post',
    							async:false,
    							success:function(data){
    								if(data=="success"){
    									$.messager.alert('消息','删除成功!','info');
    									$("#mydatagrid").datagrid("reload");
    								}else{
    									$.message.alert('消息','对不起，删除失败，稍后重试!','info');
    								}
    							}
    						});
    					}
    				});
    			}
    		}
    	}],//在添加 增添、删除、修改操作的按钮要用到这个     
    	url:'userList.htm',//url调用Action方法  
        loadMsg : '数据装载中......',  
        singleSelect:false,//为true时只能选择单行  
        fitColumns:true,//允许表格自动缩放，以适应父容器  
        remoteSort : false, 
    });   
}); 




function doSearch(){
	$('#mydatagrid').datagrid('load',{
		userName:$("#s_roleName").val()
	});
}