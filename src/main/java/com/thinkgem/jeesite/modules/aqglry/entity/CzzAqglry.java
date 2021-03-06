/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqglry.entity;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 安全管理人员Entity
 * @author qyd
 * @version 2018-08-08
 */
public class CzzAqglry extends DataEntity<CzzAqglry> {
	
	private static final long serialVersionUID = 1L;
	private String function;		// 职务
	private String name;		// 姓名
	private String phone;		// 电话
	private String responsible;		// 职能职责
	private String file;		// 附件
	private Integer sort; 	// 排序
	
	public CzzAqglry() {
		super();
	}

	public CzzAqglry(String id){
		super(id);
	}

	@Length(min=0, max=1000, message="职务长度必须介于 0 和 1000 之间")
	public String getFunction() {
		return function;
	}

	public void setFunction(String function) {
		this.function = function;
	}
	
	@Length(min=0, max=100, message="姓名长度必须介于 0 和 100 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=20, message="电话长度必须介于 0 和 20 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getResponsible() {
		return responsible;
	}

	public void setResponsible(String responsible) {
		this.responsible = responsible;
	}
	
	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}
	
	@NotNull
	public Integer getSort() {
		return sort;
	}
	
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	
}