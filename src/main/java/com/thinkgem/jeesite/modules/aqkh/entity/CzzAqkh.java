/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqkh.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 安全考核Entity
 * @author qyd
 * @version 2018-07-16
 */
public class CzzAqkh extends DataEntity<CzzAqkh> {
	
	private static final long serialVersionUID = 1L;
	private String type;		// 考核类型
	private String title;		// 标题
	private String person;		// 考核对象
	private String content;		// 考核内容
	private String file;		// 附件
	
	public CzzAqkh() {
		super();
	}

	public CzzAqkh(String id){
		super(id);
	}

	@Length(min=0, max=1, message="考核类型长度必须介于 0 和 1 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=100, message="标题长度必须介于 0 和 100 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=0, max=64, message="考核对象长度必须介于 0 和 64 之间")
	public String getPerson() {
		return person;
	}

	public void setPerson(String person) {
		this.person = person;
	}
	
	@Length(min=0, max=1000, message="考核内容长度必须介于 0 和 1000 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=100, message="附件长度必须介于 0 和 100 之间")
	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}
	
}