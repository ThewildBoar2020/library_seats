package dingzhen.controller;

// 具体的帖子内容
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
import dingzhen.util.StringUtil;
import dingzhen.util.WriterUtil;

@Controller
@RequestMapping("topic")
public class TopicController {

	private int page;
	private int rows;
	private Topic topic;
	@Autowired
	private TopicService<Topic> topicService;
	@Autowired
	private BbsService<Bbs> bbsService;
	
	
	
	@RequestMapping("topicList")
	public void topicList(HttpServletRequest request,HttpServletResponse response){
		try {
			page = Integer.parseInt(request.getParameter("page"));
			rows = Integer.parseInt(request.getParameter("rows"));
			topic = new Topic();
			topic.setPage((page-1)*rows);
			topic.setRows(rows);
			String bbsid = request.getParameter("bbsid");
			if(StringUtil.isNotEmpty(bbsid)){
				topic.setBbsid(Integer.parseInt(bbsid));
			}
			List<Topic> list = topicService.findTopic(topic);
			int total = topicService.countTopic(topic);
			JSONObject jsonObj = new JSONObject();//new一个JSON
			jsonObj.put("total",total );//total代表一共有多少数据
			jsonObj.put("rows", list);//row是代表显示的页的数据
	        WriterUtil.write(response,jsonObj.toString()); //将上述Json输出，前台ajax接收
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	@RequestMapping("updateTopiccontent")
	public void updateTopiccontent(HttpServletResponse response,HttpServletRequest request,Topic topic){
		JSONObject result = new JSONObject();
		String id = request.getParameter("id");
		try {
			topic.setId(Integer.parseInt(id));
			topicService.updateTopiccontent(topic);
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("errorMsg", "对不起！修改标题失败");
		}
		WriterUtil.write(response, result.toString());
	}
	
	
	
	@RequestMapping("deleteTopic")
	public void deleteBbs(HttpServletRequest request,HttpServletResponse response){
		JSONObject result=new JSONObject();
		try {
			String[] ids=request.getParameter("ids").split(",");
			for (String id : ids) {
				topicService.deleteTopic(Integer.parseInt(id));
			}
			result.put("success", true);
			result.put("delNums", ids.length);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("errorMsg", "对不起，删除失败");
		}
		WriterUtil.write(response, result.toString());
	}
	
	
	@RequestMapping("detail")
	public String detail(HttpServletRequest request){
		try {
			Integer bbsid = Integer.parseInt(request.getParameter("bbsid"));
			String title = bbsService.findOneBbs(bbsid).getTitle();
			Topic t = new Topic();
			t.setBbsid(bbsid);
			List<Topic> topicList = topicService.findTopic(t);
			request.setAttribute("bbsid", bbsid);
			request.setAttribute("title", title);
			request.setAttribute("topicList", topicList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bbs/bbsDetail";
	}
	
	
	
	@RequestMapping("addTopic")
	public String addTopic(HttpServletRequest request,HttpServletResponse response){
		Integer bbsid = Integer.parseInt(request.getParameter("bbsid"));
		try {
			String content = request.getParameter("content");
			User currentUser = (User)request.getSession().getAttribute("currentUser");
			String author = currentUser.getUserName();
			String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
			
			// 插入topic表
			topic = new Topic();
			topic.setAuthor(author);
			topic.setBbsid(bbsid);
			topic.setContent(content);
			topic.setTime(time);
			topicService.addTopic(topic);
			
			// 更新bbs表的最后发表人
			Bbs bbs = new Bbs();
			bbs.setId(bbsid);
			bbs.setLastreply(author);
			bbs.setLastreplytime(time);
			bbsService.updateBbslast(bbs);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:detail.htm?bbsid="+bbsid;
	}
	
}
