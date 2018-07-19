/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.zyaq.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.zyaq.entity.CzzZyaq;
import com.thinkgem.jeesite.modules.zyaq.dao.CzzZyaqDao;

/**
 * 作业安全Service
 * @author qyd
 * @version 2018-07-17
 */
@Service
@Transactional(readOnly = true)
public class CzzZyaqService extends CrudService<CzzZyaqDao, CzzZyaq> {

	public CzzZyaq get(String id) {
		return super.get(id);
	}
	
	public List<CzzZyaq> findList(CzzZyaq czzZyaq) {
		return super.findList(czzZyaq);
	}
	
	public Page<CzzZyaq> findPage(Page<CzzZyaq> page, CzzZyaq czzZyaq) {
		return super.findPage(page, czzZyaq);
	}
	
	@Transactional(readOnly = false)
	public void save(CzzZyaq czzZyaq) {
		super.save(czzZyaq);
	}
	
	@Transactional(readOnly = false)
	public void delete(CzzZyaq czzZyaq) {
		super.delete(czzZyaq);
	}
	
}