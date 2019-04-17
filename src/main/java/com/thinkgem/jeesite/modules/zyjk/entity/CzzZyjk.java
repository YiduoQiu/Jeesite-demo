/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.zyjk.entity;

import org.hibernate.validator.constraints.Length;
import java.util.List;
import com.google.common.collect.Lists;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 职业健康Entity
 * @author qyd
 * @version 2018-12-17
 */
public class CzzZyjk extends DataEntity<CzzZyjk> {
	
	private static final long serialVersionUID = 1L;
	private String type;		// 职业危害类别
	private String person;		// 涉及人员名单
	private String harm;		// 危害登记
	private String onsitetest;		// 现场检测
	private String perprotect;		// 个人防护使用情况
	private String phycheck;		// 体检情况
	private String diseaseFlag;		// 有无职业病
	private String method;		// 处置方法
	private String file;		// 附件
	private List<CzzZyjkDt1> czzZyjkDt1List = Lists.newArrayList();		// 子表列表
	
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
	
	@Length(min=0, max=2000, message="涉及人员名单长度必须介于 0 和 2000 之间")
	public String getPerson() {
		return person;
	}

	public void setPerson(String person) {
		this.person = person;
	}
	
	public String getHarm() {
		return harm;
	}

	public void setHarm(String harm) {
		this.harm = harm;
	}
	
	public String getOnsitetest() {
		return onsitetest;
	}

	public void setOnsitetest(String onsitetest) {
		this.onsitetest = onsitetest;
	}
	
	public String getPerprotect() {
		return perprotect;
	}

	public void setPerprotect(String perprotect) {
		this.perprotect = perprotect;
	}
	
	public String getPhycheck() {
		return phycheck;
	}

	public void setPhycheck(String phycheck) {
		this.phycheck = phycheck;
	}
	
	@Length(min=0, max=1, message="有无职业病长度必须介于 0 和 1 之间")
	public String getDiseaseFlag() {
		return diseaseFlag;
	}

	public void setDiseaseFlag(String diseaseFlag) {
		this.diseaseFlag = diseaseFlag;
	}
	
	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}
	
	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}
	
	public List<CzzZyjkDt1> getCzzZyjkDt1List() {
		return czzZyjkDt1List;
	}

	public void setCzzZyjkDt1List(List<CzzZyjkDt1> czzZyjkDt1List) {
		this.czzZyjkDt1List = czzZyjkDt1List;
	}
}