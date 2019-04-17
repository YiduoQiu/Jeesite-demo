/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.zybwh_cx.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 职业病危害因素分类目录查询Entity
 * @author qyd
 * @version 2018-09-17
 */
public class CzzZybflCx extends DataEntity<CzzZybflCx> {
	
	private static final long serialVersionUID = 1L;
	private String sortId;		// 排序
	private String type;		// 危害因素大类
	private String name;		// 职业病危害因素名称
	private String cas;		// CAS号
	
	public CzzZybflCx() {
		super();
	}

	public CzzZybflCx(String id){
		super(id);
	}

	@Length(min=0, max=1000, message="排序长度必须介于 0 和 1000 之间")
	public String getSortId() {
		return sortId;
	}

	public void setSortId(String sortId) {
		this.sortId = sortId;
	}
	
	@Length(min=0, max=100, message="危害因素大类长度必须介于 0 和 100 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=1000, message="职业病危害因素名称长度必须介于 0 和 1000 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=1000, message="CAS号长度必须介于 0 和 1000 之间")
	public String getCas() {
		return cas;
	}

	public void setCas(String cas) {
		this.cas = cas;
	}
	
}