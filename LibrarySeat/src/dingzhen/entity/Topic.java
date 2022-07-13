package dingzhen.entity;

// 交流回复内容
public class Topic extends BaseEntity{

	private Integer id;
	private Integer bbsid;  //主题id
	private String content;  //内容
	private String author;   // 作者
	private String time;   //发表时间
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getBbsid() {
		return bbsid;
	}
	public void setBbsid(Integer bbsid) {
		this.bbsid = bbsid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
}
