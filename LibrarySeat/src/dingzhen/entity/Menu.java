package dingzhen.entity;

import java.io.Serializable;

/**
菜单
 */
public class Menu implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer menuId;  //id
	private String menuName;  //名称
	private String menuUrl;  //方法名
	private Integer parentId;  //上级菜单
	private String menuDescription;  //描述
	private String state;       //是否是叶子节点
	private String iconCls;    //图标
	private Integer seq;     //顺序
	private Integer[] menuIds; 
	
	// 操作按钮名称合集
	private String operations;
	
	
	
	
	public String getOperations() {
		return operations;
	}
	public void setOperations(String operations) {
		this.operations = operations;
	}
	public Integer[] getMenuIds() {
		return menuIds;
	}
	public void setMenuIds(Integer[] menuIds) {
		this.menuIds = menuIds;
	}
	public Integer getMenuId() {
		return menuId;
	}
	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuUrl() {
		return menuUrl;
	}
	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public String getMenuDescription() {
		return menuDescription;
	}
	public void setMenuDescription(String menuDescription) {
		this.menuDescription = menuDescription;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getIconCls() {
		return iconCls;
	}
	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}
	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	
}
