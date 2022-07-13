package dingzhen.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dingzhen.dao.SeatDao;
import dingzhen.service.SeatService;

@Service("seatService")
public class SeatServiceImpl<T> implements SeatService<T>{
	
	@Autowired
	private SeatDao<T> dao;

	public List<T> findSeat(T t) throws Exception {
		return dao.findSeat(t);
	}

	public int countSeat(T t) throws Exception {
		return dao.countSeat(t);
	}

	public void insertSeat(T t) throws Exception {
		dao.insertSeat(t);
	}

	public void modifySeat(T t) throws Exception {
		dao.modifySeat(t);
	}

	public void deleteSeat(Integer id) throws Exception {
		dao.deleteSeat(id);
	}

	public void occupySeat(T t) throws Exception {
		dao.occupySeat(t);
	}

	public void cancelSeat(String keyword) throws Exception {
		dao.cancelSeat(keyword);
	}

	public int findBlock(T t) throws Exception {
		return dao.findBlock(t);
	}
}
