package dingzhen.controller;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dingzhen.entity.Log;
import dingzhen.entity.User;
import dingzhen.service.LogService;
import dingzhen.util.StringUtil;
import dingzhen.util.TimeUtil;
import dingzhen.util.WriterUtil;

/**
 * 日志管理控制器
 */
@Controller
@RequestMapping("log")
public class LogController {
	
	private Log log;
	private int page = 1;
	private int rows = 10;
	@Autowired
	private LogService<Log> logService;
	
	@RequestMapping("logIndex")
	public String index(){
		return "sys/log";
	}
	
	
	@RequestMapping("logList")
	public void logList(HttpServletRequest request,HttpServletResponse response){
		try {
			page = Integer.parseInt(request.getParameter("page"));
			rows = Integer.parseInt(request.getParameter("rows"));
			log = new Log();
			log.setModule(request.getParameter("module"));
			log.setEnd(request.getParameter("end"));
			log.setOperation(request.getParameter("operation"));
			log.setPage((page-1)*rows);
			log.setRows(rows);
			log.setStart(request.getParameter("start"));
			log.setUserName(request.getParameter("userName"));
			List<Log> list = logService.findLog(log);
			int total = logService.countLog(log);
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("total",total );
			jsonObj.put("rows", list);
	        WriterUtil.write(response,jsonObj.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	/**
	 * 记录日志
	 * @param operation
	 * @param module
	 * @param request
	 * @param o
	 */
	public void addLog(String operation,String module,HttpServletRequest request,Object o){
		try {
			log = new Log();
			log.setContent(getFieldsInfo(o));
			log.setOperation(operation);
			log.setIp(getIpAddr(request));
			log.setCreateTime(TimeUtil.formatTime(new Date(), "yyyy-MM-dd HH:mm:ss"));
			User currentUser = (User)request.getSession().getAttribute("currentUser");
			log.setUserName(currentUser.getUserName());
			log.setModule(module);
			logService.insertLog(log);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	

	/**
	 * 获取访问者IP
	 * 
	 * 在一般情况下使用Request.getRemoteAddr()即可，但是经过nginx等反向代理软件后，这个方法会失效。
	 * 
	 * 本方法先从Header中获取X-Real-IP，如果不存在再从X-Forwarded-For获得第一个IP(用,分割)，
	 * 如果还不存在则调用Request .getRemoteAddr()。
	 * 
	 * @param request
	 * @return
	 */
	public static String getIpAddr(HttpServletRequest request) throws Exception{
		String ip = request.getHeader("X-Real-IP");
		if (!StringUtil.isEmpty(ip) && !"unknown".equalsIgnoreCase(ip)) {
			return ip;
		}
		ip = request.getHeader("X-Forwarded-For");
		if (!StringUtil.isEmpty(ip) && !"unknown".equalsIgnoreCase(ip)) {
			// 多次反向代理后会有多个IP值，第一个为真实IP。
			int index = ip.indexOf(',');
			if (index != -1) {
				return ip.substring(0, index);
			} else {
				return ip;
			}
		} else {
			return request.getRemoteAddr();
		}
	}
	
	
	
	/**
	 * 通过反射
	 * 根据字段名称获取字段值
	 * @param fieldName
	 * @param o
	 * @return
	 */
	private static Object getFieldValueByName(String fieldName,Object o){
		try {
			String firstLetter = fieldName.substring(0, 1).toUpperCase();   //手写字母大写
			String getter = "get" + firstLetter + fieldName.substring(1);   // get方法
			Method method = o.getClass().getMethod(getter,new Class[]{});
			Object object = method.invoke(o, new Object[]{});
			return object;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	/**
	 * 反射获得字段值
	 * @param o
	 * @return
	 */
	@SuppressWarnings("unused")
	private static String[] getFieldName(Object o){
		Field[] fields = o.getClass().getDeclaredFields();
		String[] fieldNames = new String[fields.length];
		for (int i = 0; i < fieldNames.length; i++) {
			fieldNames[i] = fields[i].getName();
		}
		return fieldNames;
	}
	
	
	/**
	 * 反射获得对象信息
	 * @param o
	 * @return
	 */
	public static String getFieldsInfo(Object o){
		Field[] fields = o.getClass().getDeclaredFields();
		//String[] fieldNames = new String[fields.length];
		StringBuffer sb = new StringBuffer("属性名和值:");
		/**
		 * 遍历所有字段
		 * 从下标1开始
		 * 把0位置的serialVersionUID过滤掉
		 * 所以要求实体类的第一个属性都是serial*UID
		 */
		for (int i = 1; i < fields.length; i++) {    
			sb.append(fields[i].getName()+ "-->"+getFieldValueByName(fields[i].getName(), o)+"  ");
			/**infoMap = new HashMap();
			infoMap.put("type",fields[i].getType().toString());
			infoMap.put("name",fields[i].getName());
			infoMap.put("value", getFieldValueByName(fields[i].getName(), o));
			list.add(infoMap);*/
		}
		return sb.toString();
	}
	
	
}