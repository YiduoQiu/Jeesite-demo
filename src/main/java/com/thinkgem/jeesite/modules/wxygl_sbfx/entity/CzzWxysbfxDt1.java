/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wxygl_sbfx.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 重大危险源管理Entity
 * @author qyd
 * @version 2019-01-08
 */
public class CzzWxysbfxDt1 extends DataEntity<CzzWxysbfxDt1> {
	
	private static final long serialVersionUID = 1L;
	private CzzWxysbfx testDataMain;		// 业务主表ID 父类
	private String name;		// 危险物质
	private String amountMax;		// 最大数量（吨）
	private String amountCri;		// 相对应的临界量（吨）
	private String aqr;		// 辨识指标AQR（最大数量/临界量）
	
	public CzzWxysbfxDt1() {
		super();
	}

	public CzzWxysbfxDt1(String id){
		super(id);
	}

	public CzzWxysbfxDt1(CzzWxysbfx testDataMain){
		this.testDataMain = testDataMain;
	}

	@Length(min=0, max=64, message="业务主表ID长度必须介于 0 和 64 之间")
	public CzzWxysbfx getTestDataMain() {
		return testDataMain;
	}

	public void setTestDataMain(CzzWxysbfx testDataMain) {
		this.testDataMain = testDataMain;
	}
	
	@Length(min=0, max=100, message="危险物质长度必须介于 0 和 100 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getAmountMax() {
		return amountMax;
	}

	public void setAmountMax(String amountMax) {
		this.amountMax = amountMax;
	}
	
	public String getAmountCri() {
		return amountCri;
	}

	public void setAmountCri(String amountCri) {
		this.amountCri = amountCri;
	}
	
	public String getAqr() {
		return aqr;
	}

	public void setAqr(String aqr) {
		this.aqr = aqr;
	}
	
}