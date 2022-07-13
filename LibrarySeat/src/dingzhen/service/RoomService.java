package dingzhen.service;

import java.util.List;

public interface RoomService<T> {
	// 查询所有
	public abstract List<T> findRoom(T t) throws Exception;

	// 数量
	public abstract int countRoom(T t) throws Exception;

	// 新增
	public abstract void addRoom(T t) throws Exception;

	// 修改
	public abstract void updateRoom(T t) throws Exception;

	// 删除
	public abstract void deleteRoom(Integer id) throws Exception;
	
	public abstract int findScoreByRoomid(int roomid) throws Exception;
}
