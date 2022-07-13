package dingzhen.service;

import java.util.List;

public interface ChoiceService<T> {
	// 查询所有
	public abstract List<T> findChoice(T t) throws Exception;

	// 数量
	public abstract int countChoice(T t) throws Exception;

	// 新增
	public abstract void addChoice(T t) throws Exception;

	// 修改
	public abstract void modifyChoice(T t) throws Exception;

	// 删除
	public abstract void deleteChoice(Integer id) throws Exception;
	
	public abstract T findOneChoice(T t) throws Exception;
	
	public abstract void cancelChoice(T t) throws Exception;
	
	public abstract List<T> findFriend(T t) throws Exception;
	
	public abstract int count(T t) throws Exception;
}
