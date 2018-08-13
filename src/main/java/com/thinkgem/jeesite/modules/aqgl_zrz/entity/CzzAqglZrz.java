/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqgl_zrz.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 安全管理责任制Entity
 * @author qyd
 * @version 2018-08-13
 */
public class CzzAqglZrz extends DataEntity<CzzAqglZrz> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 标题
	private String content;		// 考核内容
	private String file;		// 附件
	
	public CzzAqglZrz() {
		super();
	}

	public CzzAqglZrz(String id){
		super(id);
	}

	@Length(min=0, max=100, message="标题长度必须介于 0 和 100 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=0, max=3000, message="考核内容长度必须介于 0 和 3000 之间")
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