<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>选座位</title>
<script type="text/javascript">


</script>
</head>
<body style="margin: 1px;">
	<table id="dg" title="阅览室余坐信息 " class="easyui-datagrid" fitColumns="true" 
    rownumbers="true" url="${path }/block/blockList.htm" fit="true" toolbar="#tb">
    <thead>
    	<tr>
    		<th field="date" width="60" align="center">日期</th>
    		<th field="time" width="60" align="center">时间</th>
    		<th field="roomname" width="60" align="center">阅览室名称</th>
    		<th field="page" width="60" align="center">余坐</th>
    	</tr>
    </thead>
</table>
  	
</body>
</html>