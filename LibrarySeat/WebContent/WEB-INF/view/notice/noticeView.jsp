<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>

<!DOCTYPE html>
<html>
  <head>
		<title>${notice.title }</title>
    <script type="text/javascript">
		
		
	</script>
    </head>
 
 
<body style="margin:1px;text-align:center;align:center;width:70%;float:left;margin-left:15%">
	<div style="height:50px;line-height:50px;text-align:center;align:center">
		${notice.title }
	</div>
	
	<div style="height:20px;line-height:20px;text-align:center;align:center">
		${notice.time }
	</div>
	<br/>
	<div  style="text-align:left;align:center">
		${notice.content }
	</div>
</body>
</html>
