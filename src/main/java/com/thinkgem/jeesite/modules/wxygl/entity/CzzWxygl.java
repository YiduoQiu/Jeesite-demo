/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wxygl.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 危险源管理Entity
 * @author qyd
 * @version 2018-07-04
 */
public class CzzWxygl extends DataEntity<CzzWxygl> {
	
	private static final long serialVersionUID = 1L;
	private String wxyName;		// 危险源名称
	private String location;		// 位置
	private String person;		// 管理人员
	private String plan;		// 管理方案
	private String file;		// 附件
	
	public CzzWxygl() {
		super();
	}

	public CzzWxygl(String id){
		super(id);
	}

	@Length(min=0, max=100, message="危险源名称长度必须介于 0 和 100 之间")
	public String getWxyName() {
		return wxyName;
	}

	public void setWxyName(String wxyName) {
		this.wxyName = wxyName;
	}
	
	@Length(min=0, max=300, message="位置长度必须介于 0 和 300 之间")
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
	@Length(min=0, max=100, message="管理人员长度必须介于 0 和 100 之间")
	public String getPerson() {
		return person;
	}

	public void setPerson(String person) {
		this.person = person;
	}
	
	@Length(min=0, max=2000, message="管理方案长度必须介于 0 和 2000 之间")
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