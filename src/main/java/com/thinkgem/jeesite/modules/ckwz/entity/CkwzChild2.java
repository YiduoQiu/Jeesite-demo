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
 * @version 2018-06-22
 */
public class CkwzChild2 extends DataEntity<CkwzChild2> {
	
	private static final long serialVersionUID = 1L;
	private CkwzMain testDataMain;		// 业务主表id 父类
	private Date removetime;		// 出库时间
	private String location;		// 库位
	private String amount;		// 数量
	private String updateperson;		// 经手人
	
	public CkwzChild2() {
		super();
	}

	public CkwzChild2(String id){
		super(id);
	}

	public CkwzChild2(CkwzMain testDataMain){
		this.testDataMain = testDataMain;
	}

	@Length(min=0, max=64, message="业务主表id长度必须介于 0 和 64 之间")
	public CkwzMain getTestDataMain() {
		return testDataMain;
	}

	public void setTestDataMain(CkwzMain testDataMain) {
		this.testDataMain = testDataMain;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getRemovetime() {
		return removetime;
	}

	public void setRemovetime(Date removetime) {
		this.removetime = removetime;
	}
	
	@Length(min=0, max=100, message="库位长度必须介于 0 和 100 之间")
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
	@Length(min=0, max=64, message="数量长度必须介于 0 和 64 之间")
	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}
	
	@Length(min=0, max=100, message="经手人长度必须介于 0 和 100 之间")
	public String getUpdateperson() {
		return updateperson;
	}

	public void setUpdateperson(String updateperson) {
		this.updateperson = updateperson;
	}
	
}