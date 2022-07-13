package dingzhen.controller;

// 教师信息
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import sun.misc.Perf.GetPerfAction;

import dingzhen.entity.Teacher;
import dingzhen.entity.User;
import dingzhen.service.TeacherService;
import dingzhen.service.UserService;
import dingzhen.util.StringUtil;
import dingzhen.util.WriterUtil;

@Controller
@RequestMapping("teacher")
public class TeacherController {
	
	private int page;
	private int rows;
	private Teacher teacher;
	@Autowired
	private TeacherService<Teacher> teacherService;
	private User user;
	@Autowired
	private UserService<User> userService;
	
	@RequestMapping("teacherIndex")
	public String index(){
		return "info/teacher";
	}
	
	
	@RequestMapping("teacherList")
	public void teacherList(HttpServletRequest request,HttpServletResponse response){
		try {
			page = Integer.parseInt(request.getParameter("page"));   //获取当前页
			rows = Integer.parseInt(request.getParameter("rows"));   //每页记录条数
			
			// 构造查询条件
			teacher = new Teacher();
			teacher.setPage((page-1)*rows);
			teacher.setRows(rows);
			teacher.setName(request.getParameter("name"));
			teacher.setNo(request.getParameter("no"));
			
			User currentUser = (User)request.getSession().getAttribute("currentUser");
			
			
			if(currentUser.getRoleId()==2){ //教师
				teacher.setNo(currentUser.getUserName());
			}
			
			// 调用service层的查询方法查出记录和数量
			List<Teacher> list = teacherService.findTeacher(teacher);  
			int total = teacherService.countTeacher(teacher);
			
			JSONObject jsonObj = new JSONObject();//new一个JSON
			jsonObj.put("total",total );//total代表一共有多少数据
			jsonObj.put("rows", list);//row是代表显示的页的数据
	        WriterUtil.write(response,jsonObj.toString()); //将上述Json输出，前台ajax接收
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	@RequestMapping("reserveTeacher")
	public void reserve(HttpServletRequest request,HttpServletResponse response,Teacher teacher) {
		JSONObject result = new JSONObject();    // new一个json对象
		result.put("success", true);
		String id = request.getParameter("id");
		try {
			if(StringUtil.isNotEmpty(id)){ //不为空，说明是修改操作
				teacher.setId(Integer.parseInt(id));
				teacherService.updateTeacher(teacher);  //调用service的修改方法
			} else {  //添加操作
				teacherService.addTeacher(teacher);
				//自动注册
				// 同时自动注册user表
				user = new User();
				user.setRoleId(2);             //角色为2表示教师
				user.setPassword("123456");    //密码
				user.setUserName(teacher.getNo()); //用户名
				userService.addUser(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.put("errorMsg", "对不起，操作失败");
		}
		WriterUtil.write(response, result.toString());
	}
	
	
	
	@RequestMapping("deleteTeacher")
	public void deleteTeacher(HttpServletRequest request,HttpServletResponse response){
		JSONObject result=new JSONObject();
		try {
			String[] ids=request.getParameter("ids").split(",");
			for (String id : ids) {
				teacherService.deleteTeacher(Integer.parseInt(id));
			}
			result.put("success", true);
			result.put("delNums", ids.length);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("errorMsg", "对不起，删除失败");
		}
		WriterUtil.write(response, result.toString());
	}
	

	@RequestMapping("comboList")
	public void comboList(HttpServletRequest request,HttpServletResponse response){
		try {
			List<Teacher> list = teacherService.findTeacher(new Teacher());
			JSONArray array = new JSONArray();
			array.addAll(list);
			WriterUtil.write(response, array.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
