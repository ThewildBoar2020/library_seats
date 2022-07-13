package dingzhen.controller;
/*
 * 交流控制器
 */
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dingzhen.entity.Bbs;
import dingzhen.entity.Topic;
import dingzhen.entity.User;
import dingzhen.service.BbsService;
import dingzhen.service.TopicService;
import dingzhen.util.WriterUtil;

@Controller
@RequestMapping("bbs")
public class BbsController {

	private int page;
	private int rows;
	@Autowired
	private BbsService<Bbs> bbsService;
	private Bbs bbs;
	@Autowired
	private TopicService<Topic> topicService;
	private Topic topic;
	
	@RequestMapping("bbsIndex")
	public String index(HttpServletRequest request) {
		User currentUser = (User)request.getSession().getAttribute("currentUser");
		if(currentUser.getRoleId()==1){
			return "bbs/bbsIndexForAdmin";
		} else {
			return "bbs/bbsIndex";
		}
	}
	
	
	@RequestMapping("bbsList")
	public void bbsList(HttpServletRequest request,HttpServletResponse response){
		try {
			page = Integer.parseInt(request.getParameter("page"));
			rows = Integer.parseInt(request.getParameter("rows"));
			bbs = new Bbs();
			bbs.setPage((page-1)*rows);
			bbs.setRows(rows);
			bbs.setAuthor(request.getParameter("author"));
			bbs.setTitle(request.getParameter("title"));
			List<Bbs> list = bbsService.findBbs(bbs);
			int total = bbsService.countBbs(bbs);
			JSONObject jsonObj = new JSONObject();//new一个JSON
			jsonObj.put("total",total );//total代表一共有多少数据
			jsonObj.put("rows", list);//row是代表显示的页的数据
	        WriterUtil.write(response,jsonObj.toString()); //将上述Json输出，前台ajax接收
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 发表新帖
	@RequestMapping("newBbs")
	public void newTopic(HttpServletRequest request,HttpServletResponse response,Bbs bbs){
		JSONObject result = new JSONObject();
		String content = bbs.getContent();
		User currentUser = (User)request.getSession().getAttribute("currentUser");
		String author = currentUser.getUserName();
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		try {
			bbs.setAuthor(author);
			bbs.setTime(time);
			bbsService.addBbs(bbs);
			
			int bbsid = bbs.getId();
			topic = new Topic();
			topic.setAuthor(author);
			topic.setBbsid(bbsid);
			topic.setContent(content);
			topic.setTime(time);
			topicService.addTopic(topic);
			
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("errorMsg", "对不起！发表新帖失败");
		}
		WriterUtil.write(response, result.toString());
	}
	
	
	// 修改标题
	@RequestMapping("updateBbstitle")
	public void updateBbstitle(HttpServletResponse response,HttpServletRequest request,Bbs bbs){
		JSONObject result = new JSONObject();
		String id = request.getParameter("id");
		try {
			bbs.setId(Integer.parseInt(id));
			bbsService.updateBbstitle(bbs);
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("errorMsg", "对不起！修改标题失败");
		}
		WriterUtil.write(response, result.toString());
	}
	
	
	

	@RequestMapping("deleteBbs")
	public void deleteBbs(HttpServletRequest request,HttpServletResponse response){
		JSONObject result=new JSONObject();
		try {
			String[] ids=request.getParameter("ids").split(",");
			for (String id : ids) {
				bbsService.deleteBbs(Integer.parseInt(id));
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
