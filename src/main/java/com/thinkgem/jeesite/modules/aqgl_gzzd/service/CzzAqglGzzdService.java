/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqgl_gzzd.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.aqgl_gzzd.entity.CzzAqglGzzd;
import com.thinkgem.jeesite.modules.aqgl_gzzd.dao.CzzAqglGzzdDao;

/**
 * 安全管理规章制度Service
 * @author qyd
 * @version 2018-08-13
 */
@Service
@Transactional(readOnly = true)
public class CzzAqglGzzdService extends CrudService<CzzAqglGzzdDao, CzzAqglGzzd> {

	public CzzAqglGzzd get(String id) {
		return super.get(id);
	}
	
	public List<CzzAqglGzzd> findList(CzzAqglGzzd czzAqglGzzd) {
		return super.findList(czzAqglGzzd);
	}
	
	public Page<CzzAqglGzzd> findPage(Page<CzzAqglGzzd> page, CzzAqglGzzd czzAqglGzzd) {
		return super.findPage(page, czzAqglGzzd);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzAqglGzzd czzAqglGzzd) {
		super.save(czzAqglGzzd);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzAqglGzzd czzAqglGzzd) {
		super.delete(czzAqglGzzd);
	}
	
}