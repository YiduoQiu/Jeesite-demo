/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sssbtz.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 设施设备台账Entity
 * @author qyd
 * @version 2018-09-17
 */
public class CzzSssbjcTz extends DataEntity<CzzSssbjcTz> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 设备名称
	private Date date;		// 上次检查时间
	private String location;		// 设备地点
	private String situation;		// 检测、检修、保养情况
	private String bzFlag;		// 有无设备安全警示标志
	private String aqType;		// 设施设备完好状况
	private String file;		// 附件
	
	public CzzSssbjcTz() {
		super();
	}

	public CzzSssbjcTz(String id){
		super(id);
	}

	@Length(min=0, max=200, message="设备名称长度必须介于 0 和 200 之间")
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
	
	@Length(min=0, max=1000, message="设备地点长度必须介于 0 和 1000 之间")
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
	public String getSituation() {
		return situation;
	}

	public void setSituation(String situation) {
		this.situation = situation;
	}
	
	@Length(min=0, max=1, message="有无设备安全警示标志长度必须介于 0 和 1 之间")
	public String getBzFlag() {
		return bzFlag;
	}

	public void setBzFlag(String bzFlag) {
		this.bzFlag = bzFlag;
	}
	
	@Length(min=0, max=1, message="设施设备完好状况长度必须介于 0 和 1 之间")
	public String getAqType() {
		return aqType;
	}

	public void setAqType(String aqType) {
		this.aqType = aqType;
	}
	
	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}
	
}