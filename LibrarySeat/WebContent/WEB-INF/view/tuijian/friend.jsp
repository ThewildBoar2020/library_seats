<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>朋友推荐</title>
<script type="text/javascript">
	$(function(){
		$.ajax({
			url:'${path}/friend/friendList.htm', 
			dataType:'json',
			type:'post',
			async:false,
			success:function(data){
				var str = "<div style='width:30%;height:2px;background:blue'></div>";
				for(var i=0;i<data.length;i++){
					str += "<div style='width:30%;height:50px;'><br/>";
					str += data[i].name + "  " + data[i].no + "  " + data[i].clazzname ;
					str +=  "<br/></div><div style='width:30%;height:2px;background:blue'></div>";
				}
				$("#a").html(str);
			}
		});
	});
</script>
</head>
<body style="margin: 5px;" >
	<div style="width:100%;height:100%;" id = "a">
	
		<div style='width:30%;height:2px;background:blue'></div>
		<div style='width:30%;height:50px;'>
			<br/>内容<br/>
		</div>
		
		<div style='width:30%;height:2px;background:blue'></div>
		<div style='width:30%;height:50px;'>
			<br/>内容<br/>
		</div>	
	</div>
</body>
</html>