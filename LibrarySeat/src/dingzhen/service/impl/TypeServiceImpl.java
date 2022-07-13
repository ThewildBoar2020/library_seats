package dingzhen.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dingzhen.dao.TypeDao;
import dingzhen.service.TypeService;

@Service("typeService")
public class TypeServiceImpl<T> implements TypeService<T>{
	
	@Autowired
	private TypeDao<T> dao;

	public List<T> findType(T t) throws Exception {
		return dao.findType(t);
	}

	public int countType(T t) throws Exception {
		return dao.countType(t);
	}

	public void addType(T t) throws Exception {
		dao.addType(t);
	}

	public void updateType(T t) throws Exception {
		dao.updateType(t);
	}

	public void deleteType(Integer id) throws Exception {
		dao.deleteType(id);
	}

}
