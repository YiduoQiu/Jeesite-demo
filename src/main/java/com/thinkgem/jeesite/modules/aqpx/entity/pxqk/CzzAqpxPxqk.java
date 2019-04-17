/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqpx.entity.pxqk;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.List;
import com.google.common.collect.Lists;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 培训情况Entity
 * @author qyd
 * @version 2018-07-20
 */
public class CzzAqpxPxqk extends DataEntity<CzzAqpxPxqk> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 标题
	private Date date;		// 时间
	private String location;		// 地点
	private String content;		// 培训内容
	private String file;		// 附件
	private List<CzzAqpxPxqkdt1> czzAqpxPxqkdt1List = Lists.newArrayList();		// 子表列表
	
	public CzzAqpxPxqk() {
		super();
	}

	public CzzAqpxPxqk(String id){
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
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}
	
	public List<CzzAqpxPxqkdt1> getCzzAqpxPxqkdt1List() {
		return czzAqpxPxqkdt1List;
	}

	public void setCzzAqpxPxqkdt1List(List<CzzAqpxPxqkdt1> czzAqpxPxqkdt1List) {
		this.czzAqpxPxqkdt1List = czzAqpxPxqkdt1List;
	}
}