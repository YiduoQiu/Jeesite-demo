/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqpx.entity.ndpxjh;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 年度培训计划Entity
 * @author qyd
 * @version 2018-07-20
 */
public class CzzAqpxNdjh extends DataEntity<CzzAqpxNdjh> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 标题
	private String content;		// 内容
	
	public CzzAqpxNdjh() {
		super();
	}

	public CzzAqpxNdjh(String id){
		super(id);
	}

	@Length(min=0, max=100, message="标题长度必须介于 0 和 100 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=0, max=3000, message="内容长度必须介于 0 和 3000 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}