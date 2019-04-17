/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wxygl_glzd.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.wxygl_glzd.entity.CzzWxyglZd;
import com.thinkgem.jeesite.modules.wxygl_glzd.dao.CzzWxyglZdDao;

/**
 * 管理制度Service
 * @author qyd
 * @version 2018-09-25
 */
@Service
@Transactional(readOnly = true)
public class CzzWxyglZdService extends CrudService<CzzWxyglZdDao, CzzWxyglZd> {

	public CzzWxyglZd get(String id) {
		return super.get(id);
	}
	
	public List<CzzWxyglZd> findList(CzzWxyglZd czzWxyglZd) {
		return super.findList(czzWxyglZd);
	}
	
	public Page<CzzWxyglZd> findPage(Page<CzzWxyglZd> page, CzzWxyglZd czzWxyglZd) {
		return super.findPage(page, czzWxyglZd);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzWxyglZd czzWxyglZd) {
		super.save(czzWxyglZd);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzWxyglZd czzWxyglZd) {
		super.delete(czzWxyglZd);
	}
	
}