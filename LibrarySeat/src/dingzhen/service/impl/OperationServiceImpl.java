package dingzhen.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import dingzhen.dao.OperationDao;
import dingzhen.service.OperationService;

@Service("operationService")
public class OperationServiceImpl<T> implements OperationService<T>{
	
	private OperationDao<T> dao;
	public void setDao(OperationDao<T> dao) {
		this.dao = dao;
	}

	public void addOperation(T t) throws Exception {
		dao.addOperation(t);
	}

	public int countOperation(T t) throws Exception {
		return dao.countOperation(t);
	}

	public void deleteOperation(Integer operationId) throws Exception {
		dao.deleteOperation(operationId);
	}

	public List<T> findOperation(T t) throws Exception {
		return dao.findOperation(t);
	}

	public void updateOperation(T t) throws Exception {
		dao.updateOperation(t);
	}

}
