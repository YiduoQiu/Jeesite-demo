/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.awh.entity;

import org.hibernate.validator.constraints.Length;
import java.util.List;
import com.google.common.collect.Lists;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 安委会Entity
 * @author qyd
 * @version 2018-08-08
 */
public class CzzAwh extends DataEntity<CzzAwh> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 姓名
	private String phone;		// 联系电话
	private String job;		// 分管工作
	private String post;		// 职务
	private String file;		// 附件
	private List<CzzAwhDt1> czzAwhDt1List = Lists.newArrayList();		// 子表列表
	private List<CzzAwhDt2> czzAwhDt2List = Lists.newArrayList();		// 子表列表
	
	public CzzAwh() {
		super();
	}

	public CzzAwh(String id){
		super(id);
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
	
	@Length(min=0, max=100, message="附件长度必须介于 0 和 100 之间")
	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}
	
	public List<CzzAwhDt1> getCzzAwhDt1List() {
		return czzAwhDt1List;
	}

	public void setCzzAwhDt1List(List<CzzAwhDt1> czzAwhDt1List) {
		this.czzAwhDt1List = czzAwhDt1List;
	}
	public List<CzzAwhDt2> getCzzAwhDt2List() {
		return czzAwhDt2List;
	}

	public void setCzzAwhDt2List(List<CzzAwhDt2> czzAwhDt2List) {
		this.czzAwhDt2List = czzAwhDt2List;
	}
}