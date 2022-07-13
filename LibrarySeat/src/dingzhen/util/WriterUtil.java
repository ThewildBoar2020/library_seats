package dingzhen.util;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

/**
 * 输出
 */
public class WriterUtil {
	
	public static void write(HttpServletResponse response,String obj){
		try {
			 response.getWriter().write(obj);
		} catch (IOException e) {
			
		}
	}
}
