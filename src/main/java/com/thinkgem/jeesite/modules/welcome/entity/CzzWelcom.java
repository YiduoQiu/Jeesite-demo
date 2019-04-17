/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.welcome.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 欢迎页面Entity
 * @author qyd
 * @version 2018-11-20
 */
public class CzzWelcom extends DataEntity<CzzWelcom> {
	
	private static final long serialVersionUID = 1L;
	private String organFlag;		// 是否建立生产安全管理机构标记（0：未设立；1：设立）
	private String responFlag;		// 是否制定安全生产职责标记（0：未明确；1：明确）
	private String ruleFlag;		// 是否建立安全生产责任制度标记（0：未设立；1：设立）
	private String certiFlag;		// 安全生产证书是否齐全标记（0：不齐全；1：齐全）
	private String commentFlag;		// 是否进行安全评价标记（0：不齐全；1：齐全）
	private String healthyFlag;		// 是否进行职业健康评价标记（0：不齐全；1：齐全）
	private String yjyaFlag;		// 是否建立应急预案标记（0：不齐全；1：齐全）
	private String mentionFlag;		// 是否再次提醒标记（空：提醒；1：不提醒）
	
	public CzzWelcom() {
		super();
	}

	public CzzWelcom(String id){
		super(id);
	}

	@Length(min=0, max=1, message="是否设立机构标记（0：未设立；1：设立）长度必须介于 0 和 1 之间")
	public String getOrganFlag() {
		return organFlag;
	}

	public void setOrganFlag(String organFlag) {
		this.organFlag = organFlag;
	}
	
	@Length(min=0, max=1, message="是否明确职责标记（0：未明确；1：明确）长度必须介于 0 和 1 之间")
	public String getResponFlag() {
		return responFlag;
	}

	public void setResponFlag(String responFlag) {
		this.responFlag = responFlag;
	}
	
	@Length(min=0, max=1, message="是否设立制度标记（0：未设立；1：设立）长度必须介于 0 和 1 之间")
	public String getRuleFlag() {
		return ruleFlag;
	}

	public void setRuleFlag(String ruleFlag) {
		this.ruleFlag = ruleFlag;
	}
	
	@Length(min=0, max=1, message="证书是否齐全标记（0：不齐全；1：齐全）长度必须介于 0 和 1 之间")
	public String getCertiFlag() {
		return certiFlag;
	}

	public void setCertiFlag(String certiFlag) {
		this.certiFlag = certiFlag;
	}
	
	public String getCommentFlag() {
		return commentFlag;
	}

	public void setCommentFlag(String commentFlag) {
		this.commentFlag = commentFlag;
	}

	public String getHealthyFlag() {
		return healthyFlag;
	}

	public void setHealthyFlag(String healthyFlag) {
		this.healthyFlag = healthyFlag;
	}

	public String getYjyaFlag() {
		return yjyaFlag;
	}

	public void setYjyaFlag(String yjyaFlag) {
		this.yjyaFlag = yjyaFlag;
	}

	@Length(min=0, max=1, message="是否再次提醒标记（空：提醒；1：不提醒）长度必须介于 0 和 1 之间")
	public String getMentionFlag() {
		return mentionFlag;
	}

	public void setMentionFlag(String mentionFlag) {
		this.mentionFlag = mentionFlag;
	}
	
}