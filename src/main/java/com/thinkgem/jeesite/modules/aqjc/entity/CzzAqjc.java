/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqjc.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.aqpx.entity.pxqk.CzzAqpxPxqkdt1;

/**
 * 安全检查Entity
 * @author qyd
 * @version 2018-07-06
 */
public class CzzAqjc extends DataEntity<CzzAqjc> {
	
	private static final long serialVersionUID = 1L;
	private String checkType;		// 检查类型
	private String name;		// 标题
	private Date date;		// 时间
	private String location;		// 地点
	private String extent;		// 范围
	private String responsible;		// 负责人
	private String participate;		// 参加人员
	private String checkcontent;		// 检查内容
	private String problem;		// 存在问题
	private String requirements;		// 整改要求
	private Date deadline;		// 整改期限
	private String type;		// 整改状态
	private String correctacction;		// 整改情况
	private String confirm;		// 确认人
	private Date confirmdate;		// 确认时间
	private String file;		// 附件
	private Date beginDate;		// 开始 时间
	private Date endDate;		// 结束 时间
	
	public CzzAqjc() {
		super();
	}

	public CzzAqjc(String id){
		super(id);
	}

	@Length(min=0, max=1, message="检查类型长度必须介于 0 和 1 之间")
	public String getCheckType() {
		return checkType;
	}

	public void setCheckType(String checkType) {
		this.checkType = checkType;
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
	
	@Length(min=0, max=2000, message="范围长度必须介于 0 和 2000 之间")
	public String getExtent() {
		return extent;
	}

	public void setExtent(String extent) {
		this.extent = extent;
	}
	
	@Length(min=0, max=100, message="负责人长度必须介于 0 和 100 之间")
	public String getResponsible() {
		return responsible;
	}

	public void setResponsible(String responsible) {
		this.responsible = responsible;
	}
	
	@Length(min=0, max=100, message="参加人员长度必须介于 0 和 100 之间")
	public String getParticipate() {
		return participate;
	}

	public void setParticipate(String participate) {
		this.participate = participate;
	}
	
	public String getCheckcontent() {
		return checkcontent;
	}

	public void setCheckcontent(String checkcontent) {
		this.checkcontent = checkcontent;
	}
	
	public String getProblem() {
		return problem;
	}

	public void setProblem(String problem) {
		this.problem = problem;
	}
	
	public String getRequirements() {
		return requirements;
	}

	public void setRequirements(String requirements) {
		this.requirements = requirements;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getDeadline() {
		return deadline;
	}

	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
	
	@Length(min=0, max=1, message="整改状态长度必须介于 0 和 1 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public String getCorrectacction() {
		return correctacction;
	}

	public void setCorrectacction(String correctacction) {
		this.correctacction = correctacction;
	}
	
	@Length(min=0, max=100, message="确认人长度必须介于 0 和 100 之间")
	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getConfirmdate() {
		return confirmdate;
	}

	public void setConfirmdate(Date confirmdate) {
		this.confirmdate = confirmdate;
	}
	
	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}
	
	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}
	
	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
		
}