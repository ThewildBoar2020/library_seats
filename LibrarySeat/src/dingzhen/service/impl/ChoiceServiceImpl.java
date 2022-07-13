package dingzhen.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dingzhen.dao.ChoiceDao;
import dingzhen.service.ChoiceService;

@Service("choiceService")
public class ChoiceServiceImpl<T> implements ChoiceService<T>{
	
	@Autowired
	private ChoiceDao<T> dao;

	public List<T> findChoice(T t) throws Exception {
		return dao.findChoice(t);
	}

	public int countChoice(T t) throws Exception {
		return dao.countChoice(t);
	}

	public void addChoice(T t) throws Exception {
		dao.addChoice(t);
	}

	public void modifyChoice(T t) throws Exception {
		dao.modifyChoice(t);
	}

	public void deleteChoice(Integer id) throws Exception {
		dao.deleteChoice(id);
	}

	public T findOneChoice(T t) throws Exception {
		return dao.findOneChoice(t);
	}


	public void cancelChoice(T t) throws Exception {
		dao.cancelChoice(t);
	}

	public List<T> findFriend(T t) throws Exception {
		return dao.findFriend(t);
	}

	public int count(T t) throws Exception {
		return dao.count(t);
	}


}
