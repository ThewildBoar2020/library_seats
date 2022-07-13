package dingzhen.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import dingzhen.dao.LogDao;
import dingzhen.service.LogService;


@Service("logService")
public class LogServiceImpl<T> implements LogService<T>{

	private LogDao<T> dao ;
	public void setDao(LogDao<T> dao) {
		this.dao = dao;
	}
	
	public int countLog(T t) throws Exception {
		return dao.countLog(t);
	}
	
	public List<T> findLog(T t) throws Exception {
		return dao.findLog(t);
	}
	public void insertLog(T t) throws Exception {
		//dao.insertLog(t);
	}
	
	

}
