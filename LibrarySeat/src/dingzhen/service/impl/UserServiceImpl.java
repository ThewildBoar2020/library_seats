package dingzhen.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import dingzhen.dao.UserDao;
import dingzhen.service.UserService;

@Service("userService")
public class UserServiceImpl<T> implements UserService<T>{
	
	private UserDao<T> dao;
	public void setDao(UserDao<T> dao) {
		this.dao = dao;
	}

	public void addUser(T t) throws Exception {
		dao.addUser(t);
	}

	public int countUser(T t) throws Exception {
		return dao.countUser(t);
	}

	public void deleteUser(Integer id) throws Exception {
		dao.deleteUser(id);
	}

	public T existUserWithRoleId(Integer roleId) throws Exception {
		return dao.existUserWithRoleId(roleId);
	}

	public T existUserWithUserName(String userName) throws Exception {
		return dao.existUserWithUserName(userName);
	}

	public T findOneUser(Integer id) throws Exception {
		return dao.findOneUser(id);
	}

	public List<T> findUser(T t) throws Exception {
		return dao.findUser(t);
	}

	public T loginUser(Map<String, String> map) throws Exception {
		return dao.loginUser(map);
	}

	public void updateUser(T t) throws Exception {
		dao.updateUser(t);
	}

}
