package dingzhen.dao;

import java.util.List;

import org.mybatis.spring.annotation.Mapper;

@Mapper("choiceDao")
public interface ChoiceDao<T> {
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
	
	// 取消
	public abstract void cancelChoice(T t) throws Exception;
	
	// 推荐朋友匹配度问题
	// SELECT COUNT(studentno) AS total,studentno FROM choice  WHERE  LEFT(RIGHT(seatkeyword,13),9) = '08点-12点-1' AND TIME > '2016-04-15 17:13:23' GROUP BY studentno HAVING  studentno!='xs002' AND total > 3 ORDER BY total DESC
	// 其中的‘08点-12点-1’ 表示自己最近一次去的时间段和阅览室
	// '2016-04-15 17:13:23' 表示当前时间20天之前的时间。即条件筛选在最近的20天内有匹配的
	// ‘xs002’表示自己的学号要排除掉。
	// 最后按照匹配度即total的值从高到低排
	// 查出的结果是经常去的其他人的学号和各自去的次数
	// total > 3 ，其中total是在条件内查询出来的匹配次数。3是设定的标准。只有3次以上在同一时间段同一教师才能选出来
	public abstract List<T> findFriend(T t) throws Exception;
	
	public abstract int count(T t) throws Exception;
}
