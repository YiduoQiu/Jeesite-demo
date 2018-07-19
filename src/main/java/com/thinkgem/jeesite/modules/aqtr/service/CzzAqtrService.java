/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqtr.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.aqtr.entity.CzzAqtr;
import com.thinkgem.jeesite.modules.aqtr.dao.CzzAqtrDao;

/**
 * 安全投入Service
 * @author qyd
 * @version 2018-07-09
 */
@Service
@Transactional(readOnly = true)
public class CzzAqtrService extends CrudService<CzzAqtrDao, CzzAqtr> {

	public CzzAqtr get(String id) {
		return super.get(id);
	}
	
	public List<CzzAqtr> findList(CzzAqtr czzAqtr) {
		return super.findList(czzAqtr);
	}
	
	public Page<CzzAqtr> findPage(Page<CzzAqtr> page, CzzAqtr czzAqtr) {
		return super.findPage(page, czzAqtr);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzAqtr czzAqtr) {
		super.save(czzAqtr);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzAqtr czzAqtr) {
		super.delete(czzAqtr);
	}
	
}