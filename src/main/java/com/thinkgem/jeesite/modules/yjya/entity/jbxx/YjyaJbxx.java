/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.yjya.entity.jbxx;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 应急预案_基本信息表生成Entity
 * @author qyd
 * @version 2018-06-15
 */
public class YjyaJbxx extends DataEntity<YjyaJbxx> {
	
	private static final long serialVersionUID = 1L;
	private String comorganization;		// 指挥机构
	private String username;		// 姓名
	private String response;		// 职责
	private String telephone;		// 电话
	private String yjyaPlan;		// 应急预案
	
	public YjyaJbxx() {
		super();
	}

	public YjyaJbxx(String id){
		super(id);
	}

	@Length(min=0, max=3000, message="指挥机构长度必须介于 0 和 3000 之间")
	public String getComorganization() {
		return comorganization;
	}

	public void setComorganization(String comorganization) {
		this.comorganization = comorganization;
	}
	
	@Length(min=0, max=64, message="姓名长度必须介于 0 和 64 之间")
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	@Length(min=0, max=64, message="职责长度必须介于 0 和 64 之间")
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
	
	@Length(min=0, max=3333, message="应急预案长度必须介于 0 和 3333 之间")
	public String getYjyaPlan() {
		return yjyaPlan;
	}

	public void setYjyaPlan(String yjyaPlan) {
		this.yjyaPlan = yjyaPlan;
	}
	
}