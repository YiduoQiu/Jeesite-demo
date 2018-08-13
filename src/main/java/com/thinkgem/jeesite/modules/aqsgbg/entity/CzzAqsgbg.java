/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqsgbg.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * DROP TABLE IF EXISTS czz_aqsgbg;Entity
 * @author qyd
 * @version 2018-08-13
 */
public class CzzAqsgbg extends DataEntity<CzzAqsgbg> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 事故名称
	private String type;		// 事故性质
	private String content;		// 发生经过
	private String sgType;		// 上报状态
	private Date sbTime;		// 上报时间
	private String file;		// 附件
	
	public CzzAqsgbg() {
		super();
	}

	public CzzAqsgbg(String id){
		super(id);
	}

	@Length(min=0, max=100, message="事故名称长度必须介于 0 和 100 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=255, message="事故性质长度必须介于 0 和 255 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=3000, message="发生经过长度必须介于 0 和 3000 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=255, message="上报状态长度必须介于 0 和 255 之间")
	public String getSgType() {
		return sgType;
	}

	public void setSgType(String sgType) {
		this.sgType = sgType;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getSbTime() {
		return sbTime;
	}

	public void setSbTime(Date sbTime) {
		this.sbTime = sbTime;
	}
	
	@Length(min=0, max=100, message="附件长度必须介于 0 和 100 之间")
	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}
	
}