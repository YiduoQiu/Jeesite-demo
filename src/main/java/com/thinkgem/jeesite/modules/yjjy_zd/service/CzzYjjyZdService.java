/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.yjjy_zd.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.yjjy_zd.entity.CzzYjjyZd;
import com.thinkgem.jeesite.modules.yjjy_zd.dao.CzzYjjyZdDao;

/**
 * 应急救援制度Service
 * @author qyd
 * @version 2019-03-21
 */
@Service
@Transactional(readOnly = true)
public class CzzYjjyZdService extends CrudService<CzzYjjyZdDao, CzzYjjyZd> {

	public CzzYjjyZd get(String id) {
		return super.get(id);
	}
	
	public List<CzzYjjyZd> findList(CzzYjjyZd czzYjjyZd) {
		return super.findList(czzYjjyZd);
	}
	
	public Page<CzzYjjyZd> findPage(Page<CzzYjjyZd> page, CzzYjjyZd czzYjjyZd) {
		return super.findPage(page, czzYjjyZd);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzYjjyZd czzYjjyZd) {
		super.save(czzYjjyZd);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzYjjyZd czzYjjyZd) {
		super.delete(czzYjjyZd);
	}
	
}