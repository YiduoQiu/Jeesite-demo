package com.thinkgem.jeesite.modules.aqtrzj.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 安全投入资金计划Entity
 * @author qyd
 * @version 2018-08-27
 */
public class CzzAqtrzjDt1 extends DataEntity<CzzAqtrzjDt1> {
	
	private static final long serialVersionUID = 1L;
	private CzzAqtrzj testDataMain;		// 业务主表ID 父类
	private String amountTitle;		// 资金类目
	private String amountJanuray;		// 一月份
	private String amountFebruary;		// 二月份
	private String amountMarch;		// 三月份
	private String amountApril;		// 四月份
	private String amountMay;		// 五月份
	private String amountJune;		// 六月份
	private String amountJuly;		// 七月份
	private String amountAugust;		// 八月份
	private String amountSeptember;		// 九月份
	private String amountOctober;		// 十月份
	private String amountNovember;		// 十一月份
	private String amountDecember;		// 十二月份
	private String amountYear;		// 年度合计
	
	public CzzAqtrzjDt1() {
		super();
	}

	public CzzAqtrzjDt1(String id){
		super(id);
	}

	public CzzAqtrzjDt1(CzzAqtrzj testDataMain){
		this.testDataMain = testDataMain;
	}

	@Length(min=0, max=64, message="业务主表ID长度必须介于 0 和 64 之间")
	public CzzAqtrzj getTestDataMain() {
		return testDataMain;
	}

	public void setTestDataMain(CzzAqtrzj testDataMain) {
		this.testDataMain = testDataMain;
	}
	
	@Length(min=0, max=100, message="资金类目长度必须介于 0 和 100 之间")
	public String getAmountTitle() {
		return amountTitle;
	}

	public void setAmountTitle(String amountTitle) {
		this.amountTitle = amountTitle;
	}
	
	@Length(min=0, max=100, message="一月份长度必须介于 0 和 100 之间")
	public String getAmountJanuray() {
		return amountJanuray;
	}

	public void setAmountJanuray(String amountJanuray) {
		this.amountJanuray = amountJanuray;
	}
	
	@Length(min=0, max=100, message="二月份长度必须介于 0 和 100 之间")
	public String getAmountFebruary() {
		return amountFebruary;
	}

	public void setAmountFebruary(String amountFebruary) {
		this.amountFebruary = amountFebruary;
	}
	
	@Length(min=0, max=100, message="三月份长度必须介于 0 和 100 之间")
	public String getAmountMarch() {
		return amountMarch;
	}

	public void setAmountMarch(String amountMarch) {
		this.amountMarch = amountMarch;
	}
	
	@Length(min=0, max=100, message="四月份长度必须介于 0 和 100 之间")
	public String getAmountApril() {
		return amountApril;
	}

	public void setAmountApril(String amountApril) {
		this.amountApril = amountApril;
	}
	
	@Length(min=0, max=100, message="五月份长度必须介于 0 和 100 之间")
	public String getAmountMay() {
		return amountMay;
	}

	public void setAmountMay(String amountMay) {
		this.amountMay = amountMay;
	}
	
	@Length(min=0, max=100, message="六月份长度必须介于 0 和 100 之间")
	public String getAmountJune() {
		return amountJune;
	}

	public void setAmountJune(String amountJune) {
		this.amountJune = amountJune;
	}
	
	@Length(min=0, max=100, message="七月份长度必须介于 0 和 100 之间")
	public String getAmountJuly() {
		return amountJuly;
	}

	public void setAmountJuly(String amountJuly) {
		this.amountJuly = amountJuly;
	}
	
	@Length(min=0, max=100, message="八月份长度必须介于 0 和 100 之间")
	public String getAmountAugust() {
		return amountAugust;
	}

	public void setAmountAugust(String amountAugust) {
		this.amountAugust = amountAugust;
	}
	
	@Length(min=0, max=100, message="九月份长度必须介于 0 和 100 之间")
	public String getAmountSeptember() {
		return amountSeptember;
	}

	public void setAmountSeptember(String amountSeptember) {
		this.amountSeptember = amountSeptember;
	}
	
	@Length(min=0, max=100, message="十月份长度必须介于 0 和 100 之间")
	public String getAmountOctober() {
		return amountOctober;
	}

	public void setAmountOctober(String amountOctober) {
		this.amountOctober = amountOctober;
	}
	
	@Length(min=0, max=100, message="十一月份长度必须介于 0 和 100 之间")
	public String getAmountNovember() {
		return amountNovember;
	}

	public void setAmountNovember(String amountNovember) {
		this.amountNovember = amountNovember;
	}
	
	@Length(min=0, max=100, message="十二月份长度必须介于 0 和 100 之间")
	public String getAmountDecember() {
		return amountDecember;
	}

	public void setAmountDecember(String amountDecember) {
		this.amountDecember = amountDecember;
	}
	
	@Length(min=0, max=100, message="年度合计长度必须介于 0 和 100 之间")
	public String getAmountYear() {
		return amountYear;
	}

	public void setAmountYear(String amountYear) {
		this.amountYear = amountYear;
	}
	
}