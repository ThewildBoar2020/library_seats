package dingzhen.service;

import java.util.List;

public interface SeatService<T> {
	// 查询所有
	public abstract List<T> findSeat(T t) throws Exception;

	// 数量
	public abstract int countSeat(T t) throws Exception;

	// 新增
	public abstract void insertSeat(T t) throws Exception;

	// 修改
	public abstract void modifySeat(T t) throws Exception;

	// 删除
	public abstract void deleteSeat(Integer id) throws Exception;
	
	// 占座
	public abstract void occupySeat(T t) throws Exception;
	
	public abstract void cancelSeat(String keyword) throws Exception;
	
	//查询余座
	public abstract int findBlock(T t) throws Exception;
	
}
