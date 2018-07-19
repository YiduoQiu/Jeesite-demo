/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wxygl.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.wxygl.entity.CzzWxygl;
import com.thinkgem.jeesite.modules.wxygl.dao.CzzWxyglDao;

/**
 * 危险源管理Service
 * @author qyd
 * @version 2018-07-04
 */
@Service
@Transactional(readOnly = true)
public class CzzWxyglService extends CrudService<CzzWxyglDao, CzzWxygl> {

	public CzzWxygl get(String id) {
		return super.get(id);
	}
	
	public List<CzzWxygl> findList(CzzWxygl czzWxygl) {
		return super.findList(czzWxygl);
	}
	
	public Page<CzzWxygl> findPage(Page<CzzWxygl> page, CzzWxygl czzWxygl) {
		return super.findPage(page, czzWxygl);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzWxygl czzWxygl) {
		super.save(czzWxygl);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzWxygl czzWxygl) {
		super.delete(czzWxygl);
	}
	
}