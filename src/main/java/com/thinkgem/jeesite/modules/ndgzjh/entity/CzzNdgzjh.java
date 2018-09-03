/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.ndgzjh.entity;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 年度工作计划Entity
 * @author qyd
 * @version 2018-07-12
 */
public class CzzNdgzjh extends DataEntity<CzzNdgzjh> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 标题
	private String name;		// 创建人
	private String plan;		// 工作计划
	private String file;		// 附件
	
	public CzzNdgzjh() {
		super();
	}

	public CzzNdgzjh(String id){
		super(id);
	}

	@Length(min=0, max=200, message="标题长度必须介于 0 和 200 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=0, max=100, message="创建人长度必须介于 0 和 100 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@NotBlank
	public String getPlan() {
		return plan;
	}

	public void setPlan(String plan) {
		this.plan = plan;
	}
	
	@Length(min=0, max=100, message="附件长度必须介于 0 和 100 之间")
	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}
	
}