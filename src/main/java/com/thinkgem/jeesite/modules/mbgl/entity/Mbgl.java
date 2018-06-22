/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.mbgl.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 目标管理Entity
 * @author qyd
 * @version 2018-06-22
 */
public class Mbgl extends DataEntity<Mbgl> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 标题
	private String username;		// 姓名
	private String response;		// 岗位
	private String telephone;		// 电话
	private String plan;		// 任务目标
	private String file;		// 附件
	
	public Mbgl() {
		super();
	}

	public Mbgl(String id){
		super(id);
	}

	@Length(min=0, max=100, message="标题长度必须介于 0 和 100 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=0, max=64, message="姓名长度必须介于 0 和 64 之间")
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	@Length(min=0, max=64, message="岗位长度必须介于 0 和 64 之间")
	public String getResponse() {
		return response;
	}

	public void setResponse(String response) {
		this.response = response;
	}
	
	@Length(min=0, max=20, message="电话长度必须介于 0 和 20 之间")
	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	
	@Length(min=0, max=3333, message="任务目标长度必须介于 0 和 3333 之间")
	public String getPlan() {
		return plan;
	}

	public void setPlan(String plan) {
		this.plan = plan;
	}
	
	@Length(min=0, max=1000, message="附件长度必须介于 0 和 1000 之间")
	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}
	
}