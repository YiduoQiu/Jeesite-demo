/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqglbm.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.aqglbm.entity.CzzAqglbm;
import com.thinkgem.jeesite.modules.aqglbm.dao.CzzAqglbmDao;

/**
 * 安全管理部门Service
 * @author qyd
 * @version 2018-08-08
 */
@Service
@Transactional(readOnly = true)
public class CzzAqglbmService extends CrudService<CzzAqglbmDao, CzzAqglbm> {

	public CzzAqglbm get(String id) {
		return super.get(id);
	}
	
	public List<CzzAqglbm> findList(CzzAqglbm czzAqglbm) {
		return super.findList(czzAqglbm);
	}
	
	public Page<CzzAqglbm> findPage(Page<CzzAqglbm> page, CzzAqglbm czzAqglbm) {
		return super.findPage(page, czzAqglbm);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzAqglbm czzAqglbm) {
		super.save(czzAqglbm);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzAqglbm czzAqglbm) {
		super.delete(czzAqglbm);
	}
	
}