/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.aqkh.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.aqkh.entity.CzzAqkh;
import com.thinkgem.jeesite.modules.aqkh.dao.CzzAqkhDao;

/**
 * 安全考核Service
 * @author qyd
 * @version 2018-07-16
 */
@Service
@Transactional(readOnly = true)
public class CzzAqkhService extends CrudService<CzzAqkhDao, CzzAqkh> {

	public CzzAqkh get(String id) {
		return super.get(id);
	}
	
	public List<CzzAqkh> findList(CzzAqkh czzAqkh) {
		return super.findList(czzAqkh);
	}
	
	public Page<CzzAqkh> findPage(Page<CzzAqkh> page, CzzAqkh czzAqkh) {
		return super.findPage(page, czzAqkh);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzAqkh czzAqkh) {
		super.save(czzAqkh);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzAqkh czzAqkh) {
		super.delete(czzAqkh);
	}
	
}