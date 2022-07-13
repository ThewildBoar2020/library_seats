package dingzhen.dao;

import java.util.List;

import org.mybatis.spring.annotation.Mapper;

@Mapper("illegalDao")
public interface IllegalDao<T> {
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
