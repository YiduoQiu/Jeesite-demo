/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.yhpcys.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 隐患排查验收Entity
 * @author qyd
 * @version 2018-08-08
 */
public class CzzYhpcYs extends DataEntity<CzzYhpcYs> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 隐患名称
	private String yhType;		// 隐患类型（0：一般隐患，1：重大隐患）
	private Date date;		// 检查时间
	private String location;		// 地点
	private String responsible;		// 责任人
	private String problem;		// 存在问题
	private String requirements;		// 整改措施
	private Date deadline;		// 整改期限
	private String amount;		// 投入经费
	private String correctacction;		// 整改情况
	private String confirm;		// 确认人
	private String content1;		// 治理的目标和任务
	private String content2;		// 采取的方法和措施
	private Date confirmdate;		// 确认时间
	private String type;		// 整改状态
	private String content3;		// 经费和物资的落实
	private String content4;		// 负责治理的机构和人员
	private String file;		// 附件
	private String content5;		// 治理的时限和要求
	private String content6;		// 安全措施和应急预案
	private Date beginDate;		// 开始 检查时间
	private Date endDate;		// 结束 检查时间
	private Date beginConfirmdate;		// 开始 确认时间
	private Date endConfirmdate;		// 结束 确认时间
	
	public CzzYhpcYs() {
		super();
	}

	public CzzYhpcYs(String id){
		super(id);
	}

	@Length(min=0, max=200, message="隐患名称长度必须介于 0 和 200 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=1, message="隐患类型（0：一般隐患，1：重大隐患）长度必须介于 0 和 1 之间")
	public String getYhType() {
		return yhType;
	}

	public void setYhType(String yhType) {
		this.yhType = yhType;
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
	
	@Length(min=0, max=100, message="责任人长度必须介于 0 和 100 之间")
	public String getResponsible() {
		return responsible;
	}

	public void setResponsible(String responsible) {
		this.responsible = responsible;
	}
	
	@Length(min=0, max=2000, message="存在问题长度必须介于 0 和 2000 之间")
	public String getProblem() {
		return problem;
	}

	public void setProblem(String problem) {
		this.problem = problem;
	}
	
	@Length(min=0, max=2000, message="整改措施长度必须介于 0 和 2000 之间")
	public String getRequirements() {
		return requirements;
	}

	public void setRequirements(String requirements) {
		this.requirements = requirements;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	public Date getDeadline() {
		return deadline;
	}

	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
	
	@Length(min=0, max=100, message="投入经费长度必须介于 0 和 100 之间")
	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}
	
	@Length(min=0, max=2000, message="整改情况长度必须介于 0 和 2000 之间")
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
	
	@Length(min=0, max=2000, message="治理的目标和任务长度必须介于 0 和 2000 之间")
	public String getContent1() {
		return content1;
	}

	public void setContent1(String content1) {
		this.content1 = content1;
	}
	
	@Length(min=0, max=2000, message="采取的方法和措施长度必须介于 0 和 2000 之间")
	public String getContent2() {
		return content2;
	}

	public void setContent2(String content2) {
		this.content2 = content2;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getConfirmdate() {
		return confirmdate;
	}

	public void setConfirmdate(Date confirmdate) {
		this.confirmdate = confirmdate;
	}
	
	@Length(min=0, max=1, message="整改状态长度必须介于 0 和 1 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=2000, message="经费和物资的落实长度必须介于 0 和 2000 之间")
	public String getContent3() {
		return content3;
	}

	public void setContent3(String content3) {
		this.content3 = content3;
	}
	
	@Length(min=0, max=2000, message="负责治理的机构和人员长度必须介于 0 和 2000 之间")
	public String getContent4() {
		return content4;
	}

	public void setContent4(String content4) {
		this.content4 = content4;
	}
	
	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}
	
	@Length(min=0, max=2000, message="治理的时限和要求长度必须介于 0 和 2000 之间")
	public String getContent5() {
		return content5;
	}

	public void setContent5(String content5) {
		this.content5 = content5;
	}
	
	@Length(min=0, max=2000, message="安全措施和应急预案长度必须介于 0 和 2000 之间")
	public String getContent6() {
		return content6;
	}

	public void setContent6(String content6) {
		this.content6 = content6;
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
		
	public Date getBeginConfirmdate() {
		return beginConfirmdate;
	}

	public void setBeginConfirmdate(Date beginConfirmdate) {
		this.beginConfirmdate = beginConfirmdate;
	}
	
	public Date getEndConfirmdate() {
		return endConfirmdate;
	}

	public void setEndConfirmdate(Date endConfirmdate) {
		this.endConfirmdate = endConfirmdate;
	}
		
}