package dingzhen.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dingzhen.dao.NoticeDao;
import dingzhen.service.NoticeService;

@Service("noticeService")
public class NoticeServiceImpl<T> implements NoticeService<T>{
	
	@Autowired
	private NoticeDao<T> dao;

	public List<T> findNotice(T t) throws Exception {
		return dao.findNotice(t);
	}

	public int countNotice(T t) throws Exception {
		return dao.countNotice(t);
	}

	public void addNotice(T t) throws Exception {
		dao.addNotice(t);
	}

	public void updateNotice(T t) throws Exception {
		dao.updateNotice(t);
	}

	public void deleteNotice(Integer id) throws Exception {
		dao.deleteNotice(id);
	}

	public T findOneNotice(Integer id) throws Exception {
		return dao.findOneNotice(id);
	}

}
