package dingzhen.dao;

import java.util.List;

import org.mybatis.spring.annotation.Mapper;

@Mapper("typeDao")
public interface TypeDao<T> {
	// 查询所有
	public abstract List<T> findType(T t) throws Exception;

	// 数量
	public abstract int countType(T t) throws Exception;

	// 新增
	public abstract void addType(T t) throws Exception;

	// 修改
	public abstract void updateType(T t) throws Exception;

	// 删除
	public abstract void deleteType(Integer id) throws Exception;
}
