/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sjcx.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.aqjc.entity.CzzAqjc;
import com.thinkgem.jeesite.modules.sjcx.dao.CzzSjcxDao;
import com.thinkgem.jeesite.modules.sjcx.entity.CzzSjcx;

/**
 * 安全检查Service
 * @author qyd
 * @version 2018-07-06
 */
@Service
@Transactional(readOnly = true)
public class CzzSjcxService extends CrudService<CzzSjcxDao, CzzSjcx> {
//统计报表用	
	public int countzx00(CzzSjcx czzSjcx) {
		return super.firstCount(czzSjcx);
	}
	public int countzx01(CzzSjcx czzSjcx) {
		return super.secondCount(czzSjcx);
	}
	public int countqm10(CzzSjcx czzSjcx) {
		return super.thirdCount(czzSjcx);
	}
	public int countqm11(CzzSjcx czzSjcx) {
		return super.fourthCount(czzSjcx);
	}
	public int countqm20(CzzSjcx czzSjcx) {
		return super.fifthCount(czzSjcx);
	}
	public int countqm21(CzzSjcx czzSjcx) {
		return super.sixthCount(czzSjcx);
	}
	public int countqm30(CzzSjcx czzSjcx) {
		return super.seventhCount(czzSjcx);
	}
	public int countqm31(CzzSjcx czzSjcx) {
		return super.eightCount(czzSjcx);
	}
	public int countqm40(CzzSjcx czzSjcx) {
		return super.nineCount(czzSjcx);
	}
	public int countqm41(CzzSjcx czzSjcx) {
		return super.tenCount(czzSjcx);
	}
}