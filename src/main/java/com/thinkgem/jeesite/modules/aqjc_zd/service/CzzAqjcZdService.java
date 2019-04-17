/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqjc_zd.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.aqjc_zd.entity.CzzAqjcZd;
import com.thinkgem.jeesite.modules.aqjc_zd.dao.CzzAqjcZdDao;

/**
 * 安全检查制度Service
 * @author qyd
 * @version 2019-03-21
 */
@Service
@Transactional(readOnly = true)
public class CzzAqjcZdService extends CrudService<CzzAqjcZdDao, CzzAqjcZd> {

	public CzzAqjcZd get(String id) {
		return super.get(id);
	}
	
	public List<CzzAqjcZd> findList(CzzAqjcZd czzAqjcZd) {
		return super.findList(czzAqjcZd);
	}
	
	public Page<CzzAqjcZd> findPage(Page<CzzAqjcZd> page, CzzAqjcZd czzAqjcZd) {
		return super.findPage(page, czzAqjcZd);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzAqjcZd czzAqjcZd) {
		super.save(czzAqjcZd);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzAqjcZd czzAqjcZd) {
		super.delete(czzAqjcZd);
	}
	
}