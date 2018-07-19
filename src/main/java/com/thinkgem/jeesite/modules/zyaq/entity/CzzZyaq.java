/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.zyaq.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 作业安全Entity
 * @author qyd
 * @version 2018-07-17
 */
public class CzzZyaq extends DataEntity<CzzZyaq> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 作业名称
	private Date date;		// 时间
	private String location;		// 地点
	private String zyPerson;		// 作业人员
	private String jhPerson;		// 监护人员
	private String task;		// 安全作业方案
	private String performance;		// 实施情况
	private String file;		// 附件
	
	public CzzZyaq() {
		super();
	}

	public CzzZyaq(String id){
		super(id);
	}

	@Length(min=0, max=200, message="作业名称长度必须介于 0 和 200 之间")
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
	
	@Length(min=0, max=255, message="作业人员长度必须介于 0 和 255 之间")
	public String getZyPerson() {
		return zyPerson;
	}

	public void setZyPerson(String zyPerson) {
		this.zyPerson = zyPerson;
	}
	
	@Length(min=0, max=255, message="监护人员长度必须介于 0 和 255 之间")
	public String getJhPerson() {
		return jhPerson;
	}

	public void setJhPerson(String jhPerson) {
		this.jhPerson = jhPerson;
	}
	
	@Length(min=0, max=2000, message="安全作业方案长度必须介于 0 和 2000 之间")
	public String getTask() {
		return task;
	}

	public void setTask(String task) {
		this.task = task;
	}
	
	@Length(min=0, max=2000, message="实施情况长度必须介于 0 和 2000 之间")
	public String getPerformance() {
		return performance;
	}

	public void setPerformance(String performance) {
		this.performance = performance;
	}
	
	@Length(min=0, max=100, message="附件长度必须介于 0 和 100 之间")
	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}
	
}