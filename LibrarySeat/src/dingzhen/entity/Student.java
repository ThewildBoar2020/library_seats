package dingzhen.entity;

// 学生

public class Student extends BaseEntity{
	
	private Integer id; 
	private String no; //学号
	private String name; //姓名
	private String sex; //性别
	private Integer clazzid; //班级ID
	private String  clazzname; //班级name
	private String birth; //出生
	private String phone; //电话
	private String mail;  //邮箱
	private String photo; //照片
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Integer getClazzid() {
		return clazzid;
	}
	public void setClazzid(Integer clazzid) {
		this.clazzid = clazzid;
	}
	public String getClazzname() {
		return clazzname;
	}
	public void setClazzname(String clazzname) {
		this.clazzname = clazzname;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}

}
