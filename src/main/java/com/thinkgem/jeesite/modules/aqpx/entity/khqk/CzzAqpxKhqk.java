/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqpx.entity.khqk;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.List;
import com.google.common.collect.Lists;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 安全培训_考核情况Entity
 * @author qyd
 * @version 2018-07-20
 */
public class CzzAqpxKhqk extends DataEntity<CzzAqpxKhqk> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 标题
	private Date date;		// 时间
	private String location;		// 地点
	private String content;		// 考场情况
	private String file;		// 上传现场图片
	private List<CzzAqpxKhqkdt1> czzAqpxKhqkdt1List = Lists.newArrayList();		// 子表列表
	
	public CzzAqpxKhqk() {
		super();
	}

	public CzzAqpxKhqk(String id){
		super(id);
	}

	@Length(min=0, max=100, message="标题长度必须介于 0 和 100 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	@Length(min=0, max=100, message="地点长度必须介于 0 和 100 之间")
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
	@Length(min=0, max=3000, message="考场情况长度必须介于 0 和 3000 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=100, message="上传现场图片长度必须介于 0 和 100 之间")
	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}
	
	public List<CzzAqpxKhqkdt1> getCzzAqpxKhqkdt1List() {
		return czzAqpxKhqkdt1List;
	}

	public void setCzzAqpxKhqkdt1List(List<CzzAqpxKhqkdt1> czzAqpxKhqkdt1List) {
		this.czzAqpxKhqkdt1List = czzAqpxKhqkdt1List;
	}
}