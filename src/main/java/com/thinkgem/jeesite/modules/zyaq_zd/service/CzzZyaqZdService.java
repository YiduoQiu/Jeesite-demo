/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.zyaq_zd.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.zyaq_zd.entity.CzzZyaqZd;
import com.thinkgem.jeesite.modules.zyaq_zd.dao.CzzZyaqZdDao;

/**
 * 作业安全制度Service
 * @author qyd
 * @version 2019-03-20
 */
@Service
@Transactional(readOnly = true)
public class CzzZyaqZdService extends CrudService<CzzZyaqZdDao, CzzZyaqZd> {

	public CzzZyaqZd get(String id) {
		return super.get(id);
	}
	
	public List<CzzZyaqZd> findList(CzzZyaqZd czzZyaqZd) {
		return super.findList(czzZyaqZd);
	}
	
	public Page<CzzZyaqZd> findPage(Page<CzzZyaqZd> page, CzzZyaqZd czzZyaqZd) {
		return super.findPage(page, czzZyaqZd);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzZyaqZd czzZyaqZd) {
		super.save(czzZyaqZd);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzZyaqZd czzZyaqZd) {
		super.delete(czzZyaqZd);
	}
	
}