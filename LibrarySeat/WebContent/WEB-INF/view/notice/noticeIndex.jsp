<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>

<!DOCTYPE html>
<html>
  <head>
		<title>通知管理</title>
		<style type="text/css">
			.datagrid-body td{  
				border-right:1px dotted transparent;  
				border-bottom:1px dotted transparent;  
			}  
		</style>
    <script type="text/javascript">
	
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
            		<th data-options="field:'id',hidden:'true'">
            		<th data-options="field:'content',hidden:'true'">
                	<th field="title" width="60" align="center" data-options="formatter:formatTitle"></th>
                	<th field="time" width="60" align="center"></th>
            	</tr>
        </thead>
</table>

<script type="text/javascript">
	function formatTitle(value,row){
		return "<a href='javascript:showDetail(\""+row.id+"\")' >"+value+"</a>";
	} 
</script>    	

</body>
</html>
