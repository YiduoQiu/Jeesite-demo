/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqglry.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.aqglry.entity.CzzAqglry;
import com.thinkgem.jeesite.modules.aqglry.dao.CzzAqglryDao;

/**
 * 安全管理人员Service
 * @author qyd
 * @version 2018-08-08
 */
@Service
@Transactional(readOnly = true)
public class CzzAqglryService extends CrudService<CzzAqglryDao, CzzAqglry> {

	public CzzAqglry get(String id) {
		return super.get(id);
	}
	
	public List<CzzAqglry> findList(CzzAqglry czzAqglry) {
		return super.findList(czzAqglry);
	}
	
	public Page<CzzAqglry> findPage(Page<CzzAqglry> page, CzzAqglry czzAqglry) {
		return super.findPage(page, czzAqglry);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzAqglry czzAqglry) {
		super.save(czzAqglry);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzAqglry czzAqglry) {
		super.delete(czzAqglry);
	}
	
}