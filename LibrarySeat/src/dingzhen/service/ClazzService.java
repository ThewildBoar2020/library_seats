package dingzhen.service;

import java.util.List;

public interface ClazzService<T> {

	// 查询所有
	public abstract List<T> findClazz(T t) throws Exception;

	// 数量
	public abstract int countClazz(T t) throws Exception;

	// 新增
	public abstract void addClazz(T t) throws Exception;

	// 修改
	public abstract void updateClazz(T t) throws Exception;

	// 删除
	public abstract void deleteClazz(Integer id) throws Exception;
	
	
}
