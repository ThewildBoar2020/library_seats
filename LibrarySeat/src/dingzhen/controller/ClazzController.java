package dingzhen.controller;

// 班级管理控制器
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dingzhen.entity.Clazz;
import dingzhen.service.ClazzService;
import dingzhen.util.StringUtil;
import dingzhen.util.WriterUtil;

@Controller
@RequestMapping("clazz")
public class ClazzController {

	private int page;
	private int rows;
	@Autowired
	private ClazzService<Clazz> clazzService;
	private Clazz clazz;
	
	@RequestMapping("clazzIndex")
	public String index(){
		return "info/clazz";
	}
	
	
	
	@RequestMapping("clazzList")
	public void list(HttpServletRequest request ,HttpServletResponse response) {
		try {
			page = Integer.parseInt(request.getParameter("page"));
			rows = Integer.parseInt(request.getParameter("rows"));
			
			clazz = new Clazz();
			clazz.setPage((page-1)*rows);
			clazz.setRows(rows);
			List<Clazz> list = clazzService.findClazz(clazz);
			int total = clazzService.countClazz(clazz);
			
			JSONObject jsonObj = new JSONObject();//new一个JSON
			jsonObj.put("total",total );//total代表一共有多少数据
			jsonObj.put("rows", list);//row是代表显示的页的数据
	        WriterUtil.write(response,jsonObj.toString()); //将上述Json输出，前台ajax接收
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	@RequestMapping("reserveClazz")
	public void reserveClazz(HttpServletRequest request,HttpServletResponse response,Clazz clazz) {
		JSONObject result = new JSONObject();
		result.put("success", true);
		String id = request.getParameter("id");
		try {
			if(StringUtil.isNotEmpty(id)){
				clazz.setId(Integer.parseInt(id));
				clazzService.updateClazz(clazz);
			} else {
				clazzService.addClazz(clazz);
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.put("errorMsg", "对不起！保存失败");
		}
		WriterUtil.write(response, result.toString());
	}
	
	
	
	
	@RequestMapping("deleteClazz")
	public void deleteClazz(HttpServletRequest request,HttpServletResponse response){
		JSONObject result=new JSONObject();
		try {
			String[] ids=request.getParameter("ids").split(",");
			for (String id : ids) {
				clazzService.deleteClazz(Integer.parseInt(id));
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
			List<Clazz> list = clazzService.findClazz(new Clazz());
			JSONArray array = new JSONArray();
			array.addAll(list);
			WriterUtil.write(response, array.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
