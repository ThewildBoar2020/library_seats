package dingzhen.service;

import java.util.List;

public interface OperationService<T> {

	public abstract List<T> findOperation(T t) throws Exception;
	
	public abstract int countOperation(T t) throws Exception;
	
	public abstract void addOperation(T t) throws Exception;
	
	public abstract void updateOperation(T t) throws Exception;
	
	public abstract void deleteOperation(Integer operationId) throws Exception;
	
}