package dingzhen.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;


import dingzhen.entity.User;
import dingzhen.util.StringUtil;

/**
 * 自定义jsp标签
 * 遇见
 * <privilege:operation  ></privilege:operation>开头的标签就进行解析成a标签
 */
public class PrivilegeTag extends TagSupport {

	private static final long serialVersionUID = -532517444654109642L;

	private String operationId; // 对应Attribute,加上set方法。
	private String name;      // 按钮名（添加）
	private String clazz;     // 样式
	private String iconCls;   // 图标
	private String onClick;   // 点击事件
	
	public void setOperationId(String operationId) {
		this.operationId = operationId;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setClazz(String classes) {
		this.clazz = classes;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public void setOnClick(String onClick) {
		this.onClick = onClick;
	}

	/**
	 * 解析标签，形成原有的a标签
	 * <a href="javascript:reserveRole()" class="easyui-linkbutton" iconCls="icon-ok" >保存</a>
	 */
	public int doStartTag() throws JspException {
		String currentOperationIds = (String) pageContext.getSession().getAttribute("currentOperationIds");
		if (StringUtil.isNotEmpty(currentOperationIds) && StringUtil.existStrArr(operationId, currentOperationIds.split(","))) {
			StringBuffer sb = new StringBuffer();
			sb.append("<a href=\"javascript:");
			sb.append(onClick + "\"");
			sb.append("class=\""+clazz+"\"");
			sb.append("iconCls=\""+iconCls+"\"");
			sb.append("plain=\"true\" >");
			sb.append(name +"</a>");
			try {
				pageContext.getOut().write(sb.toString());
			} catch (IOException e) {
				e.printStackTrace();
			}
			return EVAL_PAGE;
		}
		return SKIP_BODY; // 跳过body,body部分不会显示
		/* 设置默认值 */
	}
	
}
