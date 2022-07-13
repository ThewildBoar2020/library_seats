package dingzhen.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dingzhen.entity.Notice;
import dingzhen.entity.User;
import dingzhen.service.NoticeService;
import dingzhen.util.StringUtil;
import dingzhen.util.WriterUtil;

// 通知信息

@RequestMapping("notice")
@Controller
public class NoticeController {

	private int page;
	private int rows;
	private Notice notice;
	@Autowired
	private NoticeService<Notice> noticeService;
	
	
	@RequestMapping("noticeIndex")
	public String index(HttpServletRequest request){
		User currentUser = (User)request.getSession().getAttribute("currentUser");
		if(currentUser.getRoleId()==1){
			return "notice/noticeIndexForAdmin";
		} else {
			return "notice/noticeIndex";
		}
	}
	
	
	@RequestMapping("noticeList")
	public void list(HttpServletRequest request,HttpServletResponse response){
		try {
			page = Integer.parseInt(request.getParameter("page"));
			rows = Integer.parseInt(request.getParameter("rows"));
			notice = new Notice();
			notice.setPage((page-1)*rows);
			notice.setRows(rows);
			List<Notice> list = noticeService.findNotice(notice);
			int total = noticeService.countNotice(notice);
			JSONObject jsonObj = new JSONObject();//new一个JSON
			jsonObj.put("total",total );//total代表一共有多少数据
			jsonObj.put("rows", list);//row是代表显示的页的数据
	        WriterUtil.write(response,jsonObj.toString()); //将上述Json输出，前台ajax接收
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	@RequestMapping("reserveNotice")
	public void reserve(HttpServletRequest request,HttpServletResponse response,Notice notice){
		String id = request.getParameter("id");
		JSONObject result = new JSONObject();
		result.put("success", true);
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		notice.setTime(time);
		try {
			if(StringUtil.isNotEmpty(id)){
				notice.setId(Integer.parseInt(id));
				noticeService.updateNotice(notice);
			} else {
				noticeService.addNotice(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.put("errorMsg", "对不起，保存失败");
		}
		WriterUtil.write(response, result.toString());
	}

	
	

	@RequestMapping("deleteNotice")
	public void deleteClazz(HttpServletRequest request,HttpServletResponse response){
		JSONObject result=new JSONObject();
		try {
			String[] ids=request.getParameter("ids").split(",");
			for (String id : ids) {
				noticeService.deleteNotice(Integer.parseInt(id));
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
		String id = request.getParameter("id");
		try {
			notice = noticeService.findOneNotice(Integer.parseInt(id));
			request.setAttribute("notice", notice);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "notice/noticeView";
	}
	
	
	
	
}
