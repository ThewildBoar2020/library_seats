package dingzhen.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 
 */
public class TimeUtil {
	
	/**
	 * 将日期格式化成String类型
	 * @param date
	 * @param pattern
	 * @return
	 */
	public static String formatTime(Date date,String pattern){
		return new SimpleDateFormat(pattern).format(date);
	}
}
