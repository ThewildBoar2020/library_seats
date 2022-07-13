package dingzhen.controller;

// 统计图
import java.awt.Color;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.SimpleFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.labels.ItemLabelAnchor;
import org.jfree.chart.labels.ItemLabelPosition;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer3D;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.general.DatasetUtilities;
import org.jfree.ui.TextAnchor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dingzhen.entity.Choice;
import dingzhen.entity.Illegal;
import dingzhen.entity.Room;
import dingzhen.entity.Seat;
import dingzhen.service.ChoiceService;
import dingzhen.service.IllegalService;
import dingzhen.service.RoomService;
import dingzhen.service.SeatService;

@RequestMapping("chart")
@Controller
public class ChartController {

	@Autowired
	private IllegalService<Illegal> illegalService;
	private Illegal illegal;
	private Room room;
	@Autowired
	private RoomService<Room> roomService;
	private Seat seat;
	@Autowired
	private SeatService<Seat> seatService;
	@Autowired
	private ChoiceService<Choice> choiceService;
	
	
	// 进入违规统计
	@RequestMapping("illegalChart")
	public String illegalIndex(){
		return "chart/illegal";
	}
	
	// 违规统计表
	@RequestMapping("findIllegalChart")
	public void findIllegalChart(HttpServletRequest request,HttpServletResponse response){
		try {
			double[][] data = new double[1][12];  //一年12月
			String[] months = {"1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"};
			for(int i=1;i<13;i++){
				// 每月违规人数
				String start = getCurrentYear();
				String end = getCurrentYear();
				if(i<10){
					start = start + "-0" + i +"-01 00:00:01";
					end = end + "-0" + i + "-31 23:59:59";
				} else {
					start = start + "-" + i +"-01 00:00:01";
					end = end + "-" + i + "-31 23:59:59";
				}
				illegal = new Illegal();
				illegal.setStart(start);
				illegal.setEnd(end);
				int total = illegalService.countIllegal(illegal);
				data[0][i-1] = total;
			}
			bar(request, response, months, new String[]{"违规人数"}, data,getCurrentYear()+"全年度违规人数统计", "违规人数统计", 750);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	// 进入占座统计
	@RequestMapping("seatChart")
	public String seatIndex(){
		return "chart/seat";
	}
	
	
	@RequestMapping("findSeatChart")
	public void findSeatChart(HttpServletRequest request,HttpServletResponse response){
		try {
			
			List<Room> roomList = roomService.findRoom(new Room());
			double[][] data = new double[roomList.size()][12];  //一年12月
			String[] months = {"1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"};
			for(int i=0;i<roomList.size();i++){
				room = roomList.get(i);
				
				for(int j=1;j<13;j++){
					// 每月违规人数
					String start = getCurrentYear();
					String end = getCurrentYear();
					if(j<10){
						start = start + "-0" + j +"-01 00:00:01";
						end = end + "-0" + j + "-31 23:59:59";
					} else {
						start = start + "-" + j +"-01 00:00:01";
						end = end + "-" + j + "-31 23:59:59";
					}
					Choice c = new Choice();
					c.setStart(start);
					c.setEnd(end);
					c.setRows(room.getId());
					int total = choiceService.count(c);
					data[i][j-1] = total;
				}
				
			}
			String[] rooms = new String[roomList.size()];
			for(int i=0;i<rooms.length;i++){
				rooms[i] = roomList.get(i).getName();
			}
			bar(request, response, months, rooms, data,getCurrentYear()+"全年度占座人数统计", "占座人数", 750);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	

	/**
	 * 生成柱状图并写到页面上去
	 * @param request
	 * @param response
	 * @param times
	 * @param floors
	 * @param data
	 * @param subTitle
	 * @param width
	 */
	private void bar(HttpServletRequest request, HttpServletResponse response,
			String[] times, String[] floors, double[][] data, String title,String subTitle,int width) {
		CategoryDataset dataset = DatasetUtilities.createCategoryDataset(floors,times,data);
		JFreeChart chart = ChartFactory.createBarChart3D(title, "时间", "人数",
				dataset, PlotOrientation.VERTICAL, true, true, true);           // 创建柱状图模型
		// 副标题
		chart.addSubtitle(new TextTitle(subTitle));
		CategoryPlot plot = chart.getCategoryPlot();
		// 设置网格背景颜色
		plot.setBackgroundPaint(Color.white);
		// 设置网格竖线颜色
		plot.setDomainGridlinePaint(Color.pink);
		// 设置网格横线颜色
		plot.setRangeGridlinePaint(Color.pink);

		// 显示每个柱的数值，并修改该数值的字体属性
		BarRenderer3D renderer = new BarRenderer3D();
		renderer.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());
		renderer.setBaseItemLabelsVisible(true);

		renderer.setBasePositiveItemLabelPosition(new ItemLabelPosition(
				ItemLabelAnchor.OUTSIDE12, TextAnchor.BASELINE_LEFT));
		renderer.setItemLabelAnchorOffset(10D);

		// 设置平行柱的之间距离
		renderer.setItemMargin(0.4);

		plot.setRenderer(renderer);
		// 将图表以数据流的方式返回给客户端
		try {
			ChartUtilities.writeChartAsPNG(response.getOutputStream(), chart,
					width, 350); // 500,300是长和宽
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private String getCurrentYear(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		return sdf.format(new Date());
	}
}
