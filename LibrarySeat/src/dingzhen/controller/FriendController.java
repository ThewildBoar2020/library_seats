package dingzhen.controller;

//推荐朋友控制器
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dingzhen.entity.Choice;
import dingzhen.entity.Student;
import dingzhen.entity.User;
import dingzhen.service.ChoiceService;
import dingzhen.service.StudentService;
import dingzhen.util.WriterUtil;

@Controller
@RequestMapping("friend")
public class FriendController {

	private Choice choice;
	@Autowired
	private ChoiceService<Choice> choiceService;
	@Autowired
	private StudentService<Student> studentService;
	private Student student;
	
	
	@RequestMapping("friendIndex")
	public String index(){
		return "tuijian/friend";
	}
	
	
	
	@RequestMapping("friendList")
	public void list(HttpServletRequest request,HttpServletResponse response){
		try {
			User currentUser = (User)request.getSession().getAttribute("currentUser");
			String currentStudentno = currentUser.getUserName();   //当前学号
			choice = new Choice();
			choice.setStudentno(currentStudentno);
			List<Choice> currentList = choiceService.findChoice(choice);
			String currentKeyword = "";
			if(currentList != null && currentList.size() >0){
				
				// 设置筛选推荐朋友的匹配条件
				currentKeyword = currentList.get(0).getSeatkeyword();
				currentKeyword = currentKeyword.substring(11, 20);    // 获得08点-12点-1这样的字符串，表示在8-12这个时间段在id=1的阅览室
				Choice c = new Choice();
				c.setSeatkeyword(currentKeyword);     //相同的时间段和自习室  
				c.setStudentno(currentStudentno);        //排除自己
				Date today = new Date(); 
				Date lastDay = getNextDay(today, -20);    //20天之内
				c.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(lastDay));
				c.setPipeishu(3);                           //至少有3次相同时间段相同教室
				List<Choice> friendList = choiceService.findFriend(c);  //查询匹配的朋友
				List<Student> friendStudent = new ArrayList<Student>();
				if(friendList == null || friendList.size()==0){
					//没有匹配到一个相同的朋友
				} else if (friendList.size() > 10) {
					// 超过10取前10位
					for(int i=0;i<10;i++){
						Choice friendChoice = friendList.get(i);         
						String friendStudentno = friendChoice.getStudentno();  //得到学号
						student = studentService.findOneStudentByno(friendStudentno); //通过学号查询学生
						friendStudent.add(student);
					}
				} else {
					// 不超过10条全部取出来
					for(int i=0;i<friendList.size();i++){
						Choice friendChoice = friendList.get(i);
						String friendStudentno = friendChoice.getStudentno();
						student = studentService.findOneStudentByno(friendStudentno);
						friendStudent.add(student);
					}
				}
				JSONArray array = new JSONArray();
				array.addAll(friendStudent);
				WriterUtil.write(response, array.toString());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 获取与今天相隔day天的日期，其中date表示某天，如今天。day正数表示之后，如1表示1天之后即明天。-1表示1天之前即昨天
	public static Date getNextDay(Date date,int day) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, day);
		date = calendar.getTime();
		return date;
	}
	
	
	
	
}
