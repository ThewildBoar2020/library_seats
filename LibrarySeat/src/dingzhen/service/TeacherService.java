package dingzhen.service;

import java.util.List;

public interface TeacherService<T> {

	// 查询所有
	public abstract List<T> findTeacher(T t) throws Exception;

	// 数量
	public abstract int countTeacher(T t) throws Exception;

	// 通过ID查询
	public abstract T findOneTeacher(Integer id) throws Exception;

	// 新增
	public abstract void addTeacher(T t) throws Exception;

	// 修改
	public abstract void updateTeacher(T t) throws Exception;

	// 删除
	public abstract void deleteTeacher(Integer id) throws Exception;
	
}
