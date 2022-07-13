package dingzhen.entity;

import java.io.Serializable;

/**
 * 角色
 */
public class Role extends BaseEntity implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer roleId;  //id
	private String roleName;  //名称
	private String menuIds;   //菜单ID组成的集合
	private String operationIds;  //按钮组成的集合
	private String roleDescription;  //描述
	
	
	
	public String getOperationIds() {
		return operationIds;
	}
	public void setOperationIds(String operationIds) {
		this.operationIds = operationIds;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getMenuIds() {
		return menuIds;
	}
	public void setMenuIds(String menuIds) {
		this.menuIds = menuIds;
	}
	public String getRoleDescription() {
		return roleDescription;
	}
	public void setRoleDescription(String roleDescription) {
		this.roleDescription = roleDescription;
	}
	
}
