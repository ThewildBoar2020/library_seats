package dingzhen.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dingzhen.util.StringUtil;

import dingzhen.entity.User;
import dingzhen.service.UserService;
import dingzhen.util.WriterUtil;

/**
 * 用户管理
 */

@Controller
@RequestMapping("user")
public class UserController extends LogController{

	private int page;
	private int rows;
	private User user;
	@Autowired
	private UserService<User> userService;
	
	
	
	@RequestMapping("userIndex")
	public String index(){
		return "sys/user";
	}
	
	
	@RequestMapping("userList")
	public void userList(HttpServletRequest request,HttpServletResponse response){
		try {
			page = Integer.parseInt(request.getParameter("page"));//==null?1:Integer.parseInt(request.getParameter("page"));
			rows = Integer.parseInt(request.getParameter("rows"));//==null?10:Integer.parseInt(request.getParameter("rows"));
			user = new User();
			user.setPage((page-1)*rows);
			user.setRows(rows);
			user.setUserName(request.getParameter("userName"));
			String roleId = request.getParameter("roleId");
			if (StringUtil.isNotEmpty(roleId)) {
				user.setRoleId(Integer.parseInt(roleId));
			} else {
				user.setRoleId(null);
			}
			List<User> list = userService.findUser(user);
			int total = userService.countUser(user);
			JSONObject jsonObj = new JSONObject();//new一个JSON
			jsonObj.put("total",total );//total代表一共有多少数据
			jsonObj.put("rows", list);//row是代表显示的页的数据
	        WriterUtil.write(response,jsonObj.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	// 新增或修改
	@RequestMapping("reserveUser")
	public void reserveUser(HttpServletRequest request,User user,HttpServletResponse response){
		String userId = request.getParameter("userId");
		JSONObject result=new JSONObject();
		try {
			if (StringUtil.isNotEmpty(userId)) {   // userId不为空 说明是修改
				user.setUserId(Integer.parseInt(userId));
				userService.updateUser(user);
				result.put("success", true);
			}else {   // 添加
				if(userService.existUserWithUserName(user.getUserName())==null){  // 没有重复可以添加
					userService.addUser(user);
					result.put("success", true);
				} else {
					result.put("success", true);
					result.put("errorMsg", "该用户名被使用");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", true);
			result.put("errorMsg", "对不起，操作失败");
		}
		WriterUtil.write(response, result.toString());
	}
	
	
	@RequestMapping("deleteUser")
	public void delUser(HttpServletRequest request,HttpServletResponse response){
		JSONObject result=new JSONObject();
		try {
			String[] ids=request.getParameter("ids").split(",");
			for (String id : ids) {
				user = userService.findOneUser(Integer.parseInt(id));
				userService.deleteUser(Integer.parseInt(id));
			}
			result.put("success", true);
			result.put("delNums", ids.length);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("errorMsg", "对不起，删除失败");
		}
		WriterUtil.write(response, result.toString());
	}
}
