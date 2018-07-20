/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.zyjk.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.zyjk.entity.CzzZyjk;
import com.thinkgem.jeesite.modules.zyjk.dao.CzzZyjkDao;

/**
 * 职业健康Service
 * @author qyd
 * @version 2018-07-20
 */
@Service
@Transactional(readOnly = true)
public class CzzZyjkService extends CrudService<CzzZyjkDao, CzzZyjk> {

	public CzzZyjk get(String id) {
		return super.get(id);
	}
	
	public List<CzzZyjk> findList(CzzZyjk czzZyjk) {
		return super.findList(czzZyjk);
	}
	
	public Page<CzzZyjk> findPage(Page<CzzZyjk> page, CzzZyjk czzZyjk) {
		return super.findPage(page, czzZyjk);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzZyjk czzZyjk) {
		super.save(czzZyjk);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzZyjk czzZyjk) {
		super.delete(czzZyjk);
	}
	
}