/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqglbm.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 安全管理部门Entity
 * @author qyd
 * @version 2018-07-12
 */
public class CzzAqglbm extends DataEntity<CzzAqglbm> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 机构名称
	private String function;		// 职能职责
	
	public CzzAqglbm() {
		super();
	}

	public CzzAqglbm(String id){
		super(id);
	}

	@Length(min=0, max=100, message="机构名称长度必须介于 0 和 100 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=2000, message="职能职责长度必须介于 0 和 2000 之间")
	public String getFunction() {
		return function;
	}

	public void setFunction(String function) {
		this.function = function;
	}
	
}