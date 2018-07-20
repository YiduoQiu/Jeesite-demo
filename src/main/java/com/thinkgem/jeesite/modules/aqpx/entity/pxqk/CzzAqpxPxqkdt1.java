/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqpx.entity.pxqk;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 培训情况Entity
 * @author qyd
 * @version 2018-07-20
 */
public class CzzAqpxPxqkdt1 extends DataEntity<CzzAqpxPxqkdt1> {
	
	private static final long serialVersionUID = 1L;
	private CzzAqpxPxqk testDataMain;		// 业务主表ID 父类
	private Date date;		// 时间
	private String monday;		// 周一
	private String tuesday;		// 周二
	private String wednesday;		// 周三
	private String thursday;		// 周四
	private String friday;		// 周五
	private String saturday;		// 周六
	private String sunday;		// 周日
	
	public CzzAqpxPxqkdt1() {
		super();
	}

	public CzzAqpxPxqkdt1(String id){
		super(id);
	}

	public CzzAqpxPxqkdt1(CzzAqpxPxqk testDataMain){
		this.testDataMain = testDataMain;
	}

	@Length(min=1, max=64, message="业务主表ID长度必须介于 1 和 64 之间")
	public CzzAqpxPxqk getTestDataMain() {
		return testDataMain;
	}

	public void setTestDataMain(CzzAqpxPxqk testDataMain) {
		this.testDataMain = testDataMain;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	@Length(min=0, max=100, message="周一长度必须介于 0 和 100 之间")
	public String getMonday() {
		return monday;
	}

	public void setMonday(String monday) {
		this.monday = monday;
	}
	
	@Length(min=0, max=100, message="周二长度必须介于 0 和 100 之间")
	public String getTuesday() {
		return tuesday;
	}

	public void setTuesday(String tuesday) {
		this.tuesday = tuesday;
	}
	
	@Length(min=0, max=100, message="周三长度必须介于 0 和 100 之间")
	public String getWednesday() {
		return wednesday;
	}

	public void setWednesday(String wednesday) {
		this.wednesday = wednesday;
	}
	
	@Length(min=0, max=100, message="周四长度必须介于 0 和 100 之间")
	public String getThursday() {
		return thursday;
	}

	public void setThursday(String thursday) {
		this.thursday = thursday;
	}
	
	@Length(min=0, max=100, message="周五长度必须介于 0 和 100 之间")
	public String getFriday() {
		return friday;
	}

	public void setFriday(String friday) {
		this.friday = friday;
	}
	
	@Length(min=0, max=100, message="周六长度必须介于 0 和 100 之间")
	public String getSaturday() {
		return saturday;
	}

	public void setSaturday(String saturday) {
		this.saturday = saturday;
	}
	
	@Length(min=0, max=100, message="周日长度必须介于 0 和 100 之间")
	public String getSunday() {
		return sunday;
	}

	public void setSunday(String sunday) {
		this.sunday = sunday;
	}
	
}