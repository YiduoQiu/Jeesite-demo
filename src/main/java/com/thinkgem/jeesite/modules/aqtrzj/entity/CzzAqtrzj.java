package com.thinkgem.jeesite.modules.aqtrzj.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.List;
import com.google.common.collect.Lists;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 安全投入资金计划Entity
 * @author qyd
 * @version 2018-08-27
 */
public class CzzAqtrzj extends DataEntity<CzzAqtrzj> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 标题
	private Date date;		// 制定时间
	private List<CzzAqtrzjDt1> czzAqtrzjDt1List = Lists.newArrayList();		// 子表列表
	
	public CzzAqtrzj() {
		super();
	}

	public CzzAqtrzj(String id){
		super(id);
	}

	@Length(min=0, max=1000, message="标题长度必须介于 0 和 1000 之间")
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
	
	public List<CzzAqtrzjDt1> getCzzAqtrzjDt1List() {
		return czzAqtrzjDt1List;
	}

	public void setCzzAqtrzjDt1List(List<CzzAqtrzjDt1> czzAqtrzjDt1List) {
		this.czzAqtrzjDt1List = czzAqtrzjDt1List;
	}
}