package dingzhen.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dingzhen.entity.Menu;
import dingzhen.entity.Operation;
import dingzhen.entity.Role;
import dingzhen.entity.User;
import dingzhen.service.MenuService;
import dingzhen.service.OperationService;
import dingzhen.service.RoleService;
import dingzhen.service.UserService;
import dingzhen.util.StringUtil;
import dingzhen.util.WriterUtil;

/**
 * 角色管理
 */
@Controller
@RequestMapping("role")
@SuppressWarnings("unchecked")
public class RoleController {

	private int page;
	private int rows;
	private Role role;
	private Operation operation;
	@Autowired
	private UserService<User> userService;
	@Autowired
	private RoleService<Role> roleService;
	private Map map;
	private Menu menu;
	@Autowired
	private MenuService<Menu> menuService;
	@Autowired
	private OperationService<Operation> operationService;
	
	
	
	@RequestMapping("roleIndex")
	public String index(){
		return "sys/role";
	}
	
	@RequestMapping("roleList")
	public void userList(HttpServletRequest request,HttpServletResponse response){
		try {
			page = Integer.parseInt(request.getParameter("page"));//==null?1:Integer.parseInt(request.getParameter("page"));
			rows = Integer.parseInt(request.getParameter("rows"));//==null?10:Integer.parseInt(request.getParameter("rows"));
			role = new Role();
			role.setPage((page-1)*rows);
			role.setRows(rows);
			role.setRoleName(request.getParameter("roleName"));
			List<Role> list = findAllRole(role);
			int total = roleService.countRole(role);
			JSONObject jsonObj = new JSONObject();//new一个JSON
			jsonObj.put("total",total );//total代表一共有多少数据
			jsonObj.put("rows", list);//row是代表显示的页的数据
	        WriterUtil.write(response,jsonObj.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	private List<Role> findAllRole(Role role){
		try {
			return roleService.findRole(role);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping("roleCombobox")
	public void roleCombobox(HttpServletRequest request,HttpServletResponse response){
		try {
			JSONArray jsonArray=new JSONArray();
			List<Role> list = findAllRole(new Role());
			jsonArray.addAll(list);
			WriterUtil.write(response, jsonArray.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping("reserveRole")
	public void addUser(HttpServletRequest request,Role role,HttpServletResponse response){
		String roleId = request.getParameter("roleId");
		JSONObject result=new JSONObject();
		try {
			if (StringUtil.isNotEmpty(roleId)) {
				role.setRoleId(Integer.parseInt(roleId));
				roleService.updateRole(role);
				result.put("success", true);
			}else {
				if(roleService.existRoleWithRoleName(role.getRoleName())==null){  // 没有重复可以添加
					roleService.addRole(role);
					result.put("success", true);
				} else {
					result.put("success", true);
					result.put("errorMsg", "该角色名被使用");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", true);
			result.put("errorMsg", "对不起，操作失败");
		}
		WriterUtil.write(response, result.toString());
	}
	
	
	
	@RequestMapping("deleteRole")
	public void delRole(HttpServletRequest request,HttpServletResponse response){
		JSONObject result=new JSONObject();
		try {
			String[] roleIds=request.getParameter("ids").split(",");
			for (int i=0;i<roleIds.length;i++) {
				boolean b = userService.existUserWithRoleId(Integer.parseInt(roleIds[i]))==null; //该角色下面没有用户
				if(!b){
					result.put("errorIndex", i);
					result.put("errorMsg", "有角色下面有用户，不能删除");
					WriterUtil.write(response, result.toString());
					return;
				}
			}
			if (roleIds.length==1) {
				roleService.deleteRole(Integer.parseInt(roleIds[0]));
			} else {
				map = new HashMap();
				map.put("roleIds", roleIds);
				roleService.deleteRoleByRoleIds(map);
			}
			result.put("success", true);
			result.put("delNums", roleIds.length);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("errorMsg", "对不起，删除失败");
		}
		WriterUtil.write(response, result.toString());
	}
	
	
	
	@RequestMapping("chooseMenu")
	public void chooseMenu(HttpServletRequest request,HttpServletResponse response){
		try {
			String parentId=request.getParameter("parentId");
			String roleId=request.getParameter("roleId");
			role = roleService.findOneRole(Integer.parseInt(roleId));
			String menuIds = role.getMenuIds();
			String operationIds = role.getOperationIds();
			JSONArray jsonArray=getCheckedMenusByParentId(parentId, menuIds,operationIds);
			WriterUtil.write(response, jsonArray.toString());
			System.out.println(jsonArray.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	// 选中已有的角色
	public JSONArray getCheckedMenusByParentId(String parentId,String menuIds,String operationIds)throws Exception{
		JSONArray jsonArray=this.getCheckedMenuByParentId(parentId,menuIds,operationIds);
		for(int i=0;i<jsonArray.size();i++){
			JSONObject jsonObject=jsonArray.getJSONObject(i);
			if("open".equals(jsonObject.getString("state"))){
				continue;
			}else{
				jsonObject.put("children", getCheckedMenusByParentId(jsonObject.getString("id"),menuIds,operationIds));
			}
		}
		return jsonArray;
	}
	
	public JSONArray getCheckedMenuByParentId(String parentId,String menuIds,String operationIds)throws Exception{
		JSONArray jsonArray=new JSONArray();
		menu = new Menu();
		menu.setParentId(Integer.parseInt(parentId));
		List<Menu> list = menuService.findMenu(menu);
		for(Menu menu : list){
			JSONObject jsonObject = new JSONObject();
			int menuId = menu.getMenuId();
			jsonObject.put("id", menuId);
			jsonObject.put("text", menu.getMenuName());
			jsonObject.put("iconCls", menu.getIconCls());
			jsonObject.put("state", menu.getState());
			if (StringUtil.isNotEmpty(menuIds)) {
				if (dingzhen.util.StringUtil.existStrArr(menuId+"", menuIds.split(","))) {
					jsonObject.put("checked", true);
				} 	
			}
			jsonObject.put("children", getOperationJsonArray(menuId,operationIds));
			jsonArray.add(jsonObject);
		}
		return jsonArray;
	}
	
	
	public JSONArray getOperationJsonArray(int menuId,String operationIds){
		JSONArray jsonArray=new JSONArray();
		try {
			operation = new Operation();
			operation.setMenuId(menuId);
			List<Operation> list = operationService.findOperation(operation);
			for(Operation operation : list){
				JSONObject jsonObject = new JSONObject();
				int operationId = operation.getOperationId();
				jsonObject.put("id", operationId);
				jsonObject.put("text", operation.getOperationName());
				jsonObject.put("iconCls", "");
				jsonObject.put("state", "open");
				if (StringUtil.isNotEmpty(operationIds)) {
					if (dingzhen.util.StringUtil.existStrArr(operationId+"", operationIds.split(","))) {
						jsonObject.put("checked", true);
					} 	
				}
				jsonArray.add(jsonObject);
			}
			return jsonArray;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	
	
	
	@RequestMapping("updateRoleMenu")
	public void updateRoleMenu(HttpServletRequest request,HttpServletResponse response){
		JSONObject result = new JSONObject();
		try {
			String roleId = request.getParameter("roleId");
			String[] ids = request.getParameter("menuIds").split(",");
			String menuIds = "";
			String operationIds = "";
			/**
			 * 采用的方案是在菜单递归之后，再加上各菜单下的按钮
			 * 采用easyui的解析方式所以字段都用的是id和text。
			 * 为了区别两者，我们规定operationId自增从10000开始
			 * menuId从1开始，在上传过来的ids中是这样的形式
			 * 2,10000,3,4,7,10004,10006,45 这样的菜单ID和按钮ID的混合形式
			 * 所以通过与10000的比较来确定哪些是菜单的哪些是按钮的
			 * 
			 */
			for (int i = 0; i < ids.length; i++) {
				int id = Integer.parseInt(ids[i]);
				if (id>=10000) {
					operationIds += (","+id);
				} else {
					menuIds += (","+id);
				}
			}
			role = new Role();
			role.setRoleId(Integer.parseInt(roleId));
			role.setMenuIds(menuIds.substring(1));
			System.out.println(operationIds);
			role.setOperationIds(operationIds.substring(1));
			roleService.updateRole(role);
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("errorMsg", "对不起，授权失败");
		}
		WriterUtil.write(response, result.toString());
	}
	
	
	
}
