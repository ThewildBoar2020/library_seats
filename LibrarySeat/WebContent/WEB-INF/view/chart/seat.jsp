<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>图表</title>
<script type="text/javascript">

	$(function(){
		analyse();
	});
	// 画图
	function analyse(){
		$("#chartImg").attr('src',"${path}/chart/findSeatChart.htm"); 
	}
	
</script>
</head>
<body style="margin: 1px;">
	<img  id="chartImg" />
</body>
</html>