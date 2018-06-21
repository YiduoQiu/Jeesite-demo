/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.ckwz.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 仓库物资管理Entity
 * @author qyd
 * @version 2018-06-19
 */
public class CkwzChild extends DataEntity<CkwzChild> {
	
	private static final long serialVersionUID = 1L;
	private CkwzMain testDataMainId;		// 业务主表ID 父类
	private String location;		// 库位
	private Date inTinme;		// 入库时间
	private String amount;		// 数量
	private String name;		// 经手人
	
	public CkwzChild() {
		super();
	}

	public CkwzChild(String id){
		super(id);
	}

	public CkwzChild(CkwzMain testDataMainId){
		this.testDataMainId = testDataMainId;
	}

	@Length(min=0, max=64, message="业务主表ID长度必须介于 0 和 64 之间")
	public CkwzMain getTestDataMainId() {
		return testDataMainId;
	}

	public void setTestDataMainId(CkwzMain testDataMainId) {
		this.testDataMainId = testDataMainId;
	}
	
	@Length(min=0, max=200, message="库位长度必须介于 0 和 200 之间")
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getInTinme() {
		return inTinme;
	}

	public void setInTinme(Date inTinme) {
		this.inTinme = inTinme;
	}
	
	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}
	
	@Length(min=0, max=100, message="经手人长度必须介于 0 和 100 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}