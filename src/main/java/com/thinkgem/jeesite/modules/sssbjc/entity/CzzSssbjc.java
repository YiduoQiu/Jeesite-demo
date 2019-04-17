/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sssbjc.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 设施设备安全检查Entity
 * @author qyd
 * @version 2019-03-07
 */
public class CzzSssbjc extends DataEntity<CzzSssbjc> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 设备名称
	private Date date;		// 时间
	private String location;		// 地点
	private String checkcontent;		// 检修内容
	private String relatedPer;		// 责任人签字
	private String file;		// 附件
	private String aqType;		// 设施设备安全状态（0：优，1：良，2：差）
	
	public CzzSssbjc() {
		super();
	}

	public CzzSssbjc(String id){
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
	
	@Length(min=0, max=255, message="地点长度必须介于 0 和 255 之间")
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
	public String getCheckcontent() {
		return checkcontent;
	}

	public void setCheckcontent(String checkcontent) {
		this.checkcontent = checkcontent;
	}
	
	@Length(min=0, max=255, message="责任人签字长度必须介于 0 和 255 之间")
	public String getRelatedPer() {
		return relatedPer;
	}

	public void setRelatedPer(String relatedPer) {
		this.relatedPer = relatedPer;
	}
	
	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}
	
	@Length(min=0, max=1, message="设施设备安全状态（0：优，1：良，2：差）长度必须介于 0 和 1 之间")
	public String getAqType() {
		return aqType;
	}

	public void setAqType(String aqType) {
		this.aqType = aqType;
	}
	
}