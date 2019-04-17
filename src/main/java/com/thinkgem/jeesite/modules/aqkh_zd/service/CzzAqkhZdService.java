/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqkh_zd.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.aqkh_zd.entity.CzzAqkhZd;
import com.thinkgem.jeesite.modules.aqkh_zd.dao.CzzAqkhZdDao;

/**
 * 安全考核制度Service
 * @author qyd
 * @version 2019-03-21
 */
@Service
@Transactional(readOnly = true)
public class CzzAqkhZdService extends CrudService<CzzAqkhZdDao, CzzAqkhZd> {

	public CzzAqkhZd get(String id) {
		return super.get(id);
	}
	
	public List<CzzAqkhZd> findList(CzzAqkhZd czzAqkhZd) {
		return super.findList(czzAqkhZd);
	}
	
	public Page<CzzAqkhZd> findPage(Page<CzzAqkhZd> page, CzzAqkhZd czzAqkhZd) {
		return super.findPage(page, czzAqkhZd);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzAqkhZd czzAqkhZd) {
		super.save(czzAqkhZd);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzAqkhZd czzAqkhZd) {
		super.delete(czzAqkhZd);
	}
	
}