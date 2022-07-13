<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>

<!DOCTYPE html>
<html>
  <head>
		<title>${title }</title>
    <script type="text/javascript">
		
		
	</script>
    </head>
 
 
<body style="margin:1px;text-align:center;align:center;width:70%;float:left;margin-left:15%">
	
	<div style="height:80px;text-align:center;text:center;line-height:80px">
		${title }
	</div>
	<c:forEach items="${topicList}" var="topic" varStatus="status">  
		<div style="width:100%;height:2px;background:blue"></div>
		<div style="width:100%;height:80px;">
		<div style="height:15px;text-align:left">
			${topic.author }发表于${topic.time }
		</div>
		<br/>
		<div style="height:64px;width:100%;text-align:left">
		${topic.content}
		</div>
		</div>
	</c:forEach>
		<div style="width:100%;height:2px;background:blue"></div>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	
		<div style="height:100px">
			<form action="${path }/topic/addTopic.htm" >
				<input type='hidden' value="${bbsid }" name="bbsid"/>
				<textarea id="content" name="content" style="width:700px;height:80px">您的内容</textarea>
				<input type="submit" value="发表"/>
			</form>
		</div>
</body>
</html>
