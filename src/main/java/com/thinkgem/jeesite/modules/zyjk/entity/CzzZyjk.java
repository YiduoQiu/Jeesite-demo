/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.zyjk.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 职业健康Entity
 * @author qyd
 * @version 2018-07-04
 */
public class CzzZyjk extends DataEntity<CzzZyjk> {
	
	private static final long serialVersionUID = 1L;
	private String type;		// 职业危害类别
	private String person;		// 人员
	private String harm;		// 危害登记
	private String safety;		// 职安评价
	private String onsitetest;		// 现场检测
	private String phycheck;		// 体检情况
	private String diseaseFlag;		// 有无职业病标记（0：无；1：有）
	private String method;		// 处置方法
	private String file;		// 附件
	
	public CzzZyjk() {
		super();
	}

	public CzzZyjk(String id){
		super(id);
	}

	@Length(min=0, max=200, message="职业危害类别长度必须介于 0 和 200 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=255, message="人员长度必须介于 0 和 255 之间")
	public String getPerson() {
		return person;
	}

	public void setPerson(String person) {
		this.person = person;
	}
	
	@Length(min=0, max=2000, message="危害登记长度必须介于 0 和 2000 之间")
	public String getHarm() {
		return harm;
	}

	public void setHarm(String harm) {
		this.harm = harm;
	}
	
	@Length(min=0, max=2000, message="职安评价长度必须介于 0 和 2000 之间")
	public String getSafety() {
		return safety;
	}

	public void setSafety(String safety) {
		this.safety = safety;
	}
	
	@Length(min=0, max=2000, message="现场检测长度必须介于 0 和 2000 之间")
	public String getOnsitetest() {
		return onsitetest;
	}

	public void setOnsitetest(String onsitetest) {
		this.onsitetest = onsitetest;
	}
	
	@Length(min=0, max=2000, message="体检情况长度必须介于 0 和 2000 之间")
	public String getPhycheck() {
		return phycheck;
	}

	public void setPhycheck(String phycheck) {
		this.phycheck = phycheck;
	}
	
	@Length(min=0, max=1, message="有无职业病标记（0：无；1：有）长度必须介于 0 和 1 之间")
	public String getDiseaseFlag() {
		return diseaseFlag;
	}

	public void setDiseaseFlag(String diseaseFlag) {
		this.diseaseFlag = diseaseFlag;
	}
	
	@Length(min=0, max=2000, message="处置方法长度必须介于 0 和 2000 之间")
	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}
	
	@Length(min=0, max=100, message="附件长度必须介于 0 和 100 之间")
	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}
	
}