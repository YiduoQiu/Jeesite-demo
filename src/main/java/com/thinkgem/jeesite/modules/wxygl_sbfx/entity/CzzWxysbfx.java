/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wxygl_sbfx.entity;

import org.hibernate.validator.constraints.Length;
import java.util.List;
import com.google.common.collect.Lists;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 重大危险源管理Entity
 * @author qyd
 * @version 2019-01-08
 */
public class CzzWxysbfx extends DataEntity<CzzWxysbfx> {
	
	private static final long serialVersionUID = 1L;
	private String wxyType;		// 危险源类型
	private String wxyKind;		// 危险源种类
	private String wxyName;		// 危险源单元名称
	private String amount;		// 数量
	private String location;		// 位置
	private String person;		// 管理人员
	private String plan;		// 管理方案
	private String file;		// 附件
	private List<CzzWxysbfxDt1> czzWxysbfxDt1List = Lists.newArrayList();		// 子表列表
	
	public CzzWxysbfx() {
		super();
	}

	public CzzWxysbfx(String id){
		super(id);
	}

	@Length(min=0, max=1, message="危险源类型长度必须介于 0 和 1 之间")
	public String getWxyType() {
		return wxyType;
	}

	public void setWxyType(String wxyType) {
		this.wxyType = wxyType;
	}
	
	@Length(min=0, max=1, message="危险源种类长度必须介于 0 和 1 之间")
	public String getWxyKind() {
		return wxyKind;
	}

	public void setWxyKind(String wxyKind) {
		this.wxyKind = wxyKind;
	}
	
	@Length(min=0, max=100, message="危险源单元名称长度必须介于 0 和 100 之间")
	public String getWxyName() {
		return wxyName;
	}

	public void setWxyName(String wxyName) {
		this.wxyName = wxyName;
	}
	
	@Length(min=0, max=100, message="数量长度必须介于 0 和 100 之间")
	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
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
	
	public String getPlan() {
		return plan;
	}

	public void setPlan(String plan) {
		this.plan = plan;
	}
	
	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}
	
	public List<CzzWxysbfxDt1> getCzzWxysbfxDt1List() {
		return czzWxysbfxDt1List;
	}

	public void setCzzWxysbfxDt1List(List<CzzWxysbfxDt1> czzWxysbfxDt1List) {
		this.czzWxysbfxDt1List = czzWxysbfxDt1List;
	}
}