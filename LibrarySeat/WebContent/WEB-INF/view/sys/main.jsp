<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>图书馆预约占座管理系统后台管理</title>
    <script type="text/javascript">
    var url;
	$(function(){

		
		// 加载左树菜单
		$("#tree").tree({
			lines:true,
			url:'menuTree.htm?parentId=-1',
			onLoadSuccess:function(){
				$("#tree").tree('expandAll');
			},
			onClick:function(node){
				if(node.id==16){
					logout();
				}else if(node.id==15){
					openPasswordUpdateDialog();
				}else if(node.attributes.menuUrl){
					openTab(node);
				}
			}
		});

		// 退出登录
		function logout(){
			$.messager.confirm('系统提示','您确定要退出系统吗？',function(r){
				if(r){
					window.location.href='logout.htm';
				}
			});
		}

		// 打开修改密码的窗体
		function openPasswordUpdateDialog(){
			url="updatePassword.htm";
			$("#dlg").dialog("open").dialog("setTitle","修改密码");
		}

		/**左边的菜单点击显示
			如果存在（即已经打开了），选中他
			如果不存在则打开他
		*/		
		function openTab(node){
			if($("#tabs").tabs("exists",node.text)){
				$("#tabs").tabs("select",node.text);
			}else{
				var content="<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src="+node.attributes.menuUrl+"></iframe>"
				$("#tabs").tabs("add",{
					title:node.text,
					iconCls:node.iconCls,
					closable:true,
					content:content
				});
			}
			bindTabEvent();
		}


		bindTabEvent();
		bindTabMenuEvent();
		 
		
	});

	function bindTabEvent(){
		$(".tabs-inner").dblclick(function(){
			var subtitle = $(this).children(".tabs-title").text();
			$('#tabs').tabs('close',subtitle);
		})
		$(".tabs-inner").bind('contextmenu',function(e){
			
			$('#mm').menu('show', {
				left: e.pageX,
				top: e.pageY
			});
			var subtitle =$(this).children(".tabs-title").text();
			$('#mm').data("currtab",subtitle);
			return false;
		});
	}
			

	function bindTabMenuEvent(){
		var temp = $('#tabs');
		$('#mm-tabrefresh').click(function(){
			var currtab_title = $('#mm').data("currtab");
			var frame = temp.tabs('getTab', currtab_title).find('iframe')
			frame.attr('src',frame.attr('src'));
		});
		//关闭当前
		$('#mm-tabclose').click(function(){
			var currtab_title = $('#mm').data("currtab");
			$('#tabs').tabs('close',currtab_title);
		})
		//全部关闭
		$('#mm-tabcloseall').click(function(){
			$('.tabs-inner span').each(function(i,n){
				var t = $(n).text();
				$('#tabs').tabs('close',t);
			});	
		});
		//关闭除当前之外的TAB
		$('#mm-tabcloseother').click(function(){
			var currtab_title = $('#mm').data("currtab");
			$('.tabs-inner span').each(function(i,n){
				var t = $(n).text();
				if(t!=currtab_title)
					$('#tabs').tabs('close',t);
			});	
		});
		//关闭当前右侧的TAB
		$('#mm-tabcloseright').click(function(){
			var nextall = $('.tabs-selected').nextAll();
			if(nextall.length==0){
				//msgShow('系统提示','后边没有啦~~','error');
				alert('后边没有啦~~');
				return false;
			}
			nextall.each(function(i,n){
				var t=$('a:eq(0) span',$(n)).text();
				$('#tabs').tabs('close',t);
			});
			return false;
		});
		//关闭当前左侧的TAB
		$('#mm-tabcloseleft').click(function(){
			var prevall = $('.tabs-selected').prevAll();
			if(prevall.length==0){
				alert('到头了，前边没有啦~~');
				return false;
			}
			prevall.each(function(i,n){
				var t=$('a:eq(0) span',$(n)).text();
				$('#tabs').tabs('close',t);
			});
			return false;
		});

	}
	
	// 修改密码提交
	function updatePassword(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				var oldPassword=$("#oldPassword").val();
				var newPassword=$("#newPassword").val();
				var newPassword2=$("#newPassword2").val();
				if(!$(this).form("validate")){  //先进行easyui验证
					return false;
				}
				if(newPassword!=newPassword2){
					$.messager.alert('系统提示','确认密码输入错误！');
					return false;
				}
				if(oldPassword!='${currentUser.password}'){
					$.messager.alert('系统提示','原密码错误！');
					return false;
				}
				
				return true;
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.errorMsg){
					$.messager.alert('系统提示',result.errorMsg);
					return;
				}else{
					$.messager.alert('系统提示','密码修改成功，下一次登录生效！');
					closePasswordUpdateDialog();
				}
			}
		});
	}
	
	function closePasswordUpdateDialog(){
		$("#dlg").dialog("close");
		$("#oldPassword").val("");
		$("#newPassword").val("");
		$("#newPassword2").val("");
	}
</script>
  </head>
 
<body class="easyui-layout">
<div region="north" style="height: 76px;">
<div style="padding: 0px;margin: 0px;background-color: #E0ECFF;">
<table>
	<tr>
		<td><img src="${path }/images/mainlogo.png"/></td>
		<td valign="bottom">欢迎：${currentUser.userName }&nbsp;『${currentUser.roleName }』</td>
	</tr>
</table>
</div>
</div>

<div region="center">
	<div class="easyui-tabs" fit="true" border="false" id="tabs" >
		<div title="首页" data-options="iconCls:'icon-home'">
			<div align="center" style="padding-top: 100px;"><font color="red" size="10">欢迎使用</font></div>
		</div>
	</div>
</div>



<div region="west" style="width: 160px;padding: 5px;" title="导航菜单" split="true">
<ul id="tree" class="easyui-tree"></ul>
</div>


<div region="south" style="height: 25px;padding: 5px;" align="center">
	图书馆座位分配系统
</div>

<div id="dlg" class="easyui-dialog" style="width: 400px;height: 220px;padding: 10px 20px" 
 closed="true" buttons="#dlg-buttons" data-options="iconCls:'icon-modifyPassword'">
 <form id="fm" method="post">
 <input type="hidden" name="userId" id="userId" value="${currentUser.userId }">
 	<table cellspacing="4px;" style="text-align:right">
 		<tr>
 			<td>用户名：</td>
 			<td><input type="text" name="userName" id="userName" readonly="readonly" value="${currentUser.userName }" style="width: 200px;" /></td>
 		</tr>
 		<tr>
 			<td>原密码：</td>
 			<td><input type="password" class="easyui-validatebox" name="oldPassword" id="oldPassword" style="width: 200px;" required="true" /></td>
 		</tr>
 		<tr>
 			<td>新密码：</td>
 			<td><input type="password" class="easyui-validatebox" name="newPassword" id="newPassword" style="width: 200px;" required="true"  /></td>
 		</tr>
 		<tr>
 			<td>确认新密码：</td>
 			<td><input type="password" class="easyui-validatebox" name="newPassword2" id="newPassword2" style="width: 200px;" required="true" /></td>
 		</tr>
 	</table>
 </form>
</div>
<div id="dlg-buttons" style="text-align:center">
	<a href="javascript:updatePassword()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
	<a href="javascript:closePasswordUpdateDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>


<!-- 右键菜单 -->
<div id="mm" class="easyui-menu" style="width:150px;">
		<div id="mm-tabrefresh">刷新</div>
		<div class="menu-sep"></div>
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseall">全部关闭</div>
		<div id="mm-tabcloseother">除此之外全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-tabcloseright">当前页右侧全部关闭</div>
		<div id="mm-tabcloseleft">当前页左侧全部关闭</div>
</div>
	
			
		

</body>
</html>
