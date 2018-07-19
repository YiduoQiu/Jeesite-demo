/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqtr.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 安全投入Entity
 * @author qyd
 * @version 2018-07-09
 */
public class CzzAqtr extends DataEntity<CzzAqtr> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 标题
	private Date date;		// 制定时间
	private String amountGcjs;		// 安全技术措施工程建设
	private String amountGygx;		// 安全设备、设施、工艺更新和维护
	private String amountScxc;		// 安全生产宣传、教育、培训
	private String amountYhzg;		// 重大危险源监控和事故隐患整改
	private String amountFxbs;		// 安全生产风险辨识、评估和标准化建设
	private String amountLbyp;		// 劳动防护用品配备与更新
	private String amountXgytg;		// 安全生产新技术、新设备、新材料、新工艺的推广应用
	private String amountZrbx;		// 参加安全生产责任保险
	private String amountYjjs;		// 应急救援队伍建设、应急设备装备和救援物资配备及应急演练
	private String amountSczx;		// 聘请或委托第三方机构开展安全生产咨询、评价
	private String amountQt;		// 其他与安全生产直接相关的支出
	private Date beginDate;		// 开始 制定时间
	private Date endDate;		// 结束 制定时间
	
	public CzzAqtr() {
		super();
	}

	public CzzAqtr(String id){
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
	
	@Length(min=0, max=100, message="安全技术措施工程建设长度必须介于 0 和 100 之间")
	public String getAmountGcjs() {
		return amountGcjs;
	}

	public void setAmountGcjs(String amountGcjs) {
		this.amountGcjs = amountGcjs;
	}
	
	@Length(min=0, max=100, message="安全设备、设施、工艺更新和维护长度必须介于 0 和 100 之间")
	public String getAmountGygx() {
		return amountGygx;
	}

	public void setAmountGygx(String amountGygx) {
		this.amountGygx = amountGygx;
	}
	
	@Length(min=0, max=100, message="安全生产宣传、教育、培训长度必须介于 0 和 100 之间")
	public String getAmountScxc() {
		return amountScxc;
	}

	public void setAmountScxc(String amountScxc) {
		this.amountScxc = amountScxc;
	}
	
	@Length(min=0, max=100, message="重大危险源监控和事故隐患整改长度必须介于 0 和 100 之间")
	public String getAmountYhzg() {
		return amountYhzg;
	}

	public void setAmountYhzg(String amountYhzg) {
		this.amountYhzg = amountYhzg;
	}
	
	@Length(min=0, max=100, message="安全生产风险辨识、评估和标准化建设长度必须介于 0 和 100 之间")
	public String getAmountFxbs() {
		return amountFxbs;
	}

	public void setAmountFxbs(String amountFxbs) {
		this.amountFxbs = amountFxbs;
	}
	
	@Length(min=0, max=100, message="劳动防护用品配备与更新长度必须介于 0 和 100 之间")
	public String getAmountLbyp() {
		return amountLbyp;
	}

	public void setAmountLbyp(String amountLbyp) {
		this.amountLbyp = amountLbyp;
	}
	
	@Length(min=0, max=100, message="安全生产新技术、新设备、新材料、新工艺的推广应用长度必须介于 0 和 100 之间")
	public String getAmountXgytg() {
		return amountXgytg;
	}

	public void setAmountXgytg(String amountXgytg) {
		this.amountXgytg = amountXgytg;
	}
	
	@Length(min=0, max=100, message="参加安全生产责任保险长度必须介于 0 和 100 之间")
	public String getAmountZrbx() {
		return amountZrbx;
	}

	public void setAmountZrbx(String amountZrbx) {
		this.amountZrbx = amountZrbx;
	}
	
	@Length(min=0, max=100, message="应急救援队伍建设、应急设备装备和救援物资配备及应急演练长度必须介于 0 和 100 之间")
	public String getAmountYjjs() {
		return amountYjjs;
	}

	public void setAmountYjjs(String amountYjjs) {
		this.amountYjjs = amountYjjs;
	}
	
	@Length(min=0, max=100, message="聘请或委托第三方机构开展安全生产咨询、评价长度必须介于 0 和 100 之间")
	public String getAmountSczx() {
		return amountSczx;
	}

	public void setAmountSczx(String amountSczx) {
		this.amountSczx = amountSczx;
	}
	
	@Length(min=0, max=100, message="其他与安全生产直接相关的支出长度必须介于 0 和 100 之间")
	public String getAmountQt() {
		return amountQt;
	}

	public void setAmountQt(String amountQt) {
		this.amountQt = amountQt;
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