/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqsgbg_zd.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.aqsgbg_zd.entity.CzzAqsgbgZd;
import com.thinkgem.jeesite.modules.aqsgbg_zd.dao.CzzAqsgbgZdDao;

/**
 * 安全事故报告制度Service
 * @author qyd
 * @version 2019-03-21
 */
@Service
@Transactional(readOnly = true)
public class CzzAqsgbgZdService extends CrudService<CzzAqsgbgZdDao, CzzAqsgbgZd> {

	public CzzAqsgbgZd get(String id) {
		return super.get(id);
	}
	
	public List<CzzAqsgbgZd> findList(CzzAqsgbgZd czzAqsgbgZd) {
		return super.findList(czzAqsgbgZd);
	}
	
	public Page<CzzAqsgbgZd> findPage(Page<CzzAqsgbgZd> page, CzzAqsgbgZd czzAqsgbgZd) {
		return super.findPage(page, czzAqsgbgZd);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzAqsgbgZd czzAqsgbgZd) {
		super.save(czzAqsgbgZd);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzAqsgbgZd czzAqsgbgZd) {
		super.delete(czzAqsgbgZd);
	}
	
}