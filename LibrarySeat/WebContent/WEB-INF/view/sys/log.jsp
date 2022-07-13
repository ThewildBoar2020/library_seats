<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>日志主页</title>
    
    <script type="text/javascript">
		
		// 条件搜索用户信息
		function searchLog(){
    		$('#dg').datagrid('load',{
    			userName:$("#s_userName").val(),
    			module:$("#s_module").val(),
    			operation:$("#s_operation").val(),
    			start:$('#s_start').datetimebox('getValue'),
    			end:$('#s_end').datetimebox('getValue')
    		});
        }

		
    </script>
    </head>
 
 
<body style="margin:1px">

<!-- 加载数据表格 -->
<table  id="dg" class="easyui-datagrid" fitColumns="true"  nowrap="false"
   				 pagination="true" rownumbers="true" url="logList.htm" fit="true" toolbar="#tb">
        <thead>
            	<tr>
            		<th data-options="field:'ck',checkbox:true"></th>
            		<th data-options="fidel:'logId',hidden:'true'">
                	<th data-options="field:'userName',width:80" align="center">操作人</th>
                	<th field="createTime" width="150" align="center"  >操作时间</th>
                	<th field="operation" width="80" align="center">操作类型</th>
                	<th field="module" width="80" align="center">操作模块</th>
                	<th field="ip" width="100" align="center">地址</th>
                	<th field="content" width="680" align="center">日志详情</th>
            	</tr>
        </thead>
</table>


<script type="text/javascript">
    		function formatTime(val,row,index){
    			var unixTimestamp = new Date(value);  
                return unixTimestamp.toLocaleString(); 
        	}
    	</script>
    	
<!-- 数据表格上的搜索和添加等操作按钮 -->
<div id="tb" >
	<div class="updownInterval"> </div>
	<div>
		&nbsp;操作人：&nbsp;<input type="text" name="s_userName" id="s_userName" size="20" onkeydown="if(event.keyCode==13) searchLog()"/>
		&nbsp;操作类型：&nbsp;<input type="text" name="s_operation" id="s_operation" size="20" onkeydown="if(event.keyCode==13) searchLog()"/>
		&nbsp;所属模块：&nbsp;<input type="text" name="s_module" id="s_module" size="20" onkeydown="if(event.keyCode==13) searchLog()"/>
		&nbsp;开始时间：&nbsp;<input class="easyui-datetimebox" name="s_start" id="s_start" />
		&nbsp;结束时间：&nbsp;<input class="easyui-datetimebox" id="s_end" name="s_end"  />
		<div class="updownInterval"> </div>
		<a href="javascript:searchLog()" class="easyui-linkbutton" iconCls="icon-search" >搜索</a>
	</div>
	<div class="updownInterval"> </div>
</div>



</body>
</html>
