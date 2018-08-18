/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.awh.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 安委会Entity
 * @author qyd
 * @version 2018-08-18
 */
public class CzzAwhDt2 extends DataEntity<CzzAwhDt2> {
	
	private static final long serialVersionUID = 1L;
	private CzzAwh testDataMain;		// 业务主表ID 父类
	private String name;		// 姓名
	private String phone;		// 联系电话
	private String job;		// 分管工作
	private String post;		// 职务
	
	public CzzAwhDt2() {
		super();
	}

	public CzzAwhDt2(String id){
		super(id);
	}

	public CzzAwhDt2(CzzAwh testDataMain){
		this.testDataMain = testDataMain;
	}

	@Length(min=1, max=64, message="业务主表ID长度必须介于 1 和 64 之间")
	public CzzAwh getTestDataMain() {
		return testDataMain;
	}

	public void setTestDataMain(CzzAwh testDataMain) {
		this.testDataMain = testDataMain;
	}
	
	@Length(min=0, max=100, message="姓名长度必须介于 0 和 100 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=20, message="联系电话长度必须介于 0 和 20 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@Length(min=0, max=1000, message="分管工作长度必须介于 0 和 1000 之间")
	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}
	
	@Length(min=0, max=200, message="职务长度必须介于 0 和 200 之间")
	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}
	
}