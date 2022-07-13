package dingzhen.entity;

public class ComboValue {

	private String value;  //隐藏的值
	private String label;  //显示的
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public ComboValue() {
		super();
	}
	public ComboValue(String value, String lable) {
		super();
		this.value = value;
		this.label = lable;
	}
	
}
