/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.awh_x.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.awh_x.entity.CzzAwhX;
import com.thinkgem.jeesite.modules.awh_x.dao.CzzAwhXDao;

/**
 * 新安委会Service
 * @author qyd
 * @version 2018-09-13
 */
@Service
@Transactional(readOnly = true)
public class CzzAwhXService extends CrudService<CzzAwhXDao, CzzAwhX> {

	public CzzAwhX get(String id) {
		return super.get(id);
	}
	
	public List<CzzAwhX> findList(CzzAwhX czzAwhX) {
		return super.findList(czzAwhX);
	}
	
	public Page<CzzAwhX> findPage(Page<CzzAwhX> page, CzzAwhX czzAwhX) {
		return super.findPage(page, czzAwhX);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzAwhX czzAwhX) {
		super.save(czzAwhX);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzAwhX czzAwhX) {
		super.delete(czzAwhX);
	}
	
}