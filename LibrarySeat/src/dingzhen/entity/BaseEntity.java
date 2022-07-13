package dingzhen.entity;
/**
 *@author: wangq
 *@date: 2015-5-18上午10:15:10
 *@version:
 *@description：
 */
public class BaseEntity {
	private Integer page;
	private Integer rows;
	private String start;
	private String end;
	
	
	
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
}
