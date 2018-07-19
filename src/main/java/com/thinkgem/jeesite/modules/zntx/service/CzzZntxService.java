/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.zntx.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.zntx.entity.CzzZntx;
import com.thinkgem.jeesite.modules.zntx.dao.CzzZntxDao;

/**
 * 智能提醒Service
 * @author qyd
 * @version 2018-07-18
 */
@Service
@Transactional(readOnly = true)
public class CzzZntxService extends CrudService<CzzZntxDao, CzzZntx> {

	public CzzZntx get(String id) {
		return super.get(id);
	}
	
	public List<CzzZntx> findList(CzzZntx czzZntx) {
		return super.findList(czzZntx);
	}
	
	public Page<CzzZntx> findPage(Page<CzzZntx> page, CzzZntx czzZntx) {
		return super.findPage(page, czzZntx);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzZntx czzZntx) {
		super.save(czzZntx);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzZntx czzZntx) {
		super.delete(czzZntx);
	}
/***************************
 * 函数名：智能提醒模块提醒对象
 * 功能：取得提醒对象信息
 * *************************/
	public List<CzzZntx> getYesObjects(CzzZntx czzZntx) {
		return super.findGoalData(czzZntx);
	}
	
}