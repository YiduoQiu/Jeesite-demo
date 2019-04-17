/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.yjyl.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 应急演练Entity
 * @author qyd
 * @version 2018-08-08
 */
public class CzzYjyl extends DataEntity<CzzYjyl> {
	
	private static final long serialVersionUID = 1L;
	private String ylType;		// 演练类型
	private String name;		// 标题
	private Date date;		// 时间
	private String location;		// 地点
	private String plan;		// 演练方案
	private String accident;		// 演练过程
	private String evaluate;		// 演练评估
	private String revise;		// 预案修订（处置方案）
	private String file;		// 附件
	
	public CzzYjyl() {
		super();
	}

	public CzzYjyl(String id){
		super(id);
	}

	@Length(min=0, max=1, message="演练类型长度必须介于 0 和 1 之间")
	public String getYlType() {
		return ylType;
	}

	public void setYlType(String ylType) {
		this.ylType = ylType;
	}
	
	@Length(min=0, max=200, message="标题长度必须介于 0 和 200 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	@Length(min=0, max=255, message="地点长度必须介于 0 和 255 之间")
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
	public String getPlan() {
		return plan;
	}

	public void setPlan(String plan) {
		this.plan = plan;
	}
	
	public String getAccident() {
		return accident;
	}

	public void setAccident(String accident) {
		this.accident = accident;
	}
	
	public String getEvaluate() {
		return evaluate;
	}

	public void setEvaluate(String evaluate) {
		this.evaluate = evaluate;
	}
	
	public String getRevise() {
		return revise;
	}

	public void setRevise(String revise) {
		this.revise = revise;
	}
	
	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}
	
}