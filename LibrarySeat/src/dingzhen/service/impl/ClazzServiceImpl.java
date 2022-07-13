package dingzhen.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dingzhen.dao.ClazzDao;
import dingzhen.service.ClazzService;

@Service("clazzService")
public class ClazzServiceImpl<T> implements ClazzService<T>{
	
	@Autowired
	private ClazzDao<T> dao;

	public List<T> findClazz(T t) throws Exception {
		return dao.findClazz(t);
	}

	public int countClazz(T t) throws Exception {
		return dao.countClazz(t);
	}

	public void addClazz(T t) throws Exception {
		dao.addClazz(t);
	}

	public void updateClazz(T t) throws Exception {
		dao.updateClazz(t);
	}

	public void deleteClazz(Integer id) throws Exception {
		dao.deleteClazz(id);
	}

}
