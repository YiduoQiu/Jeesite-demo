/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.ndgzjh.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.ndgzjh.entity.CzzNdgzjh;
import com.thinkgem.jeesite.modules.ndgzjh.dao.CzzNdgzjhDao;

/**
 * 年度工作计划Service
 * @author qyd
 * @version 2018-07-12
 */
@Service
@Transactional(readOnly = true)
public class CzzNdgzjhService extends CrudService<CzzNdgzjhDao, CzzNdgzjh> {

	public CzzNdgzjh get(String id) {
		return super.get(id);
	}
	
	public List<CzzNdgzjh> findList(CzzNdgzjh czzNdgzjh) {
		return super.findList(czzNdgzjh);
	}
	
	public Page<CzzNdgzjh> findPage(Page<CzzNdgzjh> page, CzzNdgzjh czzNdgzjh) {
		return super.findPage(page, czzNdgzjh);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzNdgzjh czzNdgzjh) {
		super.save(czzNdgzjh);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzNdgzjh czzNdgzjh) {
		super.delete(czzNdgzjh);
	}
	
}