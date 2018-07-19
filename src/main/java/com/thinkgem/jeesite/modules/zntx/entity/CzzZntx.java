/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.zntx.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 智能提醒Entity
 * @author qyd
 * @version 2018-07-18
 */
public class CzzZntx extends DataEntity<CzzZntx> {
	
	private static final long serialVersionUID = 1L;
	private String type;		// 类型
	private String title;		// 标题
	private String content;		// 内容
	private String person;		// 接收人
	private String phone;		// 接收人电话
	private Date startDate;		// 开始日期
	private Date endDate;		// 结束日期
	private String intervaltime;		// 间隔时间
	private String intervalType;		// 间隔时间类型
	private Date lastDate;		// 上次发送日期
	private String remind;		// 是否提醒
	
	public CzzZntx() {
		super();
	}

	public CzzZntx(String id){
		super(id);
	}

	@Length(min=0, max=1, message="类型长度必须介于 0 和 1 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=100, message="标题长度必须介于 0 和 100 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=0, max=1000, message="内容长度必须介于 0 和 1000 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=64, message="接收人长度必须介于 0 和 64 之间")
	public String getPerson() {
		return person;
	}

	public void setPerson(String person) {
		this.person = person;
	}
	
	@Length(min=0, max=20, message="接收人电话长度必须介于 0 和 20 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	@Length(min=0, max=10, message="间隔时间长度必须介于 0 和 10 之间")
	public String getIntervaltime() {
		return intervaltime;
	}

	public void setIntervaltime(String intervaltime) {
		this.intervaltime = intervaltime;
	}
	
	@Length(min=0, max=1, message="间隔时间类型长度必须介于 0 和 1 之间")
	public String getIntervalType() {
		return intervalType;
	}

	public void setIntervalType(String intervalType) {
		this.intervalType = intervalType;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getLastDate() {
		return lastDate;
	}

	public void setLastDate(Date lastDate) {
		this.lastDate = lastDate;
	}
	
	@Length(min=0, max=1, message="是否提醒长度必须介于 0 和 1 之间")
	public String getRemind() {
		return remind;
	}

	public void setRemind(String remind) {
		this.remind = remind;
	}
	
}