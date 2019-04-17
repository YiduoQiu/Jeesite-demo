/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.zyjk_pj.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.zyjk_pj.entity.CzzZyjkPj;
import com.thinkgem.jeesite.modules.zyjk_pj.dao.CzzZyjkPjDao;

/**
 * 职安评价Service
 * @author qyd
 * @version 2019-03-04
 */
@Service
@Transactional(readOnly = true)
public class CzzZyjkPjService extends CrudService<CzzZyjkPjDao, CzzZyjkPj> {

	public CzzZyjkPj get(String id) {
		return super.get(id);
	}
	
	public List<CzzZyjkPj> findList(CzzZyjkPj czzZyjkPj) {
		return super.findList(czzZyjkPj);
	}
	
	public Page<CzzZyjkPj> findPage(Page<CzzZyjkPj> page, CzzZyjkPj czzZyjkPj) {
		return super.findPage(page, czzZyjkPj);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzZyjkPj czzZyjkPj) {
		super.save(czzZyjkPj);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzZyjkPj czzZyjkPj) {
		super.delete(czzZyjkPj);
	}
	
}