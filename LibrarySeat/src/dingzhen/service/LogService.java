package dingzhen.service;

import java.util.List;


public interface LogService<T> {

	public abstract void insertLog(T t) throws Exception;
	
	public abstract List<T> findLog(T t) throws Exception;
	
	public abstract int countLog(T t) throws Exception;
}
