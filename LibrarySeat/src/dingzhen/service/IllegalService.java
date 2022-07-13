package dingzhen.service;

import java.util.List;

public interface IllegalService<T> {
	// 查询所有
	public abstract List<T> findIllegal(T t) throws Exception;

	// 数量
	public abstract int countIllegal(T t) throws Exception;

	// 新增
	public abstract void addIllegal(T t) throws Exception;

	// 修改
	public abstract void updateIllegal(T t) throws Exception;

	// 删除
	public abstract void deleteIllegal(Integer id) throws Exception;
}
