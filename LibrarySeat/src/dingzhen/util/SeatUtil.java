package dingzhen.util;

// 两个定时器
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dingzhen.entity.Choice;
import dingzhen.entity.Room;
import dingzhen.entity.Seat;
import dingzhen.service.ChoiceService;
import dingzhen.service.RoomService;
import dingzhen.service.SeatService;

@Component
@Controller
public class SeatUtil {
	@Autowired
	private SeatService<Seat> seatService;
	@Autowired
	private RoomService<Room> roomService;
	@Autowired
	private ChoiceService<Choice> choiceService;
	
	//每天晚上11点生成后天的所有座位信息
	
	@Scheduled(cron = "0 0 23 * * ?")  //每天晚上23点运行一次  生成所有新的座位
	public void generateNextDay(){
		addNewSeat(1);
	}
	
	
	public void addNewSeat(int offset){
		try {
			String times[] = {"08点-12点","14点-18点","18点-22点"};   //三个时间段
			Date today = new Date();  //今天日期Date类型
			Date dayAfterTomorrow = getNextNextDay(today,offset); //后面的参数表示与今天的间隔，如1表示明天，2表示后天
			String date = new SimpleDateFormat("yyyy-MM-dd").format(dayAfterTomorrow);  //后天日期yyy-MM-dd string类型
			List<Room> roomList = roomService.findRoom(new Room());
			for(int i=0;i<times.length;i++){               // 三个时间段
				String time = times[i];
				for(int j=0;j<roomList.size();j++){         //所有的房间
					Room room = roomList.get(j);
					int roomid = room.getId();
					int row = room.getRow();                 
					int col = room.getCol();
					for(int k=1;k<=row;k++){                 //行
						for(int l=1;l<=col;l++){             //列
							Seat seat = new Seat();
							seat.setCol(l);
							seat.setDate(date);
							seat.setRoomid(roomid);
							seat.setRow(k);
							seat.setTime(time);
							seat.setKeyword(date + "-" + time + "-" + roomid + "-" + k + "-" + l);
							seatService.insertSeat(seat);
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	// 在浏览器输入http://127.0.0.1:8080/LibrarySeats/newSeat.htm即可手动生成座位数
	@RequestMapping("newSeat")
	@ResponseBody
	public String today(){
		Thread thread = new Thread(new Task());
		thread.start();
		return "开始创建当日座位信息，请不要重复运行，观察控制台运行停止后可以登录后台查看座位信息！";
	}
	
	// 获取后天日期
	public static Date getNextNextDay(Date date,int day) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, day);
		date = calendar.getTime();
		return date;
	}
	
	
	
	
	
	
	// 每天的08，14，18即三个时间段的开始时间 运行一次，将之前的占座取消
	@Scheduled(cron = "0 0 8,14,18 * * ?") 
	public void updateChoice(){
		try {
			String now = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
			Choice choice = new Choice();
			choice.setTime(now);
			choiceService.modifyChoice(choice);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	public class Task implements Runnable{

		@Override
		public void run() {
			// TODO Auto-generated method stub
			addNewSeat(0);
		}
		
	}

	
}
