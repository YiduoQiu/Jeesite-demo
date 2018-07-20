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
 * @version 2018-07-20
 */
public class CzzYjyl extends DataEntity<CzzYjyl> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 标题
	private Date date;		// 时间
	private String location;		// 地点
	private String accident;		// 事故经过
	private String plan;		// 方案制定
	private String exercise;		// 现场演练
	private String situation;		// 处置情况
	private String evaluate;		// 评估
	private String revise;		// 修订
	private String file;		// 附件
	
	public CzzYjyl() {
		super();
	}

	public CzzYjyl(String id){
		super(id);
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
	
	@Length(min=0, max=2000, message="事故经过长度必须介于 0 和 2000 之间")
	public String getAccident() {
		return accident;
	}

	public void setAccident(String accident) {
		this.accident = accident;
	}
	
	@Length(min=0, max=2000, message="方案制定长度必须介于 0 和 2000 之间")
	public String getPlan() {
		return plan;
	}

	public void setPlan(String plan) {
		this.plan = plan;
	}
	
	@Length(min=0, max=2000, message="现场演练长度必须介于 0 和 2000 之间")
	public String getExercise() {
		return exercise;
	}

	public void setExercise(String exercise) {
		this.exercise = exercise;
	}
	
	@Length(min=0, max=2000, message="处置情况长度必须介于 0 和 2000 之间")
	public String getSituation() {
		return situation;
	}

	public void setSituation(String situation) {
		this.situation = situation;
	}
	
	@Length(min=0, max=2000, message="评估长度必须介于 0 和 2000 之间")
	public String getEvaluate() {
		return evaluate;
	}

	public void setEvaluate(String evaluate) {
		this.evaluate = evaluate;
	}
	
	@Length(min=0, max=255, message="修订长度必须介于 0 和 255 之间")
	public String getRevise() {
		return revise;
	}

	public void setRevise(String revise) {
		this.revise = revise;
	}
	
	@Length(min=0, max=100, message="附件长度必须介于 0 和 100 之间")
	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}
	
}