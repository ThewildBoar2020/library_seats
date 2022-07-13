package dingzhen.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dingzhen.dao.BbsDao;
import dingzhen.service.BbsService;

@Service("bbsService")
public class BbsServiceImpl<T> implements BbsService<T>{
	
	@Autowired
	private BbsDao<T> dao;

	public List<T> findBbs(T t) throws Exception {
		return dao.findBbs(t);
	}

	public int countBbs(T t) throws Exception {
		return dao.countBbs(t);
	}

	public void addBbs(T t) throws Exception {
		dao.addBbs(t);
	}

	

	public void deleteBbs(Integer id) throws Exception {
		dao.deleteBbs(id);
	}

	public void updateBbstitle(T t) throws Exception {
		dao.updateBbstitle(t);
	}

	public void updateBbslast(T t) throws Exception {
		dao.updateBbslast(t);
	}

	public T findOneBbs(Integer id) throws Exception {
		return dao.findOneBbs(id);
	}

}
