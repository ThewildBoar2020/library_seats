package dingzhen.service;

import java.util.List;
import java.util.Map;


public interface MenuService<T> {

	public abstract List<T> findMenu(T t) throws Exception;
	
	public abstract int countMenu(T t) throws Exception;
	
	public abstract void addMenu(T t) throws Exception;
	
	public abstract void updateMenu(T t) throws Exception;
	
	public abstract void deleteMenu(Integer menuId) throws Exception;
	
	@SuppressWarnings("unchecked")
	public abstract List<T> menuTree(Map map) throws Exception;
}
