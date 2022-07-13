package dingzhen.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import dingzhen.dao.MenuDao;
import dingzhen.service.MenuService;

@Service("menuService")
public class MenuServiceImpl<T> implements MenuService<T>{

	private MenuDao<T> dao;
	public void setDao(MenuDao<T> dao) {
		this.dao = dao;
	}
	
	public void addMenu(T t) throws Exception {
		dao.addMenu(t);
	}

	public int countMenu(T t) throws Exception {
		return dao.countMenu(t);
	}

	public void deleteMenu(Integer menuId) throws Exception {
		dao.deleteMenu(menuId);
	}

	public List<T> findMenu(T t) throws Exception {
		return dao.findMenu(t);
	}

	@SuppressWarnings("unchecked")
	public List<T> menuTree(Map map) throws Exception {
		return dao.menuTree(map);
	}

	public void updateMenu(T t) throws Exception {
		dao.updateMenu(t);
	}
	
	

}
