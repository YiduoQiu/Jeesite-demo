/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.yhpczd.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 隐患排查相关制度Entity
 * @author qyd
 * @version 2018-09-13
 */
public class CzzYhpcXgzd extends DataEntity<CzzYhpcXgzd> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 标题
	private String content;		// 内容
	private String file;		// 附件
	
	public CzzYhpcXgzd() {
		super();
	}

	public CzzYhpcXgzd(String id){
		super(id);
	}

	@Length(min=0, max=100, message="标题长度必须介于 0 和 100 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=200, message="附件长度必须介于 0 和 200 之间")
	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}
	
}