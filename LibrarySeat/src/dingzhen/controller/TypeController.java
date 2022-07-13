package dingzhen.controller;

//阅览室类型
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dingzhen.entity.Type;
import dingzhen.service.TypeService;
import dingzhen.util.StringUtil;
import dingzhen.util.WriterUtil;

@Controller
@RequestMapping("type")
public class TypeController {

	private int page;
	private int rows;
	private Type type;
	@Autowired
	private TypeService<Type> typeService;

	@RequestMapping("typeIndex")
	public String index() {
		return "readingroom/type";
	}

	@RequestMapping("typeList")
	public void typeList(HttpServletRequest request,HttpServletResponse response) {
		try {
			page = Integer.parseInt(request.getParameter("page")); // 获取当前页
			rows = Integer.parseInt(request.getParameter("rows")); // 每页记录条数

			// 构造查询条件
			type = new Type();
			type.setPage((page - 1) * rows);
			type.setRows(rows);

			// 调用service层的查询方法查出记录和数量
			List<Type> list = typeService.findType(type);
			int total = typeService.countType(type);

			JSONObject jsonObj = new JSONObject();// new一个JSON
			jsonObj.put("total", total);// total代表一共有多少数据
			jsonObj.put("rows", list);// row是代表显示的页的数据
			WriterUtil.write(response, jsonObj.toString()); // 将上述Json输出，前台ajax接收
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("reserveType")
	public void reserve(HttpServletRequest request,HttpServletResponse response, Type type) {
		JSONObject result = new JSONObject(); // new一个json对象
		result.put("success", true);
		String id = request.getParameter("id");
		try {
			if (StringUtil.isNotEmpty(id)) { // 不为空，说明是修改操作
				type.setId(Integer.parseInt(id));
				typeService.updateType(type); // 调用service的修改方法
			} else { // 添加操作
				typeService.addType(type);
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.put("errorMsg", "对不起，操作失败");
		}
		WriterUtil.write(response, result.toString());
	}

	@RequestMapping("deleteType")
	public void deleteType(HttpServletRequest request,HttpServletResponse response) {
		JSONObject result = new JSONObject();
		try {
			String[] ids = request.getParameter("ids").split(",");
			for (String id : ids) {
				typeService.deleteType(Integer.parseInt(id));
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
	public void comboList(HttpServletRequest request,HttpServletResponse response) {
		try {
			List<Type> list = typeService.findType(new Type());
			JSONArray array = new JSONArray();
			array.addAll(list);
			WriterUtil.write(response, array.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
