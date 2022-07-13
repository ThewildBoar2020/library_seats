package dingzhen.dao;

import java.util.List;

import org.mybatis.spring.annotation.Mapper;

@Mapper("topicDao")
public interface TopicDao<T> {

	// 查询所有
	public abstract List<T> findTopic(T t) throws Exception;

	// 数量
	public abstract int countTopic(T t) throws Exception;

	// 新增
	public abstract void addTopic(T t) throws Exception;

	// 修改
	public abstract void updateTopiccontent(T t) throws Exception;

	// 删除
	public abstract void deleteTopic(Integer id) throws Exception;
	

}
