package dingzhen.entity;

// 交流主题
public class Bbs extends BaseEntity{

	private Integer id;   //主键
	private String title;  //标题
	private String author;  //发表人
	private String time;     //发表时间
	private Integer reply;        //回复人数
	private String lastreply;       //最后回复人
	private String lastreplytime;    // 最后回复时间
	private String content;    
	
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	
	public Integer getReply() {
		return reply;
	}
	public void setReply(Integer reply) {
		this.reply = reply;
	}
	public String getLastreply() {
		return lastreply;
	}
	public void setLastreply(String lastreply) {
		this.lastreply = lastreply;
	}
	public String getLastreplytime() {
		return lastreplytime;
	}
	public void setLastreplytime(String lastreplytime) {
		this.lastreplytime = lastreplytime;
	}
	
}
