/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqgl_zrz.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.aqgl_zrz.entity.CzzAqglZrz;
import com.thinkgem.jeesite.modules.aqgl_zrz.dao.CzzAqglZrzDao;

/**
 * 安全管理责任制Service
 * @author qyd
 * @version 2018-08-13
 */
@Service
@Transactional(readOnly = true)
public class CzzAqglZrzService extends CrudService<CzzAqglZrzDao, CzzAqglZrz> {

	public CzzAqglZrz get(String id) {
		return super.get(id);
	}
	
	public List<CzzAqglZrz> findList(CzzAqglZrz czzAqglZrz) {
		return super.findList(czzAqglZrz);
	}
	
	public Page<CzzAqglZrz> findPage(Page<CzzAqglZrz> page, CzzAqglZrz czzAqglZrz) {
		return super.findPage(page, czzAqglZrz);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzAqglZrz czzAqglZrz) {
		super.save(czzAqglZrz);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzAqglZrz czzAqglZrz) {
		super.delete(czzAqglZrz);
	}
	
}