package dingzhen.dao;

import java.util.List;

import org.mybatis.spring.annotation.Mapper;


@Mapper("logDao")
public interface LogDao<T> {
	
	public abstract void insertLog(T t) throws Exception;
	
	public abstract List<T> findLog(T t) throws Exception;
	
	public abstract int countLog(T t) throws Exception;
	
}
