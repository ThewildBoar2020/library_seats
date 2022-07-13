package dingzhen.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dingzhen.dao.ScoreDao;
import dingzhen.service.ScoreService;

@Service("scoreService")
public class ScoreServiceImpl<T> implements ScoreService<T>{
	
	@Autowired
	private ScoreDao<T> dao;

	public List<T> findScore(T t) throws Exception {
		return dao.findScore(t);
	}

	public int countScore(T t) throws Exception {
		return dao.countScore(t);
	}

	public void addScore(T t) throws Exception {
		dao.addScore(t);
	}

	public void updateScore(T t) throws Exception {
		dao.updateScore(t);
	}

	public void deleteScore(Integer id) throws Exception {
		dao.deleteScore(id);
	}

	public T findOneScore(String studentno) throws Exception {
		return dao.findOneScore(studentno);
	}

	public void deleteOneScore(String studentno) throws Exception {
		dao.deleteOneScore(studentno);
	}

}
