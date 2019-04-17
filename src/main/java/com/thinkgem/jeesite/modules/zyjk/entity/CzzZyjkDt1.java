/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.zyjk.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 职业健康Entity
 * @author qyd
 * @version 2018-12-17
 */
public class CzzZyjkDt1 extends DataEntity<CzzZyjkDt1> {
	
	private static final long serialVersionUID = 1L;
	private CzzZyjk testDataMain;		// 业务主表ID 父类
	private String name;		// 个体防护装备
	private String account;		// 数量
	
	public CzzZyjkDt1() {
		super();
	}

	public CzzZyjkDt1(String id){
		super(id);
	}

	public CzzZyjkDt1(CzzZyjk testDataMain){
		this.testDataMain = testDataMain;
	}

	public CzzZyjk getTestDataMain() {
		return testDataMain;
	}

	public void setTestDataMain(CzzZyjk testDataMain) {
		this.testDataMain = testDataMain;
	}
	
	@Length(min=0, max=200, message="个体防护装备长度必须介于 0 和 200 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}
	
}