/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqsc_czgc.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.aqsc_czgc.entity.CzzAqglCzgc;
import com.thinkgem.jeesite.modules.aqsc_czgc.dao.CzzAqglCzgcDao;

/**
 * 安全生产操作规程Service
 * @author qyd
 * @version 2018-08-13
 */
@Service
@Transactional(readOnly = true)
public class CzzAqglCzgcService extends CrudService<CzzAqglCzgcDao, CzzAqglCzgc> {

	public CzzAqglCzgc get(String id) {
		return super.get(id);
	}
	
	public List<CzzAqglCzgc> findList(CzzAqglCzgc czzAqglCzgc) {
		return super.findList(czzAqglCzgc);
	}
	
	public Page<CzzAqglCzgc> findPage(Page<CzzAqglCzgc> page, CzzAqglCzgc czzAqglCzgc) {
		return super.findPage(page, czzAqglCzgc);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzAqglCzgc czzAqglCzgc) {
		super.save(czzAqglCzgc);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzAqglCzgc czzAqglCzgc) {
		super.delete(czzAqglCzgc);
	}
	
}