/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.zyjk_pj.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 职安评价Entity
 * @author qyd
 * @version 2019-03-04
 */
public class CzzZyjkPj extends DataEntity<CzzZyjkPj> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 标题
	private String content;		// 职安评价
	private String file;		// 附件
	
	public CzzZyjkPj() {
		super();
	}

	public CzzZyjkPj(String id){
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
	
	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}
	
}