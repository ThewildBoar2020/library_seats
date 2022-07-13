package dingzhen.controller;

// 查看余坐
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dingzhen.entity.Room;
import dingzhen.entity.Seat;
import dingzhen.service.RoomService;
import dingzhen.service.SeatService;
import dingzhen.util.WriterUtil;

@Controller
@RequestMapping("block")
public class BlockController {
	
	@Autowired
	private RoomService<Room> roomService;
	private Seat seat;
	@Autowired
	private SeatService<Seat> seatService;
	
	
	@RequestMapping("blockList")
	public void list(HttpServletResponse response,HttpServletRequest request) {
		try {
			String[] times = new String[]{"08点-12点","14点-18点","18点-22点"};
			Date today = new Date();
			Date tomorrow = getNextDay(today, 1);
			Date[] dates = new Date[]{today,tomorrow};
			List<Room> rooms = roomService.findRoom(new Room());
			List<Seat> list = new ArrayList<Seat>();
			for(int j=0;j<dates.length;j++){
				Date date = dates[j];
			for(int i=0;i<times.length;i++){
				String time = times[i];
					for(int k=0;k<rooms.size();k++){
						int roomid = rooms.get(k).getId();
						seat = new Seat();
						seat.setRoomid(roomid);
						seat.setDate(new SimpleDateFormat("yyyy-MM-dd").format(date));
						seat.setTime(time);
						seat.setRoomname(rooms.get(k).getName());
						int yuzuo = seatService.findBlock(seat);
						seat.setPage(yuzuo);        //将page字段临时存放余坐
						list.add(seat);
					}
				}
			}
			JSONArray array = new JSONArray();
			array.addAll(list);
			WriterUtil.write(response, array.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	@RequestMapping("blockIndex")
	public String block(){
		return "seat/block";
	}
	
	public static Date getNextDay(Date date,int day) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, day);
		date = calendar.getTime();
		return date;
	}
	
	
}
