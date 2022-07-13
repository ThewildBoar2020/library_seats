package dingzhen.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dingzhen.dao.BookDao;
import dingzhen.service.BookService;

@Service("bookService")
public class BookServiceImpl<T> implements BookService<T>{
	
	@Autowired
	private BookDao<T> dao;

	public List<T> findBook(T t) throws Exception {
		return dao.findBook(t);
	}

	public int countBook(T t) throws Exception {
		return dao.countBook(t);
	}

	public void addBook(T t) throws Exception {
		dao.addBook(t);
	}

	public void updateBook(T t) throws Exception {
		dao.updateBook(t);
	}

	public void deleteBook(Integer id) throws Exception {
		dao.deleteBook(id);
	}

	public T findOneBook(int id) throws Exception {
		return dao.findOneBook(id);
	}

}
