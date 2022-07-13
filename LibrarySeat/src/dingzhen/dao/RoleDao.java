package dingzhen.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.Mapper;

@Mapper("roleDao")
public interface RoleDao<T> {

	public abstract T findOneRole(Integer roleId) throws Exception;
	
	public abstract List<T> findRole(T t) throws Exception;
	
	public abstract int countRole(T t) throws Exception;
	
	public abstract void deleteRole(Integer roleId) throws Exception;
	
	public abstract void addRole(T t) throws Exception;
	
	public abstract void updateRole(T t) throws Exception;
	
	//通过名称判断是否存在，（新增时不能重名）
	public abstract T existRoleWithRoleName(String roleName) throws Exception;
	
	//批量删除
	@SuppressWarnings("unchecked")
	public abstract void deleteRoleByRoleIds(Map map) throws Exception;
}
