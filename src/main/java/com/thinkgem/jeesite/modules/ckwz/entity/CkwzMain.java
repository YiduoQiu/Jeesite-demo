/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.ckwz.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.List;
import com.google.common.collect.Lists;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 仓库物资管理Entity
 * @author qyd
 * @version 2018-06-19
 */
public class CkwzMain extends DataEntity<CkwzMain> {
	
	private static final long serialVersionUID = 1L;
	private String type;		// 物资分类
	private String personname;		// 物资创建人
	private String amount;		// 数量（总计）
	private Date updatetime;		// 更新日期
	private Date beginUpdatetime;		// 开始 更新日期
	private Date endUpdatetime;		// 结束 更新日期
	private List<CkwzChild> ckwzChildList = Lists.newArrayList();		// 子表列表
	
	public CkwzMain() {
		super();
	}

	public CkwzMain(String id){
		super(id);
	}

	@Length(min=0, max=64, message="物资分类长度必须介于 0 和 64 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=64, message="物资创建人长度必须介于 0 和 64 之间")
	public String getPersonname() {
		return personname;
	}

	public void setPersonname(String personname) {
		this.personname = personname;
	}
	
	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}
	
	public Date getBeginUpdatetime() {
		return beginUpdatetime;
	}

	public void setBeginUpdatetime(Date beginUpdatetime) {
		this.beginUpdatetime = beginUpdatetime;
	}
	
	public Date getEndUpdatetime() {
		return endUpdatetime;
	}

	public void setEndUpdatetime(Date endUpdatetime) {
		this.endUpdatetime = endUpdatetime;
	}
		
	public List<CkwzChild> getCkwzChildList() {
		return ckwzChildList;
	}

	public void setCkwzChildList(List<CkwzChild> ckwzChildList) {
		this.ckwzChildList = ckwzChildList;
	}
}