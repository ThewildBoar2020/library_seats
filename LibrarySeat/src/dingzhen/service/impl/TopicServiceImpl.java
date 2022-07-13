package dingzhen.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dingzhen.dao.TopicDao;
import dingzhen.service.TopicService;

@Service("topicService")
public class TopicServiceImpl<T> implements TopicService<T>{
	
	@Autowired
	private TopicDao<T> dao;

	public List<T> findTopic(T t) throws Exception {
		return dao.findTopic(t);
	}

	public int countTopic(T t) throws Exception {
		return dao.countTopic(t);
	}

	public void addTopic(T t) throws Exception {
		dao.addTopic(t);
	}

	public void updateTopiccontent(T t) throws Exception {
		dao.updateTopiccontent(t);
	}

	public void deleteTopic(Integer id) throws Exception {
		dao.deleteTopic(id);
	}


}
