/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sjcx.entity;
import java.util.Date;
import com.thinkgem.jeesite.common.persistence.DataEntity;
/**
 * 安全检查Entity
 * @author qyd
 * @version 2018-07-06
 */
public class CzzSjcx extends DataEntity<CzzSjcx> {
	
	private static final long serialVersionUID = 1L;
	private int count;		// 开始 时间
	private Date beginDate;		// 开始 时间
	private Date endDate;		// 结束 时间
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}
	
	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
		
}