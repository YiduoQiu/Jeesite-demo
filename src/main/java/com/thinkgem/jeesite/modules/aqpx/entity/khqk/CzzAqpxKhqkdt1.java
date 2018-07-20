/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqpx.entity.khqk;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 安全培训_考核情况Entity
 * @author qyd
 * @version 2018-07-20
 */
public class CzzAqpxKhqkdt1 extends DataEntity<CzzAqpxKhqkdt1> {
	
	private static final long serialVersionUID = 1L;
	private CzzAqpxKhqk testDataMain;		// 业务主表ID 父类
	private String name;		// 姓名
	private String subject;		// 科目
	private String grade;		// 考试成绩
	private String standard;		// 是否合格
	
	public CzzAqpxKhqkdt1() {
		super();
	}

	public CzzAqpxKhqkdt1(String id){
		super(id);
	}

	public CzzAqpxKhqkdt1(CzzAqpxKhqk testDataMain){
		this.testDataMain = testDataMain;
	}

	@Length(min=1, max=64, message="业务主表ID长度必须介于 1 和 64 之间")
	public CzzAqpxKhqk getTestDataMain() {
		return testDataMain;
	}

	public void setTestDataMain(CzzAqpxKhqk testDataMain) {
		this.testDataMain = testDataMain;
	}
	
	@Length(min=0, max=24, message="姓名长度必须介于 0 和 24 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=100, message="科目长度必须介于 0 和 100 之间")
	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	@Length(min=0, max=6, message="考试成绩长度必须介于 0 和 6 之间")
	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	@Length(min=0, max=1, message="是否合格长度必须介于 0 和 1 之间")
	public String getStandard() {
		return standard;
	}

	public void setStandard(String standard) {
		this.standard = standard;
	}
	
}