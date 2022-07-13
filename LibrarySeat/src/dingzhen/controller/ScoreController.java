package dingzhen.controller;
//信用积分

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dingzhen.entity.Illegal;
import dingzhen.entity.Room;
import dingzhen.entity.Score;
import dingzhen.entity.User;
import dingzhen.service.IllegalService;
import dingzhen.service.ScoreService;
import dingzhen.util.StringUtil;
import dingzhen.util.WriterUtil;

@RequestMapping("score")
@Controller
public class ScoreController {

	private int page;
	private int rows;
	private Score score;
	@Autowired
	private ScoreService<Score> scoreService;
	@Autowired
	
	@RequestMapping("scoreIndex")
	public String index(){
		return "jifen/score";
	}
	
	
	@RequestMapping("scoreList")
	public void scoreList(HttpServletRequest request,HttpServletResponse response) {
		try {
			page = Integer.parseInt(request.getParameter("page"));
			rows = Integer.parseInt(request.getParameter("rows"));
			score = new Score();
			score.setPage((page-1)*rows);
			score.setRows(rows);
			score.setStudentname(request.getParameter("studentname"));
			score.setStudentno(request.getParameter("studentno"));
			User currentUser = (User)request.getSession().getAttribute("currentUser");
			if(currentUser.getRoleId()==3){        // 角色id为3说明是学生
				score.setStudentno(currentUser.getUserName());
			}
			List<Score> list = scoreService.findScore(score);
			int total = scoreService.countScore(score);
			JSONObject jsonObj = new JSONObject();//new一个JSON
			jsonObj.put("total",total );//total代表一共有多少数据
			jsonObj.put("rows", list);//row是代表显示的页的数据
	        WriterUtil.write(response,jsonObj.toString()); //将上述Json输出，前台ajax接收
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping("reserveScore")
	public void reserveroom(HttpServletRequest request,HttpServletResponse response,Score score) {
		String id = request.getParameter("id");
		JSONObject result = new JSONObject();
		result.put("success", true);
		try {
			if(StringUtil.isNotEmpty(id)){
				score.setId(Integer.parseInt(id));
				scoreService.updateScore(score);
			} else {
				scoreService.addScore(score);
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.put("errorMsg", "对不起！保存失败");
		}
		WriterUtil.write(response,result.toString());
	}
	
	
	
	
	@RequestMapping("deleteScore")
	public void delete(HttpServletRequest request,HttpServletResponse response){
		JSONObject result=new JSONObject();
		try {
			String[] ids=request.getParameter("ids").split(",");
			for (String id : ids) {
				scoreService.deleteScore(Integer.parseInt(id));
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
