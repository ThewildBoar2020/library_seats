package dingzhen.dao;

import java.util.List;

import org.mybatis.spring.annotation.Mapper;

@Mapper("operationDao")
public interface OperationDao<T> {

	public abstract List<T> findOperation(T t) throws Exception;
	
	public abstract int countOperation(T t) throws Exception;
	
	public abstract void addOperation(T t) throws Exception;
	
	public abstract void updateOperation(T t) throws Exception;
	
	public abstract void deleteOperation(Integer operationId) throws Exception;
	
}
