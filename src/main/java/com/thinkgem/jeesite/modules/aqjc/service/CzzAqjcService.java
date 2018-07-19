/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqjc.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.aqjc.entity.CzzAqjc;
import com.thinkgem.jeesite.modules.aqjc.dao.CzzAqjcDao;

/**
 * 安全检查Service
 * @author qyd
 * @version 2018-07-06
 */
@Service
@Transactional(readOnly = true)
public class CzzAqjcService extends CrudService<CzzAqjcDao, CzzAqjc> {

	public CzzAqjc get(String id) {
		return super.get(id);
	}
	
	public List<CzzAqjc> findList(CzzAqjc czzAqjc) {
		return super.findList(czzAqjc);
	}
	
	public Page<CzzAqjc> findPage(Page<CzzAqjc> page, CzzAqjc czzAqjc) {
		return super.findPage(page, czzAqjc);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzAqjc czzAqjc) {
		super.save(czzAqjc);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzAqjc czzAqjc) {
		super.delete(czzAqjc);
	}
	
}