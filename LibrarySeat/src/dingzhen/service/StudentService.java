package dingzhen.service;

import java.util.List;

public interface StudentService<T> {

	// 查询所有
	public abstract List<T> findStudent(T t) throws Exception;

	// 数量
	public abstract int countStudent(T t) throws Exception;

	// 新增
	public abstract void addStudent(T t) throws Exception;

	// 修改
	public abstract void updateStudent(T t) throws Exception;

	// 删除
	public abstract void deleteStudent(Integer id) throws Exception;
	
	// 通过学号查找
	public abstract T findOneStudentByno(String no) throws Exception;
}
