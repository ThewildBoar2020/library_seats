package dingzhen.dao;

import java.util.List;

import org.mybatis.spring.annotation.Mapper;

@Mapper("bbsDao")
public interface BbsDao<T> {

	// 查询所有
	public abstract List<T> findBbs(T t) throws Exception;

	// 数量
	public abstract int countBbs(T t) throws Exception;

	// 新增
	public abstract void addBbs(T t) throws Exception;

	// 修改
	public abstract void updateBbstitle(T t) throws Exception;
	
	//修改最后更新人和回复数量
	public abstract void updateBbslast(T t) throws Exception;

	// 删除
	public abstract void deleteBbs(Integer id) throws Exception;
	
	public abstract T findOneBbs(Integer id)throws Exception;

}
