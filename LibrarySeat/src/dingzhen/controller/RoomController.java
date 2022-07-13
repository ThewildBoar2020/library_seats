package dingzhen.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dingzhen.entity.Room;
import dingzhen.service.RoomService;
import dingzhen.util.StringUtil;
import dingzhen.util.WriterUtil;
// 阅览室基本信息

@RequestMapping("room")
@Controller
public class RoomController {

	private int page;
	private int rows;
	private Room room;
	@Autowired
	private RoomService<Room> roomService;
	
	
	@RequestMapping("roomIndex")
	public String index(){
		return "readingroom/room";
	}
	
	
	
	@RequestMapping("roomList")
	public void roomList(HttpServletRequest request,HttpServletResponse response) {
		try {
			page = Integer.parseInt(request.getParameter("page"));
			rows = Integer.parseInt(request.getParameter("rows"));
			room = new Room();
			if(request.getParameter("typeid")!=null && request.getParameter("typeid").length() > 0){
				room.setTypeid(Integer.parseInt(request.getParameter("typeid")));
			}
			room.setPage((page-1)*rows);
			room.setRows(rows);
			List<Room> list = roomService.findRoom(room);
			int total = roomService.countRoom(room);
			
			JSONObject jsonObj = new JSONObject();//new一个JSON
			jsonObj.put("total",total );//total代表一共有多少数据
			jsonObj.put("rows", list);//row是代表显示的页的数据
	        WriterUtil.write(response,jsonObj.toString()); //将上述Json输出，前台ajax接收
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	@RequestMapping("reserveRoom")
	public void reserveroom(HttpServletRequest request,HttpServletResponse response,Room room) {
		String id = request.getParameter("id");
		room.setTotal(room.getCol() * room.getRow());  //总座位数=列数     X 行数
		JSONObject result = new JSONObject();
		result.put("success", true);
		try {
			if(StringUtil.isNotEmpty(id)){
				room.setId(Integer.parseInt(id));
				roomService.updateRoom(room);
			} else {
				roomService.addRoom(room);
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.put("errorMsg", "对不起！保存失败");
		}
		WriterUtil.write(response,result.toString());
	}
	
	
	
	
	@RequestMapping("deleteRoom")
	public void delete(HttpServletRequest request,HttpServletResponse response){
		JSONObject result=new JSONObject();
		try {
			String[] ids=request.getParameter("ids").split(",");
			for (String id : ids) {
				roomService.deleteRoom(Integer.parseInt(id));
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
