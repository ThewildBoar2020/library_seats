package dingzhen.controller;

// 书籍管理控制器
import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dingzhen.entity.Book;
import dingzhen.entity.User;
import dingzhen.service.BookService;
import dingzhen.util.StringUtil;
import dingzhen.util.WriterUtil;

@Controller
@RequestMapping("book")
public class BookController {

	private int page;
	private int rows;
	@Autowired
	private BookService<Book> bookService;
	private Book book;
	
	
	@RequestMapping("bookIndex")
	public String index(HttpServletRequest request){
		User currentUser = (User)request.getSession().getAttribute("currentUser");
		if(currentUser.getRoleId()==1){
			return "tuijian/bookIndexForAdmin";
		} else {
			return "tuijian/bookIndex";
		}
	}
	
	
	@RequestMapping("bookList")
	public void bookList(HttpServletRequest request,HttpServletResponse response) {
		try {
			page = Integer.parseInt(request.getParameter("page"));
			rows = Integer.parseInt(request.getParameter("rows"));
			book = new Book();
			book.setPage((page-1)*rows);
			book.setRows(rows);
			List<Book> list = bookService.findBook(book);
			int total = bookService.countBook(book);
			JSONObject jsonObj = new JSONObject();//new一个JSON
			jsonObj.put("total",total );//total代表一共有多少数据
			jsonObj.put("rows", list);//row是代表显示的页的数据
	        WriterUtil.write(response,jsonObj.toString()); //将上述Json输出，前台ajax接收
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	@RequestMapping("reserveBook")
	public void reserveBook(HttpServletRequest request,HttpServletResponse response,Book book) {
		String id = request.getParameter("id");
		JSONObject result = new JSONObject();
		result.put("success", true);
		try {
			if(StringUtil.isNotEmpty(id)){
				book.setId(Integer.parseInt(id));
				bookService.updateBook(book);
			} else {
				bookService.addBook(book);
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.put("errorMsg", "对不起！保存失败");
		}
		WriterUtil.write(response, result.toString());
	}
	
	
	
	
	@RequestMapping("deleteBook")
	public void delete(HttpServletRequest request,HttpServletResponse response){
		JSONObject result=new JSONObject();
		try {
			String[] ids=request.getParameter("ids").split(",");
			for (int i=0;i<ids.length;i++) {
				bookService.deleteBook(Integer.parseInt(ids[i]));
			}
			result.put("success", true);
			result.put("delNums", ids.length);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("errorMsg", "对不起，删除失败");
		}
		WriterUtil.write(response, result.toString());
	}
	
	
	
	@RequestMapping("uploadCover")
	public void uploadPhoto(HttpServletRequest request,HttpServletResponse response,@RequestParam MultipartFile cover){
		String now = System.currentTimeMillis()+"";
		if (!cover.isEmpty()) {
			String filePath = request.getSession().getServletContext().getRealPath("/")+ "upload/book/" + now + ".jpg";
			try {
				cover.transferTo(new File(filePath));
				book.setCover("upload/book/" + now + ".jpg");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		WriterUtil.write(response, "upload/book/" + now + ".jpg");
	}
	
	
	
	
	
	
}
