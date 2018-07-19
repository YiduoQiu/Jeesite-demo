/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.yjjy.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 应急救援Entity
 * @author qyd
 * @version 2018-07-04
 */
public class CzzYjjy extends DataEntity<CzzYjjy> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 标题
	private String plan;		// 岗位处置方案
	private String specialplan;		// 专项预案
	private String comprehensiveplan;		// 综合预案
	private String file;		// 附件
	
	public CzzYjjy() {
		super();
	}

	public CzzYjjy(String id){
		super(id);
	}

	@Length(min=0, max=100, message="标题长度必须介于 0 和 100 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=0, max=2000, message="岗位处置方案长度必须介于 0 和 2000 之间")
	public String getPlan() {
		return plan;
	}

	public void setPlan(String plan) {
		this.plan = plan;
	}
	
	@Length(min=0, max=2000, message="专项预案长度必须介于 0 和 2000 之间")
	public String getSpecialplan() {
		return specialplan;
	}

	public void setSpecialplan(String specialplan) {
		this.specialplan = specialplan;
	}
	
	@Length(min=0, max=2000, message="综合预案长度必须介于 0 和 2000 之间")
	public String getComprehensiveplan() {
		return comprehensiveplan;
	}

	public void setComprehensiveplan(String comprehensiveplan) {
		this.comprehensiveplan = comprehensiveplan;
	}
	
	@Length(min=0, max=100, message="附件长度必须介于 0 和 100 之间")
	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}
	
}