package dingzhen.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import dingzhen.dao.RoleDao;
import dingzhen.service.RoleService;

@Service("roleService")
public class RoleServiceImpl<T> implements RoleService<T>{

	private RoleDao<T> dao;
	public void setDao(RoleDao<T> dao) {
		this.dao = dao;
	}
	
	public void addRole(T t) throws Exception {
		dao.addRole(t);
	}

	public int countRole(T t) throws Exception {
		return dao.countRole(t);
	}

	public void deleteRole(Integer roleId) throws Exception {
		dao.deleteRole(roleId);
	}

	public T findOneRole(Integer roleId) throws Exception {
		return dao.findOneRole(roleId);
	}

	public List<T> findRole(T t) throws Exception {
		return dao.findRole(t);
	}

	public void updateRole(T t) throws Exception {
		dao.updateRole(t);
	}

	public T existRoleWithRoleName(String roleName) throws Exception {
		return dao.existRoleWithRoleName(roleName);
	}

	@SuppressWarnings("unchecked")
	public void deleteRoleByRoleIds(Map map) throws Exception {
		dao.deleteRoleByRoleIds(map);
	}

}
