/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqsc_czgc.entity;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 安全生产操作规程Entity
 * @author qyd
 * @version 2018-08-13
 */
public class CzzAqglCzgc extends DataEntity<CzzAqglCzgc> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 标题
	private String content;		// 考核内容
	private String file;		// 附件
	
	public CzzAqglCzgc() {
		super();
	}

	public CzzAqglCzgc(String id){
		super(id);
	}

	@Length(min=0, max=100, message="标题长度必须介于 0 和 100 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@NotBlank
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}
	
}