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
 * @version 2018-06-22
 */
public class CkwzMain extends DataEntity<CkwzMain> {
	
	private static final long serialVersionUID = 1L;
	private String productname;		// 品名
	private String amount;		// 数量
	private String type;		// 类型
	private String createperson;		// 创建者
	private Date inDate;		// 创建时间
	private Date beginInDate;		// 开始 创建时间
	private Date endInDate;		// 结束 创建时间
	private List<CkwzChild1> ckwzChild1List = Lists.newArrayList();		// 子表列表
	private List<CkwzChild2> ckwzChild2List = Lists.newArrayList();		// 子表列表
	
	public CkwzMain() {
		super();
	}

	public CkwzMain(String id){
		super(id);
	}

	@Length(min=0, max=100, message="品名长度必须介于 0 和 100 之间")
	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}
	
	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}
	
	@Length(min=0, max=64, message="类型长度必须介于 0 和 64 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=100, message="创建者长度必须介于 0 和 100 之间")
	public String getCreateperson() {
		return createperson;
	}

	public void setCreateperson(String createperson) {
		this.createperson = createperson;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getInDate() {
		return inDate;
	}

	public void setInDate(Date inDate) {
		this.inDate = inDate;
	}
	
	public Date getBeginInDate() {
		return beginInDate;
	}

	public void setBeginInDate(Date beginInDate) {
		this.beginInDate = beginInDate;
	}
	
	public Date getEndInDate() {
		return endInDate;
	}

	public void setEndInDate(Date endInDate) {
		this.endInDate = endInDate;
	}
		
	public List<CkwzChild1> getCkwzChild1List() {
		return ckwzChild1List;
	}

	public void setCkwzChild1List(List<CkwzChild1> ckwzChild1List) {
		this.ckwzChild1List = ckwzChild1List;
	}
	public List<CkwzChild2> getCkwzChild2List() {
		return ckwzChild2List;
	}

	public void setCkwzChild2List(List<CkwzChild2> ckwzChild2List) {
		this.ckwzChild2List = ckwzChild2List;
	}
}