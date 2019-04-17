/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.dngzzj.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.dngzzj.entity.CzzNdgzzj;
import com.thinkgem.jeesite.modules.dngzzj.dao.CzzNdgzzjDao;

/**
 * 年度工作总结Service
 * @author qyd
 * @version 2018-12-17
 */
@Service
@Transactional(readOnly = true)
public class CzzNdgzzjService extends CrudService<CzzNdgzzjDao, CzzNdgzzj> {

	public CzzNdgzzj get(String id) {
		return super.get(id);
	}
	
	public List<CzzNdgzzj> findList(CzzNdgzzj czzNdgzzj) {
		return super.findList(czzNdgzzj);
	}
	
	public Page<CzzNdgzzj> findPage(Page<CzzNdgzzj> page, CzzNdgzzj czzNdgzzj) {
		return super.findPage(page, czzNdgzzj);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzNdgzzj czzNdgzzj) {
		super.save(czzNdgzzj);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzNdgzzj czzNdgzzj) {
		super.delete(czzNdgzzj);
	}
	
}