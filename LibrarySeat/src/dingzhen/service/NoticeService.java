package dingzhen.service;

import java.util.List;

public interface NoticeService<T> {
	// 查询所有
	public abstract List<T> findNotice(T t) throws Exception;

	// 数量
	public abstract int countNotice(T t) throws Exception;

	// 新增
	public abstract void addNotice(T t) throws Exception;

	// 修改
	public abstract void updateNotice(T t) throws Exception;

	// 删除
	public abstract void deleteNotice(Integer id) throws Exception;
	
	public abstract T findOneNotice(Integer id) throws Exception;
}
