/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqtrzj_zd.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.aqtrzj_zd.entity.CzzAqtrZd;
import com.thinkgem.jeesite.modules.aqtrzj_zd.dao.CzzAqtrZdDao;

/**
 * 安全生产投入资金管理制度Service
 * @author qyd
 * @version 2019-03-21
 */
@Service
@Transactional(readOnly = true)
public class CzzAqtrZdService extends CrudService<CzzAqtrZdDao, CzzAqtrZd> {

	public CzzAqtrZd get(String id) {
		return super.get(id);
	}
	
	public List<CzzAqtrZd> findList(CzzAqtrZd czzAqtrZd) {
		return super.findList(czzAqtrZd);
	}
	
	public Page<CzzAqtrZd> findPage(Page<CzzAqtrZd> page, CzzAqtrZd czzAqtrZd) {
		return super.findPage(page, czzAqtrZd);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzAqtrZd czzAqtrZd) {
		super.save(czzAqtrZd);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzAqtrZd czzAqtrZd) {
		super.delete(czzAqtrZd);
	}
	
}